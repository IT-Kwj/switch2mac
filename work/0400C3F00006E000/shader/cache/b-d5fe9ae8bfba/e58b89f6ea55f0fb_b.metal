#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1949 = false;
    bool _412 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2248 = as_type<float>(_116);
        out.gl_Position.z = _2248;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_100);
        _110 = _138;
    }
    float _140 = _110;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2318 = as_type<float>(_154);
        out.gl_Position.z = _2318;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_51.w;
    float _158 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = in.m_44.x;
    float _178 = in.m_44.y;
    float _180 = in.m_44.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_53.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_100);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    bool _328 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_306);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_322;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _344;
    float _348 = 1.0 / _326;
    bool _350 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _352 = _338 * _342;
    float _354 = -_338;
    float _356 = _354 + 1.0;
    float _358 = _310 * _348;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = fma(_346, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _366;
    float _370 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _364 * _352;
    float _374 = fma(_368, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = _370 * _352;
    float _378 = _374 * _352;
    float _380 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _378);
    float _384 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _386 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].x, _380);
    float _388 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].y, _382);
    float _390 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].z, _384);
    bool _392 = !_350;
    float _410;
    if (!_392)
    {
        float _394 = in.m_53.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        float _414 = float(_100);
        float _416 = 1.0 / _414;
        float _418 = _134 * _416;
        _410 = _418;
    }
    _412 = false;
    float _420 = _410;
    float _422 = in.m_53.x;
    float _424 = in.m_53.y;
    float _426 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _428 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _430 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _432 = in.m_53.z;
    float _434 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _426);
    float _436 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
    float _438 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _430);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _442 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _434);
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _454 = _452 != 0;
    float _456 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _458 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _438);
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _462 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _464 = log2(_462);
    float _466 = _456 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _468 = _442 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _470 = _458 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _474 = _466 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _478 = _468 + _476;
    float _480 = _422 * 2.0;
    float _482 = _424 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _484 = _422 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _486 = _432 * 2.0;
    float _488 = _424 + _432;
    float _490 = floor(_480);
    float _492 = fma(_482, -2.0, _440);
    float _494 = _488 + (-1.0);
    float _496 = -_460;
    float _498 = fma(_484, 2.0, _496);
    float _500 = _464 * _134;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _504 = _470 + _502;
    float _506 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _508 = floor(_486);
    bool _510 = !_450;
    int _512 = _510 ? 0 : 1;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _518 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _492);
    float _520 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[78].w, _516);
    bool _522 = _490 > 0.0;
    float _524 = exp2(_500);
    bool _526 = _490 >= 0.0;
    bool _528 = isnan(_490);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = _424 * 2.0;
    float _538 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _520);
    int _540 = _534 ? 0 : 1;
    bool _542 = _508 > 0.0;
    float _544 = floor(_536);
    int _546 = ~_540;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    float _552 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[78].z, _514);
    bool _554 = _508 >= 0.0;
    bool _556 = isnan(_508);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    int _564 = abs(_512);
    float _566 = _432 + _422;
    int _568 = _550;
    if (!_522)
    {
        int _570 = ~_540;
        int _572 = _570 + 1;
        _568 = _572;
    }
    int _574 = _568;
    float _576 = -_524;
    float _578 = _576 + 1.0;
    float _580 = float(_564);
    float _582 = _566 + (-1.0);
    float _584 = float(_574);
    float _586 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _552);
    float _588 = _432 + (-0.5);
    int _590 = _562 ? 0 : 1;
    float _592 = _580 * _584;
    float _594 = _474 * _474;
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _598 = fma(_478, _478, _594);
    int _600 = ~_590;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    int _606 = _604;
    if (!_542)
    {
        int _608 = ~_590;
        int _610 = _608 + 1;
        _606 = _610;
    }
    int _612 = _606;
    float _614 = fma(_504, _504, _598);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _618 = 1.0 + _616;
    bool _620 = _544 > 0.0;
    float _622 = rsqrt(_614);
    bool _624 = _544 >= 0.0;
    bool _626 = isnan(_544);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = in.m_55.x;
    float _636 = in.m_55.y;
    float _638 = in.m_55.z;
    bool _640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _642 = isnan(1.0);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _648 = _644 || _646;
    bool _650 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _658 = _654 || _656;
    float _660 = 1.0 / _618;
    bool _662 = !_446;
    int _664 = _662 ? 0 : 1;
    float _666 = _592 * (-2.0);
    float _668 = _658 ? _578 : 0.0;
    int _670 = abs(_664);
    int _672 = _632 ? 0 : 1;
    float _674 = _474 * _622;
    float _676 = -_134;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[76].x, _498);
    float _680 = _478 * _622;
    float _682 = _504 * _622;
    int _684 = ~_672;
    int _686 = _684 + 1;
    int _688 = _686 + 1;
    float _690 = -_680;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _478);
    float _694 = float(_670);
    int _696 = _688;
    float _698 = as_type<float>(_670);
    float _700 = _682;
    if (_648)
    {
        float _702 = _668 * _660;
        _136 = _702;
    }
    float _704 = _136;
    float _706 = -_674;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _474);
    float _710 = fma(_506, _666, _506);
    bool _712 = !_454;
    int _714 = _712 ? 0 : 1;
    float _716 = fma(_666, _636, _636);
    float _718 = _708 * _708;
    float _720 = float(_612);
    float _722 = _424 + (-0.5);
    float _724 = -_682;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _504);
    float _728 = fma(_692, _692, _718);
    if (!_620)
    {
        int _730 = ~_672;
        int _732 = _730 + 1;
        _696 = _732;
    }
    int _734 = _696;
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[196].y, _716);
    int _738 = abs(_714);
    float _740 = fma(_726, _726, _728);
    float _742 = _694 * _720;
    float _744 = float(_734);
    float _746 = _424 + _422;
    float _748 = float(_738);
    float _750 = fma(_710, _704, _736);
    float _752 = _742 * (-2.0);
    float _754 = _746 + (-1.0);
    float _756 = _748 * _744;
    float _758 = _422 + (-0.5);
    float _760 = fma(_752, _634, _634);
    float _762 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _764 = _756 * (-2.0);
    float _766 = _750 * 0.15915493667125701904296875;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[196].x, _760);
    float _770 = fma(_762, _752, _762);
    float _772 = fma(_596, _764, _596);
    float _774 = fma(_764, _638, _638);
    float _776 = _766 * 6.283185482025146484375;
    float _778 = sin(_776);
    float _780 = fma(_770, _704, _768);
    float _782 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _784 = in.m_51.x;
    float _786 = in.m_51.y;
    float _788 = in.m_51.z;
    float _790 = _780 * 0.15915493667125701904296875;
    float _792 = fma(_772, _704, _782);
    float _794 = _766 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _792 * 0.15915493667125701904296875;
    float _800 = in.m_57.x;
    float _802 = in.m_57.y;
    float _804 = in.m_57.z;
    float _806 = _790 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _790 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = _388 * _786;
    float _816 = _390 * _788;
    float _818 = _386 * _784;
    float _820 = _798 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _808 * _778;
    float _826 = _808 * _796;
    float _828 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _830 = _816 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _802);
    float _834 = sqrt(_740);
    float _836 = _812 * _796;
    float _838 = _812 * _778;
    float _840 = _798 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _808 * _822;
    float _846 = _796 * _822;
    float _848 = _812 * _822;
    float _850 = _778 * _822;
    float _852 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _800);
    float _856 = _622 * _834;
    float _858 = _852 * _856;
    float _860 = _828 * _856;
    float _862 = _830 * _856;
    float _864 = _858 * _832;
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _804);
    float _868 = _860 * _854;
    float _870 = fma(_842, _836, _824);
    float _872 = _848 * _864;
    float _874 = _862 * _866;
    float _876 = -_826;
    float _878 = fma(_842, _838, _876);
    float _880 = -_864;
    float _882 = _842 * _880;
    float _884 = fma(_870, _868, _872);
    float _886 = -_838;
    float _888 = fma(_842, _826, _886);
    float _890 = _844 * _864;
    float _892 = fma(_846, _868, _882);
    float _894 = fma(_878, _874, _884);
    float _896 = fma(_842, _824, _836);
    float _898 = fma(_888, _868, _890);
    float _900 = fma(_850, _874, _892);
    float _902 = _894 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _904 = _894 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _906 = fma(_896, _874, _898);
    float _908 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[10].x, _902);
    float _910 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].x, _904);
    float _912 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[10].z, _908);
    float _914 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[8].z, _910);
    float _916 = _470 + _912;
    float _918 = _468 + _914;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _916 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _926 = _918 + _924;
    float _928 = _922 * _922;
    float _930 = fma(_926, _926, _928);
    float _932 = _894 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _934 = sqrt(_930);
    float _936 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[9].x, _932);
    float _938 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[9].z, _936);
    float _940 = _466 + _938;
    bool _942 = _934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _944 = _900;
    float _946 = _856;
    float _948 = _918;
    float _950 = _940;
    if (!_942)
    {
        _944 = _916;
    }
    float _952 = _944;
    float _954 = _952;
    if (!_942)
    {
        _946 = _940;
    }
    float _956 = _946;
    bool _958 = !_942;
    float _960 = _956;
    if (!_958)
    {
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _966 = _934 + _964;
        float _968 = rsqrt(_930);
        float _970 = _966 * _962;
        float _972 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _970 * 0.15915493667125701904296875;
        float _976 = _974 * 6.283185482025146484375;
        float _978 = sin(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = cos(_980);
        float _984 = fma(_978, _972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _986 = _968 * _984;
        float _988 = _982 + (-1.0);
        float _990 = fma(_926, _986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _992 = fma(_922, _986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _994 = _988 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = fma(_940, _982, _994);
        _960 = _996;
        _948 = _990;
        _954 = _992;
    }
    float _998 = _960;
    float _1000 = _948;
    float _1002 = _954;
    float _1004 = -_674;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _998);
    float _1008 = -_680;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1000);
    float _1012 = -_682;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1002);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1022 = _1010 + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1026 = _1014 + _1024;
    float _1028 = _1018 * _1018;
    float _1030 = fma(_1022, _1022, _1028);
    float _1032 = fma(_1026, _1026, _1030);
    float _1034 = rsqrt(_1032);
    float _1036 = sqrt(_1032);
    float _1038 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1040 = _1022 * _1038;
    float _1042 = _1026 * _1038;
    float _1044 = _1040 * _1040;
    float _1046 = _1042 * _1042;
    float _1048 = _1044 + _1046;
    float _1050 = sqrt(_1048);
    bool _1052 = _1050 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1056 = _1050 + _1054;
    float _1058 = _1026;
    float _1060 = _1048;
    float _1062 = _1056;
    float _1064 = _1018;
    if (_1052)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1058 = _1066;
    }
    float _1068 = _1058;
    if (_1052)
    {
        float _1070 = rsqrt(_1048);
        _1060 = _1070;
    }
    float _1072 = _1060;
    if (_1052)
    {
        float _1074 = _1056 * _1068;
        _1062 = _1074;
    }
    float _1076 = _1062;
    if (_1052)
    {
        float _1078 = _1076 * 0.15915493667125701904296875;
        _950 = _1078;
    }
    float _1080 = _950;
    float _1082 = _1028;
    float _1084 = _1080;
    if (_1052)
    {
        float _1086 = _1080 * 6.283185482025146484375;
        float _1088 = sin(_1086);
        _1082 = _1088;
    }
    float _1090 = _1082;
    float _1092 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1094 = precise::max(0.0, _1092);
    float _1096 = _1034;
    float _1098 = _1094;
    float _1100 = _1092;
    if (_1052)
    {
        float _1102 = _1080 * 6.283185482025146484375;
        float _1104 = cos(_1102);
        _1096 = _1104;
    }
    float _1106 = _1096;
    float _1108 = -_1038;
    float _1110 = -_1094;
    float _1112 = fma(_1018, _1108, _1110);
    if (!_1052)
    {
        _1098 = _1040;
    }
    float _1114 = _1098;
    float _1116 = _1114;
    if (_1052)
    {
        float _1118 = _1112 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1118;
    }
    float _1120 = _1100;
    float _1122 = _1090;
    float _1124 = _1120;
    if (_1052)
    {
        float _1126 = fma(_1090, _1120, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1122 = _1126;
    }
    float _1128 = _1122;
    float _1130 = _1128;
    if (!_1052)
    {
        _1124 = _1112;
    }
    float _1132 = _1124;
    float _1134 = _1132;
    float _1136 = _1106;
    if (_1052)
    {
        float _1138 = _1106 + (-1.0);
        _1064 = _1138;
    }
    float _1140 = _1064;
    float _1142 = _1140;
    if (_1052)
    {
        float _1144 = _1072 * _1128;
        _698 = _1144;
    }
    float _1146 = _698;
    if (!_1052)
    {
        _1130 = _1044;
    }
    float _1148 = _1130;
    float _1150 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1152 = _1148;
    if (_1052)
    {
        float _1154 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1084 = _1154;
    }
    float _1156 = _1084;
    if (_1052)
    {
        float _1158 = _1040 * _1146;
        _1116 = _1158;
    }
    float _1160 = _1116;
    if (!_1052)
    {
        _1142 = _1042;
    }
    float _1162 = _1142;
    float _1164 = _1162;
    if (_1052)
    {
        float _1166 = _1042 * _1146;
        _1164 = _1166;
    }
    float _1168 = _1164;
    if (_1052)
    {
        float _1170 = fma(_1112, _1106, _1156);
        _1134 = _1170;
    }
    float _1172 = _1134;
    if (_1052)
    {
        float _1174 = _1160 * _1160;
        _1152 = _1174;
    }
    float _1176 = _1152;
    if (!_1052)
    {
        _1136 = _1046;
    }
    float _1178 = _1136;
    float _1180 = _1178;
    if (_1052)
    {
        float _1182 = _1168 * _1168;
        _1180 = _1182;
    }
    float _1184 = _1180;
    float _1186 = fma(_1172, _1172, _1176);
    float _1188 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1150);
    float _1190 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1192 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1194 = _1186 + _1184;
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1198 = fma(_1036, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1196);
    float _1200 = precise::clamp(_1198, 0.0, 1.0);
    float _1202 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1188);
    float _1204 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1190);
    float _1206 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1208 = -_1200;
    float _1210 = _1208 + 1.0;
    float _1212 = rsqrt(_1194);
    float _1214 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1216 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1204);
    float _1218 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1206);
    float _1220 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1214);
    float _1224 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1226 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1218);
    float _1228 = abs(_1210);
    float _1230 = log2(_1228);
    float _1232 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1222);
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1236 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1238 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1240 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1242 = -_1234;
    float _1244 = fma(_1242, _1192, 1.0);
    float _1246 = _1212 * _1160;
    float _1248 = _1212 * _1172;
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1240);
    float _1252 = _1212 * _1168;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1256 = log2(_1244);
    float _1258 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1250);
    float _1260 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1262 = -_1254;
    float _1264 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1262);
    float _1266 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1268 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1258);
    float _1270 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1272 = -_1252;
    float _1274 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1264);
    float _1276 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1260);
    float _1278 = 1.0 / _1268;
    float _1280 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1270);
    float _1282 = fma(_1274, -0.5, 0.5);
    float _1284 = fma(_1274, 0.5, 0.5);
    float _1286 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1276);
    float _1288 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1280);
    float _1290 = _1248 + 1.0;
    float _1292 = fma(_1284, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = exp2(_1266);
    float _1296 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1288);
    float _1298 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1286);
    float _1300 = fma(_1284, _1292, -0.212114393711090087890625);
    float _1302 = _1256 * 0.693147182464599609375;
    float _1304 = fma(_1284, _1300, 1.570728778839111328125);
    float _1306 = sqrt(_1282);
    float _1308 = _1296 * _1278;
    float _1310 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1312 = fma(_1308, 0.5, 0.5);
    float _1314 = -_1248;
    float _1316 = fma(_1294, _1290, _1314);
    float _1318 = _1298 * _1278;
    float _1320 = fma(_1316, 0.5, 0.5);
    float _1322 = fma(_1318, -0.5, 0.5);
    float _1324 = _1306 * 0.636619746685028076171875;
    float3 _4161 = float3(_1312, _1322, _1310);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4161, float3(0.0), isnan(_4161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4161, float3(0.0), isnan(_4161)), level(0.0)).x;
    float _1328 = -_1304;
    float _1330 = fma(_1324, _1328, 1.0);
    float3 _4177 = float3(_1312, _1322, _1310);
    float4 _1333 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4177, float3(0.0), isnan(_4177)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4177, float3(0.0), isnan(_4177)), level(0.0)).xyzw;
    float _1335 = _1333.x;
    float _1337 = _1333.y;
    float _1339 = _1333.z;
    float _1341 = _1333.w;
    float2 _4194 = float2(_1330, _1320);
    float3 _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4194, float2(0.0), isnan(_4194)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4194, float2(0.0), isnan(_4194)), level(0.0)).xyz;
    float _1347 = _1345.x;
    float _1349 = _1345.y;
    float _1351 = _1345.z;
    float _1353 = in.m_59.y;
    float _1355 = -_674;
    float _1357 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _466);
    float _1359 = in.m_61.z;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1363 = _1361 != 0;
    float _1365 = -_680;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1371 = _1369 != 0;
    float _1373 = in.m_61.x;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1379 = _424 > 0.5;
    float _1381 = -_682;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _470);
    float _1385 = in.m_61.w;
    float _1387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1389 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1391 = isnan(_420);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = in.m_61.y;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1407 = _1310;
    float _1409 = _1387;
    float _1411 = _1268;
    float _1413 = _1298;
    float _1415 = _1296;
    if (_1371)
    {
        float _1417 = in.m_53.x;
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = 1.0 / _1377;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1425 = -_1353;
    float _1427 = _1425 + 1.0;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1435 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.z = _1359;
    float _1437 = _1353;
    if (_1363)
    {
        float _1439 = _1379 ? _1427 : _1353;
        _1437 = _1439;
    }
    float _1441 = _1437;
    float _1443 = 1.0 / _1405;
    out.m_63.x = _1373;
    float _1445 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1451 = _1449 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_63.w = _1385;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1453;
    bool _1457 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1459 = isnan(_420);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = _1451 * _1421;
    out.m_63.y = _1401;
    float _1471 = 1.0 / _1433;
    float _1473 = -_1467;
    float _1475 = _1473 + 1.0;
    bool _1477 = _1419 > 0.5;
    bool _1479 = _1477 && _1371;
    float _1481 = in.m_59.x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1485 = _1455 * _1443;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1487;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1493 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1495 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1497 = isnan(_420);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1503 = _1499 || _1501;
    float _1505 = float(_1503);
    float _1507 = -_1399;
    float _1509 = _1507 + 1.0;
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1513 = _802 != 0.0;
    bool _1515 = isnan(_802);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan(0.0);
    bool _1521 = _1517 || _1519;
    float _1523 = _1505 * _1509;
    float _1525 = _1489 * _1471;
    out.m_65.x = _1435;
    out.m_65.y = _1445;
    out.m_65.z = _1493;
    out.m_65.w = _1511;
    float _1527 = -_1505;
    float _1529 = _1527 + 1.0;
    bool _1531 = _800 == 0.0;
    bool _1533 = !_1521;
    bool _1535 = _1531 && _1533;
    float _1537 = exp2(_1447);
    bool _1539 = _804 == 0.0;
    bool _1541 = _1539 && _1535;
    float _1543 = _1481;
    if (_1371)
    {
        _700 = _1481;
    }
    float _1545 = _700;
    float _1547 = _1399 * _1475;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1551 = _420 + _1549;
    float _1553 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1555 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1557 = isnan(_420);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = _1545;
    float _1569 = _1547;
    if (_1479)
    {
        float _1571 = -_1545;
        float _1573 = _1571 + 1.0;
        _1567 = _1573;
    }
    float _1575 = _1567;
    float _1577 = fma(_1485, _1551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1579 = fma(_1553, _1441, -0.5);
    float _1581 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1583 = _1565 * _1529;
    if (_1371)
    {
        _1543 = _1575;
    }
    float _1585 = _1543;
    float _1587 = -_518;
    float _1589 = fma(_538, _1579, _1587);
    float _1591 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1581);
    float _1593 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1595 = _1577 * _1583;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1599 = _420 + _1597;
    float _1601 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1591);
    float _1603 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1593);
    float _1605 = in.m_67.x;
    float _1607 = in.m_67.y;
    float _1609 = in.m_67.z;
    bool _1611 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1613 = isnan(0.5);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1619 = _1615 || _1617;
    float _1621 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1623 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1603);
    float _1625 = -_1565;
    float _1627 = _1625 + 1.0;
    float _1629 = fma(_1469, _1599, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1631 = 1.0 / _1621;
    float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1635 = _420 + _1633;
    float _1637 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1595);
    float _1639 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1641 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1643 = fma(_1525, _1635, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1645 = fma(_1629, _1523, _1637);
    float _1647 = _1639 + _1621;
    float _1649 = fma(_1641, _1585, -0.5);
    float _1651 = -_1537;
    float _1653 = _1651 + 1.0;
    float _1655 = fma(_1643, _1547, _1645);
    if (!_1619)
    {
        _1569 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1657 = _1569;
    float _1659 = fma(_586, _1649, _678);
    float _1661 = _1589 + 0.5;
    float _1663 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1655);
    float _1665 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1667 = _1647 * _1631;
    float _1669 = _1667 * 0.5;
    float _1671 = _1659 + 0.5;
    float _1673 = _1605;
    float _1675 = _1607;
    float _1677 = _1657;
    float _1679 = _1669;
    float _1681 = _1609;
    float _1683 = _1671;
    if (!_1541)
    {
        float _1685 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1605);
        _1673 = _1685;
    }
    float _1687 = _1673;
    if (!_1541)
    {
        float _1689 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1607);
        _1675 = _1689;
    }
    float _1691 = _1675;
    if (!_1619)
    {
        float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1695 = fma(_1669, _1657, _1693);
        _1677 = _1695;
    }
    float _1697 = _1677;
    if (!_1619)
    {
        _1679 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1699 = _1679;
    if (!_1541)
    {
        float _1701 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1609);
        _1681 = _1701;
    }
    float _1703 = _1681;
    float _1705 = _848 * _1691;
    float _1707 = _1697;
    if (!_1619)
    {
        float _1709 = 1.0 / _1697;
        _1707 = _1709;
    }
    float _1711 = _1707;
    if (!_1619)
    {
        float _1713 = -_1699;
        float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1409 = _1715;
    }
    float _1717 = _1409;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1723 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1725 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1729 = _1621;
    if (!_1619)
    {
        float _1731 = 1.0 / _1717;
        _1729 = _1731;
    }
    float _1733 = _1729;
    float _1735 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1737 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1741 = -_1691;
    float _1743 = _842 * _1741;
    float _1745 = fma(_870, _1687, _1705);
    float _1747 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1723);
    float _1749 = _844 * _1691;
    float _1751 = fma(_846, _1687, _1743);
    float _1753 = fma(_878, _1703, _1745);
    out.m_69.x = _1735;
    out.m_69.y = _1737;
    out.m_69.z = _1739;
    out.m_69.w = _1725;
    float _1755 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1747);
    float _1757 = fma(_888, _1687, _1749);
    float _1759 = fma(_850, _1703, _1751);
    out.m_71.x = _1671;
    out.m_71.y = _1661;
    float _1761 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1755);
    float _1763 = fma(_896, _1703, _1757);
    bool _1765 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1767 = isnan(_1036);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1773 = _1769 || _1771;
    float _1775 = _1296 + _1268;
    float _1777 = _1761 + _1268;
    out.gl_Position.x = _1296;
    out.gl_Position.y = _1298;
    out.gl_Position.z = _1761;
    out.gl_Position.w = _1268;
    float _1779 = _1775 * 0.5;
    float _1781 = _1777 * 0.5;
    float _1783 = _1735;
    float _1785 = _1761;
    float _1787 = _1779;
    if (!_1619)
    {
        float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1791 = -_1699;
        float _1793 = fma(_1711, _1789, _1791);
        _1783 = _1793;
    }
    float _1795 = _1783;
    float _1797 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_1619)
    {
        _1683 = 1.0;
    }
    float _1799 = _1683;
    float _1801 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1803 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1805 = _1799;
    if (!_1619)
    {
        float _1807 = _1795 * _1733;
        float _1809 = precise::clamp(_1807, 0.0, 1.0);
        _1805 = _1809;
    }
    float _1811 = _1805;
    float _1813 = _1268 * 0.5;
    float _1815 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1797);
    float _1817 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1801);
    float _1819 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1803);
    float _1821 = fma(_1298, -0.5, _1813);
    float _1823 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1815);
    float _1825 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1817);
    float _1827 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1819);
    float _1829 = _1817;
    if (!_1773)
    {
        _1829 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1831 = _1829;
    out.m_73.x = _1823;
    out.m_73.y = _1825;
    out.m_73.z = _1827;
    float _1833 = _1831;
    float _1835 = _1831;
    if (!_1773)
    {
        _1411 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1837 = _1411;
    float _1839 = _1837;
    float _1841 = _1837;
    if (!_1773)
    {
        _1785 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1843 = _1785;
    out.m_75.x = _1779;
    out.m_75.y = _1821;
    out.m_75.z = _1781;
    out.m_75.w = _1268;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1773)
    {
        _1413 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1849 = _1413;
    float _1851 = _1849;
    float _1853 = _1849;
    if (!_1773)
    {
        _1415 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1855 = _1415;
    float _1857 = _1855;
    float _1859 = _1855;
    if (!_1773)
    {
        _1787 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1861 = _1787;
    float _1863 = _1665 * _1326;
    float _1865 = -_1665;
    float _1867 = _1865 + 1.0;
    float _1869 = _1341 * _1863;
    float _1871 = _1341 * _1867;
    float _1873 = _1351 * _1863;
    float _1875 = fma(_1347, _1869, _1335);
    float _1877 = fma(_1349, _1869, _1337);
    float _1879 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1881 = fma(_1341, _1873, _1339);
    out.m_77.x = _1875;
    out.m_77.y = _1877;
    out.m_77.z = _1881;
    out.m_77.w = _1871;
    bool _1883 = !_1773;
    float _1885 = _1861;
    float _1887 = _1861;
    if (!_1883)
    {
        bool _1889 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1891 = isnan(_1036);
        bool _1893 = _1889 || _1891;
        bool _1895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1897 = _1893 || _1895;
        if (!_1897)
        {
            float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1901 = _1036 + _1899;
            float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1905 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1903;
            float _1907 = 1.0 / _1905;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1927 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1929 = _1901 * _1907;
            float _1931 = precise::clamp(_1929, 0.0, 1.0);
            float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1937 = fma(_1931, _1911, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1939 = fma(_1931, _1935, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1941 = fma(_1931, _1915, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1943 = fma(_1931, _1919, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1945 = fma(_1931, _1923, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1947 = fma(_1931, _1927, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1887 = _1939;
            _1853 = _1945;
            _1835 = _1937;
            _1847 = _1943;
            _1841 = _1941;
            _1859 = _1947;
            _1949 = true;
        }
        else
        {
            bool _1951 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1953 = isnan(_1036);
            bool _1955 = _1951 || _1953;
            bool _1957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1959 = _1955 || _1957;
            if (!_1959)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1961 = _1833;
            _1835 = _1961;
            if (!_1959)
            {
                _1885 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1963 = _1885;
            _1887 = _1963;
            if (!_1959)
            {
                _1839 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1965 = _1839;
            _1841 = _1965;
            if (!_1959)
            {
                _1845 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1967 = _1845;
            _1847 = _1967;
            if (!_1959)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1969 = _1851;
            _1853 = _1969;
            if (!_1959)
            {
                _1857 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1971 = _1857;
            bool _1973 = !_1959;
            _1859 = _1971;
            if (!_1973)
            {
                bool _1975 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1977 = isnan(_1036);
                bool _1979 = _1975 || _1977;
                bool _1981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1983 = _1979 || _1981;
                if (!_1983)
                {
                    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1987 = _1036 + _1985;
                    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1991 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1989;
                    float _1993 = 1.0 / _1991;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2015 = _1987 * _1993;
                    float _2017 = precise::clamp(_2015, 0.0, 1.0);
                    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2023 = fma(_2017, _1997, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2025 = fma(_2017, _2021, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2027 = fma(_2017, _2001, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2029 = fma(_2017, _2005, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2031 = fma(_2017, _2009, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2033 = fma(_2017, _2013, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1887 = _2025;
                    _1853 = _2031;
                    _1835 = _2023;
                    _1847 = _2029;
                    _1841 = _2027;
                    _1859 = _2033;
                    _1949 = true;
                }
                else
                {
                    _1887 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1847 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1841 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1859 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1949 = false;
    float _2035 = _1887;
    float _2037 = _1853;
    float _2039 = _1835;
    float _2041 = _1847;
    float _2043 = _1841;
    float _2045 = _1859;
    float _2047 = fma(_1825, -0.5, 0.5);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    float _2051 = -_2035;
    float _2053 = _2051 + _2037;
    float _2055 = _1879 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2057 = -_2039;
    float _2059 = _2057 + _2041;
    float _2061 = fma(_2049, _2053, _2035);
    out.m_79.x = 0.0;
    float _2063 = -_2043;
    float _2065 = _2063 + _2045;
    float _2067 = fma(_2049, _2059, _2039);
    float _2069 = _2061 * 0.586610972881317138671875;
    out.m_47.x = _2055;
    bool _2071 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2073 = fma(_2049, _2065, _2043);
    float _2075 = fma(_2067, 0.298911988735198974609375, _2069);
    bool _2077 = _1811 > 0.0;
    bool _2079 = isnan(_1811);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_2073, 0.114477999508380889892578125, _2075);
    float _2089 = -_2087;
    float _2091 = _2067 + _2089;
    float _2093 = -_2087;
    float _2095 = _2061 + _2093;
    float _2097 = -_2087;
    float _2099 = _2073 + _2097;
    float _2101 = fma(_2091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2103 = fma(_2095, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2105 = fma(_2099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    bool _2107 = !_2071;
    if (!_2107)
    {
        float _2109 = -_1006;
        float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2113 = -_1010;
        float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2117 = -_1014;
        float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2121 = _2111 * _2111;
        float _2123 = fma(_2115, _2115, _2121);
        float _2125 = fma(_2119, _2119, _2123);
        float _2127 = sqrt(_2125);
        float _2129 = rsqrt(_2125);
        float _2131 = -_2127;
        float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2135 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        float _2139 = _2115 * _2129;
        float _2141 = _2111 * _2129;
        float _2143 = abs(_2137);
        float _2145 = log2(_2143);
        float _2147 = _2119 * _2129;
        float _2149 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2151 = _1825 * _2141;
        float _2153 = -_2141;
        float _2155 = -_2149;
        float _2157 = fma(_2153, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2155);
        float _2159 = fma(_1823, _2139, _2151);
        float _2161 = -_2147;
        float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2157);
        float _2165 = fma(_1827, _2147, _2159);
        float _2167 = precise::clamp(_2165, 0.0, 1.0);
        float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2171 = _2163 + _2169;
        float _2173 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2175 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = exp2(_2173);
        float _2181 = _2179 * _2177;
        float _2183 = _2167 * _2181;
        float _2185 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2187 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2189 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2185;
        out.m_79.y = _2187;
        out.m_79.z = _2189;
    }
    out.m_81.x = _2101;
    out.m_81.y = _2103;
    out.m_81.z = _2105;
    if (_2085)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2191 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2191;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1949 = false;
    bool _412 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2248 = as_type<float>(_116);
        out.gl_Position.z = _2248;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_100);
        _110 = _138;
    }
    float _140 = _110;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2318 = as_type<float>(_154);
        out.gl_Position.z = _2318;
    }
    if (_146)
    {
        return out;
    }
    float _156 = in.m_51.w;
    float _158 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = in.m_44.x;
    float _178 = in.m_44.y;
    float _180 = in.m_44.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_53.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_100);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    bool _328 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_306);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_322;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _344;
    float _348 = 1.0 / _326;
    bool _350 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _352 = _338 * _342;
    float _354 = -_338;
    float _356 = _354 + 1.0;
    float _358 = _310 * _348;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = fma(_346, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _366;
    float _370 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _364 * _352;
    float _374 = fma(_368, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = _370 * _352;
    float _378 = _374 * _352;
    float _380 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _378);
    float _384 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _386 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].x, _380);
    float _388 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].y, _382);
    float _390 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].z, _384);
    bool _392 = !_350;
    float _410;
    if (!_392)
    {
        float _394 = in.m_53.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        float _414 = float(_100);
        float _416 = 1.0 / _414;
        float _418 = _134 * _416;
        _410 = _418;
    }
    _412 = false;
    float _420 = _410;
    float _422 = in.m_53.x;
    float _424 = in.m_53.y;
    float _426 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _428 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _430 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _432 = in.m_53.z;
    float _434 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _426);
    float _436 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
    float _438 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _430);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _442 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _434);
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _454 = _452 != 0;
    float _456 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _458 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _438);
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _462 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _464 = log2(_462);
    float _466 = _456 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _468 = _442 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _470 = _458 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _474 = _466 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _478 = _468 + _476;
    float _480 = _422 * 2.0;
    float _482 = _424 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _484 = _422 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _486 = _432 * 2.0;
    float _488 = _424 + _432;
    float _490 = floor(_480);
    float _492 = fma(_482, -2.0, _440);
    float _494 = _488 + (-1.0);
    float _496 = -_460;
    float _498 = fma(_484, 2.0, _496);
    float _500 = _464 * _134;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _504 = _470 + _502;
    float _506 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _508 = floor(_486);
    bool _510 = !_450;
    int _512 = _510 ? 0 : 1;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _518 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _492);
    float _520 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[78].w, _516);
    bool _522 = _490 > 0.0;
    float _524 = exp2(_500);
    bool _526 = _490 >= 0.0;
    bool _528 = isnan(_490);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = _424 * 2.0;
    float _538 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _520);
    int _540 = _534 ? 0 : 1;
    bool _542 = _508 > 0.0;
    float _544 = floor(_536);
    int _546 = ~_540;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    float _552 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[78].z, _514);
    bool _554 = _508 >= 0.0;
    bool _556 = isnan(_508);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    int _564 = abs(_512);
    float _566 = _432 + _422;
    int _568 = _550;
    if (!_522)
    {
        int _570 = ~_540;
        int _572 = _570 + 1;
        _568 = _572;
    }
    int _574 = _568;
    float _576 = -_524;
    float _578 = _576 + 1.0;
    float _580 = float(_564);
    float _582 = _566 + (-1.0);
    float _584 = float(_574);
    float _586 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _552);
    float _588 = _432 + (-0.5);
    int _590 = _562 ? 0 : 1;
    float _592 = _580 * _584;
    float _594 = _474 * _474;
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _598 = fma(_478, _478, _594);
    int _600 = ~_590;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    int _606 = _604;
    if (!_542)
    {
        int _608 = ~_590;
        int _610 = _608 + 1;
        _606 = _610;
    }
    int _612 = _606;
    float _614 = fma(_504, _504, _598);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _618 = 1.0 + _616;
    bool _620 = _544 > 0.0;
    float _622 = rsqrt(_614);
    bool _624 = _544 >= 0.0;
    bool _626 = isnan(_544);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = in.m_55.x;
    float _636 = in.m_55.y;
    float _638 = in.m_55.z;
    bool _640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _642 = isnan(1.0);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _648 = _644 || _646;
    bool _650 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _658 = _654 || _656;
    float _660 = 1.0 / _618;
    bool _662 = !_446;
    int _664 = _662 ? 0 : 1;
    float _666 = _592 * (-2.0);
    float _668 = _658 ? _578 : 0.0;
    int _670 = abs(_664);
    int _672 = _632 ? 0 : 1;
    float _674 = _474 * _622;
    float _676 = -_134;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[76].x, _498);
    float _680 = _478 * _622;
    float _682 = _504 * _622;
    int _684 = ~_672;
    int _686 = _684 + 1;
    int _688 = _686 + 1;
    float _690 = -_680;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _478);
    float _694 = float(_670);
    int _696 = _688;
    float _698 = as_type<float>(_670);
    float _700 = _682;
    if (_648)
    {
        float _702 = _668 * _660;
        _136 = _702;
    }
    float _704 = _136;
    float _706 = -_674;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _474);
    float _710 = fma(_506, _666, _506);
    bool _712 = !_454;
    int _714 = _712 ? 0 : 1;
    float _716 = fma(_666, _636, _636);
    float _718 = _708 * _708;
    float _720 = float(_612);
    float _722 = _424 + (-0.5);
    float _724 = -_682;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _504);
    float _728 = fma(_692, _692, _718);
    if (!_620)
    {
        int _730 = ~_672;
        int _732 = _730 + 1;
        _696 = _732;
    }
    int _734 = _696;
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[196].y, _716);
    int _738 = abs(_714);
    float _740 = fma(_726, _726, _728);
    float _742 = _694 * _720;
    float _744 = float(_734);
    float _746 = _424 + _422;
    float _748 = float(_738);
    float _750 = fma(_710, _704, _736);
    float _752 = _742 * (-2.0);
    float _754 = _746 + (-1.0);
    float _756 = _748 * _744;
    float _758 = _422 + (-0.5);
    float _760 = fma(_752, _634, _634);
    float _762 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _764 = _756 * (-2.0);
    float _766 = _750 * 0.15915493667125701904296875;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[196].x, _760);
    float _770 = fma(_762, _752, _762);
    float _772 = fma(_596, _764, _596);
    float _774 = fma(_764, _638, _638);
    float _776 = _766 * 6.283185482025146484375;
    float _778 = sin(_776);
    float _780 = fma(_770, _704, _768);
    float _782 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _784 = in.m_51.x;
    float _786 = in.m_51.y;
    float _788 = in.m_51.z;
    float _790 = _780 * 0.15915493667125701904296875;
    float _792 = fma(_772, _704, _782);
    float _794 = _766 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _792 * 0.15915493667125701904296875;
    float _800 = in.m_57.x;
    float _802 = in.m_57.y;
    float _804 = in.m_57.z;
    float _806 = _790 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _790 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = _388 * _786;
    float _816 = _390 * _788;
    float _818 = _386 * _784;
    float _820 = _798 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _808 * _778;
    float _826 = _808 * _796;
    float _828 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _830 = _816 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _802);
    float _834 = sqrt(_740);
    float _836 = _812 * _796;
    float _838 = _812 * _778;
    float _840 = _798 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _808 * _822;
    float _846 = _796 * _822;
    float _848 = _812 * _822;
    float _850 = _778 * _822;
    float _852 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _800);
    float _856 = _622 * _834;
    float _858 = _852 * _856;
    float _860 = _828 * _856;
    float _862 = _830 * _856;
    float _864 = _858 * _832;
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _804);
    float _868 = _860 * _854;
    float _870 = fma(_842, _836, _824);
    float _872 = _848 * _864;
    float _874 = _862 * _866;
    float _876 = -_826;
    float _878 = fma(_842, _838, _876);
    float _880 = -_864;
    float _882 = _842 * _880;
    float _884 = fma(_870, _868, _872);
    float _886 = -_838;
    float _888 = fma(_842, _826, _886);
    float _890 = _844 * _864;
    float _892 = fma(_846, _868, _882);
    float _894 = fma(_878, _874, _884);
    float _896 = fma(_842, _824, _836);
    float _898 = fma(_888, _868, _890);
    float _900 = fma(_850, _874, _892);
    float _902 = _894 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _904 = _894 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _906 = fma(_896, _874, _898);
    float _908 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[10].x, _902);
    float _910 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].x, _904);
    float _912 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[10].z, _908);
    float _914 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[8].z, _910);
    float _916 = _470 + _912;
    float _918 = _468 + _914;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _916 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _926 = _918 + _924;
    float _928 = _922 * _922;
    float _930 = fma(_926, _926, _928);
    float _932 = _894 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _934 = sqrt(_930);
    float _936 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[9].x, _932);
    float _938 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[9].z, _936);
    float _940 = _466 + _938;
    bool _942 = _934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _944 = _900;
    float _946 = _856;
    float _948 = _918;
    float _950 = _940;
    if (!_942)
    {
        _944 = _916;
    }
    float _952 = _944;
    float _954 = _952;
    if (!_942)
    {
        _946 = _940;
    }
    float _956 = _946;
    bool _958 = !_942;
    float _960 = _956;
    if (!_958)
    {
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _966 = _934 + _964;
        float _968 = rsqrt(_930);
        float _970 = _966 * _962;
        float _972 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _970 * 0.15915493667125701904296875;
        float _976 = _974 * 6.283185482025146484375;
        float _978 = sin(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = cos(_980);
        float _984 = fma(_978, _972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _986 = _968 * _984;
        float _988 = _982 + (-1.0);
        float _990 = fma(_926, _986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _992 = fma(_922, _986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _994 = _988 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = fma(_940, _982, _994);
        _960 = _996;
        _948 = _990;
        _954 = _992;
    }
    float _998 = _960;
    float _1000 = _948;
    float _1002 = _954;
    float _1004 = -_674;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _998);
    float _1008 = -_680;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1000);
    float _1012 = -_682;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1002);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1022 = _1010 + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1026 = _1014 + _1024;
    float _1028 = _1018 * _1018;
    float _1030 = fma(_1022, _1022, _1028);
    float _1032 = fma(_1026, _1026, _1030);
    float _1034 = rsqrt(_1032);
    float _1036 = sqrt(_1032);
    float _1038 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1040 = _1022 * _1038;
    float _1042 = _1026 * _1038;
    float _1044 = _1040 * _1040;
    float _1046 = _1042 * _1042;
    float _1048 = _1044 + _1046;
    float _1050 = sqrt(_1048);
    bool _1052 = _1050 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1056 = _1050 + _1054;
    float _1058 = _1026;
    float _1060 = _1048;
    float _1062 = _1056;
    float _1064 = _1018;
    if (_1052)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1058 = _1066;
    }
    float _1068 = _1058;
    if (_1052)
    {
        float _1070 = rsqrt(_1048);
        _1060 = _1070;
    }
    float _1072 = _1060;
    if (_1052)
    {
        float _1074 = _1056 * _1068;
        _1062 = _1074;
    }
    float _1076 = _1062;
    if (_1052)
    {
        float _1078 = _1076 * 0.15915493667125701904296875;
        _950 = _1078;
    }
    float _1080 = _950;
    float _1082 = _1028;
    float _1084 = _1080;
    if (_1052)
    {
        float _1086 = _1080 * 6.283185482025146484375;
        float _1088 = sin(_1086);
        _1082 = _1088;
    }
    float _1090 = _1082;
    float _1092 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1094 = precise::max(0.0, _1092);
    float _1096 = _1034;
    float _1098 = _1094;
    float _1100 = _1092;
    if (_1052)
    {
        float _1102 = _1080 * 6.283185482025146484375;
        float _1104 = cos(_1102);
        _1096 = _1104;
    }
    float _1106 = _1096;
    float _1108 = -_1038;
    float _1110 = -_1094;
    float _1112 = fma(_1018, _1108, _1110);
    if (!_1052)
    {
        _1098 = _1040;
    }
    float _1114 = _1098;
    float _1116 = _1114;
    if (_1052)
    {
        float _1118 = _1112 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1118;
    }
    float _1120 = _1100;
    float _1122 = _1090;
    float _1124 = _1120;
    if (_1052)
    {
        float _1126 = fma(_1090, _1120, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1122 = _1126;
    }
    float _1128 = _1122;
    float _1130 = _1128;
    if (!_1052)
    {
        _1124 = _1112;
    }
    float _1132 = _1124;
    float _1134 = _1132;
    float _1136 = _1106;
    if (_1052)
    {
        float _1138 = _1106 + (-1.0);
        _1064 = _1138;
    }
    float _1140 = _1064;
    float _1142 = _1140;
    if (_1052)
    {
        float _1144 = _1072 * _1128;
        _698 = _1144;
    }
    float _1146 = _698;
    if (!_1052)
    {
        _1130 = _1044;
    }
    float _1148 = _1130;
    float _1150 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1152 = _1148;
    if (_1052)
    {
        float _1154 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1084 = _1154;
    }
    float _1156 = _1084;
    if (_1052)
    {
        float _1158 = _1040 * _1146;
        _1116 = _1158;
    }
    float _1160 = _1116;
    if (!_1052)
    {
        _1142 = _1042;
    }
    float _1162 = _1142;
    float _1164 = _1162;
    if (_1052)
    {
        float _1166 = _1042 * _1146;
        _1164 = _1166;
    }
    float _1168 = _1164;
    if (_1052)
    {
        float _1170 = fma(_1112, _1106, _1156);
        _1134 = _1170;
    }
    float _1172 = _1134;
    if (_1052)
    {
        float _1174 = _1160 * _1160;
        _1152 = _1174;
    }
    float _1176 = _1152;
    if (!_1052)
    {
        _1136 = _1046;
    }
    float _1178 = _1136;
    float _1180 = _1178;
    if (_1052)
    {
        float _1182 = _1168 * _1168;
        _1180 = _1182;
    }
    float _1184 = _1180;
    float _1186 = fma(_1172, _1172, _1176);
    float _1188 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1150);
    float _1190 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1192 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1194 = _1186 + _1184;
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1198 = fma(_1036, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1196);
    float _1200 = precise::clamp(_1198, 0.0, 1.0);
    float _1202 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1188);
    float _1204 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1190);
    float _1206 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1208 = -_1200;
    float _1210 = _1208 + 1.0;
    float _1212 = rsqrt(_1194);
    float _1214 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1216 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1204);
    float _1218 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1206);
    float _1220 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1214);
    float _1224 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1226 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1218);
    float _1228 = abs(_1210);
    float _1230 = log2(_1228);
    float _1232 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1222);
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1236 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1238 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1240 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1242 = -_1234;
    float _1244 = fma(_1242, _1192, 1.0);
    float _1246 = _1212 * _1160;
    float _1248 = _1212 * _1172;
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1240);
    float _1252 = _1212 * _1168;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1256 = log2(_1244);
    float _1258 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1250);
    float _1260 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1262 = -_1254;
    float _1264 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1262);
    float _1266 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1268 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1258);
    float _1270 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1272 = -_1252;
    float _1274 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1264);
    float _1276 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1260);
    float _1278 = 1.0 / _1268;
    float _1280 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1270);
    float _1282 = fma(_1274, -0.5, 0.5);
    float _1284 = fma(_1274, 0.5, 0.5);
    float _1286 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1276);
    float _1288 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1280);
    float _1290 = _1248 + 1.0;
    float _1292 = fma(_1284, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = exp2(_1266);
    float _1296 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1288);
    float _1298 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1286);
    float _1300 = fma(_1284, _1292, -0.212114393711090087890625);
    float _1302 = _1256 * 0.693147182464599609375;
    float _1304 = fma(_1284, _1300, 1.570728778839111328125);
    float _1306 = sqrt(_1282);
    float _1308 = _1296 * _1278;
    float _1310 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1312 = fma(_1308, 0.5, 0.5);
    float _1314 = -_1248;
    float _1316 = fma(_1294, _1290, _1314);
    float _1318 = _1298 * _1278;
    float _1320 = fma(_1316, 0.5, 0.5);
    float _1322 = fma(_1318, -0.5, 0.5);
    float _1324 = _1306 * 0.636619746685028076171875;
    float3 _4161 = float3(_1312, _1322, _1310);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4161, float3(0.0), isnan(_4161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4161, float3(0.0), isnan(_4161)), level(0.0)).x;
    float _1328 = -_1304;
    float _1330 = fma(_1324, _1328, 1.0);
    float3 _4177 = float3(_1312, _1322, _1310);
    float4 _1333 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4177, float3(0.0), isnan(_4177)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4177, float3(0.0), isnan(_4177)), level(0.0)).xyzw;
    float _1335 = _1333.x;
    float _1337 = _1333.y;
    float _1339 = _1333.z;
    float _1341 = _1333.w;
    float2 _4194 = float2(_1330, _1320);
    float3 _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4194, float2(0.0), isnan(_4194)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4194, float2(0.0), isnan(_4194)), level(0.0)).xyz;
    float _1347 = _1345.x;
    float _1349 = _1345.y;
    float _1351 = _1345.z;
    float _1353 = in.m_59.y;
    float _1355 = -_674;
    float _1357 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _466);
    float _1359 = in.m_61.z;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1363 = _1361 != 0;
    float _1365 = -_680;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1371 = _1369 != 0;
    float _1373 = in.m_61.x;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1379 = _424 > 0.5;
    float _1381 = -_682;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _470);
    float _1385 = in.m_61.w;
    float _1387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1389 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1391 = isnan(_420);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = in.m_61.y;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1407 = _1310;
    float _1409 = _1387;
    float _1411 = _1268;
    float _1413 = _1298;
    float _1415 = _1296;
    if (_1371)
    {
        float _1417 = in.m_53.x;
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = 1.0 / _1377;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1425 = -_1353;
    float _1427 = _1425 + 1.0;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1435 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.z = _1359;
    float _1437 = _1353;
    if (_1363)
    {
        float _1439 = _1379 ? _1427 : _1353;
        _1437 = _1439;
    }
    float _1441 = _1437;
    float _1443 = 1.0 / _1405;
    out.m_63.x = _1373;
    float _1445 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1451 = _1449 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_63.w = _1385;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1453;
    bool _1457 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1459 = isnan(_420);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = _1451 * _1421;
    out.m_63.y = _1401;
    float _1471 = 1.0 / _1433;
    float _1473 = -_1467;
    float _1475 = _1473 + 1.0;
    bool _1477 = _1419 > 0.5;
    bool _1479 = _1477 && _1371;
    float _1481 = in.m_59.x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1485 = _1455 * _1443;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1487;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1493 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1495 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1497 = isnan(_420);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1503 = _1499 || _1501;
    float _1505 = float(_1503);
    float _1507 = -_1399;
    float _1509 = _1507 + 1.0;
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1513 = _802 != 0.0;
    bool _1515 = isnan(_802);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan(0.0);
    bool _1521 = _1517 || _1519;
    float _1523 = _1505 * _1509;
    float _1525 = _1489 * _1471;
    out.m_65.x = _1435;
    out.m_65.y = _1445;
    out.m_65.z = _1493;
    out.m_65.w = _1511;
    float _1527 = -_1505;
    float _1529 = _1527 + 1.0;
    bool _1531 = _800 == 0.0;
    bool _1533 = !_1521;
    bool _1535 = _1531 && _1533;
    float _1537 = exp2(_1447);
    bool _1539 = _804 == 0.0;
    bool _1541 = _1539 && _1535;
    float _1543 = _1481;
    if (_1371)
    {
        _700 = _1481;
    }
    float _1545 = _700;
    float _1547 = _1399 * _1475;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1551 = _420 + _1549;
    float _1553 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1555 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1557 = isnan(_420);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = _1545;
    float _1569 = _1547;
    if (_1479)
    {
        float _1571 = -_1545;
        float _1573 = _1571 + 1.0;
        _1567 = _1573;
    }
    float _1575 = _1567;
    float _1577 = fma(_1485, _1551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1579 = fma(_1553, _1441, -0.5);
    float _1581 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1583 = _1565 * _1529;
    if (_1371)
    {
        _1543 = _1575;
    }
    float _1585 = _1543;
    float _1587 = -_518;
    float _1589 = fma(_538, _1579, _1587);
    float _1591 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1581);
    float _1593 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1595 = _1577 * _1583;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1599 = _420 + _1597;
    float _1601 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1591);
    float _1603 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1593);
    float _1605 = in.m_67.x;
    float _1607 = in.m_67.y;
    float _1609 = in.m_67.z;
    bool _1611 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1613 = isnan(0.5);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1619 = _1615 || _1617;
    float _1621 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1623 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1603);
    float _1625 = -_1565;
    float _1627 = _1625 + 1.0;
    float _1629 = fma(_1469, _1599, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1631 = 1.0 / _1621;
    float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1635 = _420 + _1633;
    float _1637 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1595);
    float _1639 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1641 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1643 = fma(_1525, _1635, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1645 = fma(_1629, _1523, _1637);
    float _1647 = _1639 + _1621;
    float _1649 = fma(_1641, _1585, -0.5);
    float _1651 = -_1537;
    float _1653 = _1651 + 1.0;
    float _1655 = fma(_1643, _1547, _1645);
    if (!_1619)
    {
        _1569 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1657 = _1569;
    float _1659 = fma(_586, _1649, _678);
    float _1661 = _1589 + 0.5;
    float _1663 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1655);
    float _1665 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1667 = _1647 * _1631;
    float _1669 = _1667 * 0.5;
    float _1671 = _1659 + 0.5;
    float _1673 = _1605;
    float _1675 = _1607;
    float _1677 = _1657;
    float _1679 = _1669;
    float _1681 = _1609;
    float _1683 = _1671;
    if (!_1541)
    {
        float _1685 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1605);
        _1673 = _1685;
    }
    float _1687 = _1673;
    if (!_1541)
    {
        float _1689 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1607);
        _1675 = _1689;
    }
    float _1691 = _1675;
    if (!_1619)
    {
        float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1695 = fma(_1669, _1657, _1693);
        _1677 = _1695;
    }
    float _1697 = _1677;
    if (!_1619)
    {
        _1679 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1699 = _1679;
    if (!_1541)
    {
        float _1701 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1609);
        _1681 = _1701;
    }
    float _1703 = _1681;
    float _1705 = _848 * _1691;
    float _1707 = _1697;
    if (!_1619)
    {
        float _1709 = 1.0 / _1697;
        _1707 = _1709;
    }
    float _1711 = _1707;
    if (!_1619)
    {
        float _1713 = -_1699;
        float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1409 = _1715;
    }
    float _1717 = _1409;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1723 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1725 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1729 = _1621;
    if (!_1619)
    {
        float _1731 = 1.0 / _1717;
        _1729 = _1731;
    }
    float _1733 = _1729;
    float _1735 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1737 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1741 = -_1691;
    float _1743 = _842 * _1741;
    float _1745 = fma(_870, _1687, _1705);
    float _1747 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1723);
    float _1749 = _844 * _1691;
    float _1751 = fma(_846, _1687, _1743);
    float _1753 = fma(_878, _1703, _1745);
    out.m_69.x = _1735;
    out.m_69.y = _1737;
    out.m_69.z = _1739;
    out.m_69.w = _1725;
    float _1755 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1747);
    float _1757 = fma(_888, _1687, _1749);
    float _1759 = fma(_850, _1703, _1751);
    out.m_71.x = _1671;
    out.m_71.y = _1661;
    float _1761 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1755);
    float _1763 = fma(_896, _1703, _1757);
    bool _1765 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1767 = isnan(_1036);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1773 = _1769 || _1771;
    float _1775 = _1296 + _1268;
    float _1777 = _1761 + _1268;
    out.gl_Position.x = _1296;
    out.gl_Position.y = _1298;
    out.gl_Position.z = _1761;
    out.gl_Position.w = _1268;
    float _1779 = _1775 * 0.5;
    float _1781 = _1777 * 0.5;
    float _1783 = _1735;
    float _1785 = _1761;
    float _1787 = _1779;
    if (!_1619)
    {
        float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1791 = -_1699;
        float _1793 = fma(_1711, _1789, _1791);
        _1783 = _1793;
    }
    float _1795 = _1783;
    float _1797 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_1619)
    {
        _1683 = 1.0;
    }
    float _1799 = _1683;
    float _1801 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1803 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1805 = _1799;
    if (!_1619)
    {
        float _1807 = _1795 * _1733;
        float _1809 = precise::clamp(_1807, 0.0, 1.0);
        _1805 = _1809;
    }
    float _1811 = _1805;
    float _1813 = _1268 * 0.5;
    float _1815 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1797);
    float _1817 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1801);
    float _1819 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1803);
    float _1821 = fma(_1298, -0.5, _1813);
    float _1823 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1815);
    float _1825 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1817);
    float _1827 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1819);
    float _1829 = _1817;
    if (!_1773)
    {
        _1829 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1831 = _1829;
    out.m_73.x = _1823;
    out.m_73.y = _1825;
    out.m_73.z = _1827;
    float _1833 = _1831;
    float _1835 = _1831;
    if (!_1773)
    {
        _1411 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1837 = _1411;
    float _1839 = _1837;
    float _1841 = _1837;
    if (!_1773)
    {
        _1785 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1843 = _1785;
    out.m_75.x = _1779;
    out.m_75.y = _1821;
    out.m_75.z = _1781;
    out.m_75.w = _1268;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1773)
    {
        _1413 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1849 = _1413;
    float _1851 = _1849;
    float _1853 = _1849;
    if (!_1773)
    {
        _1415 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1855 = _1415;
    float _1857 = _1855;
    float _1859 = _1855;
    if (!_1773)
    {
        _1787 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1861 = _1787;
    float _1863 = _1665 * _1326;
    float _1865 = -_1665;
    float _1867 = _1865 + 1.0;
    float _1869 = _1341 * _1863;
    float _1871 = _1341 * _1867;
    float _1873 = _1351 * _1863;
    float _1875 = fma(_1347, _1869, _1335);
    float _1877 = fma(_1349, _1869, _1337);
    float _1879 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1881 = fma(_1341, _1873, _1339);
    out.m_77.x = _1875;
    out.m_77.y = _1877;
    out.m_77.z = _1881;
    out.m_77.w = _1871;
    bool _1883 = !_1773;
    float _1885 = _1861;
    float _1887 = _1861;
    if (!_1883)
    {
        bool _1889 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1891 = isnan(_1036);
        bool _1893 = _1889 || _1891;
        bool _1895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1897 = _1893 || _1895;
        if (!_1897)
        {
            float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1901 = _1036 + _1899;
            float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1905 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1903;
            float _1907 = 1.0 / _1905;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1927 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1929 = _1901 * _1907;
            float _1931 = precise::clamp(_1929, 0.0, 1.0);
            float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1937 = fma(_1931, _1911, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1939 = fma(_1931, _1935, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1941 = fma(_1931, _1915, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1943 = fma(_1931, _1919, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1945 = fma(_1931, _1923, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1947 = fma(_1931, _1927, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1887 = _1939;
            _1853 = _1945;
            _1835 = _1937;
            _1847 = _1943;
            _1841 = _1941;
            _1859 = _1947;
            _1949 = true;
        }
        else
        {
            bool _1951 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1953 = isnan(_1036);
            bool _1955 = _1951 || _1953;
            bool _1957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1959 = _1955 || _1957;
            if (!_1959)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1961 = _1833;
            _1835 = _1961;
            if (!_1959)
            {
                _1885 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1963 = _1885;
            _1887 = _1963;
            if (!_1959)
            {
                _1839 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1965 = _1839;
            _1841 = _1965;
            if (!_1959)
            {
                _1845 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1967 = _1845;
            _1847 = _1967;
            if (!_1959)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1969 = _1851;
            _1853 = _1969;
            if (!_1959)
            {
                _1857 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1971 = _1857;
            bool _1973 = !_1959;
            _1859 = _1971;
            if (!_1973)
            {
                bool _1975 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1977 = isnan(_1036);
                bool _1979 = _1975 || _1977;
                bool _1981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1983 = _1979 || _1981;
                if (!_1983)
                {
                    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1987 = _1036 + _1985;
                    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1991 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1989;
                    float _1993 = 1.0 / _1991;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2015 = _1987 * _1993;
                    float _2017 = precise::clamp(_2015, 0.0, 1.0);
                    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2023 = fma(_2017, _1997, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2025 = fma(_2017, _2021, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2027 = fma(_2017, _2001, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2029 = fma(_2017, _2005, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2031 = fma(_2017, _2009, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2033 = fma(_2017, _2013, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1887 = _2025;
                    _1853 = _2031;
                    _1835 = _2023;
                    _1847 = _2029;
                    _1841 = _2027;
                    _1859 = _2033;
                    _1949 = true;
                }
                else
                {
                    _1887 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1847 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1841 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1859 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1949 = false;
    float _2035 = _1887;
    float _2037 = _1853;
    float _2039 = _1835;
    float _2041 = _1847;
    float _2043 = _1841;
    float _2045 = _1859;
    float _2047 = fma(_1825, -0.5, 0.5);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    float _2051 = -_2035;
    float _2053 = _2051 + _2037;
    float _2055 = _1879 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2057 = -_2039;
    float _2059 = _2057 + _2041;
    float _2061 = fma(_2049, _2053, _2035);
    out.m_79.x = 0.0;
    float _2063 = -_2043;
    float _2065 = _2063 + _2045;
    float _2067 = fma(_2049, _2059, _2039);
    float _2069 = _2061 * 0.586610972881317138671875;
    out.m_47.x = _2055;
    bool _2071 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2073 = fma(_2049, _2065, _2043);
    float _2075 = fma(_2067, 0.298911988735198974609375, _2069);
    bool _2077 = _1811 > 0.0;
    bool _2079 = isnan(_1811);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_2073, 0.114477999508380889892578125, _2075);
    float _2089 = -_2087;
    float _2091 = _2067 + _2089;
    float _2093 = -_2087;
    float _2095 = _2061 + _2093;
    float _2097 = -_2087;
    float _2099 = _2073 + _2097;
    float _2101 = fma(_2091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2103 = fma(_2095, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2105 = fma(_2099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    bool _2107 = !_2071;
    if (!_2107)
    {
        float _2109 = -_1006;
        float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2113 = -_1010;
        float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2117 = -_1014;
        float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2121 = _2111 * _2111;
        float _2123 = fma(_2115, _2115, _2121);
        float _2125 = fma(_2119, _2119, _2123);
        float _2127 = sqrt(_2125);
        float _2129 = rsqrt(_2125);
        float _2131 = -_2127;
        float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2135 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        float _2139 = _2115 * _2129;
        float _2141 = _2111 * _2129;
        float _2143 = abs(_2137);
        float _2145 = log2(_2143);
        float _2147 = _2119 * _2129;
        float _2149 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2151 = _1825 * _2141;
        float _2153 = -_2141;
        float _2155 = -_2149;
        float _2157 = fma(_2153, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2155);
        float _2159 = fma(_1823, _2139, _2151);
        float _2161 = -_2147;
        float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2157);
        float _2165 = fma(_1827, _2147, _2159);
        float _2167 = precise::clamp(_2165, 0.0, 1.0);
        float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2171 = _2163 + _2169;
        float _2173 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2175 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = exp2(_2173);
        float _2181 = _2179 * _2177;
        float _2183 = _2167 * _2181;
        float _2185 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2187 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2189 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2185;
        out.m_79.y = _2187;
        out.m_79.z = _2189;
    }
    out.m_81.x = _2101;
    out.m_81.y = _2103;
    out.m_81.z = _2105;
    if (_2085)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2191 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2191;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1949 = false;
    bool _412 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2248 = as_type<float>(_116);
        out.gl_Position.z = _2248;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_100);
        _110 = _138;
    }
    float _140 = _110;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2318 = as_type<float>(_154);
        out.gl_Position.z = _2318;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_51.w;
    float _158 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = in.m_44.x;
    float _178 = in.m_44.y;
    float _180 = in.m_44.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_53.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_100);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    bool _328 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_306);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_322;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _344;
    float _348 = 1.0 / _326;
    bool _350 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _352 = _338 * _342;
    float _354 = -_338;
    float _356 = _354 + 1.0;
    float _358 = _310 * _348;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = fma(_346, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _366;
    float _370 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _364 * _352;
    float _374 = fma(_368, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = _370 * _352;
    float _378 = _374 * _352;
    float _380 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _378);
    float _384 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _386 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].x, _380);
    float _388 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].y, _382);
    float _390 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].z, _384);
    bool _392 = !_350;
    float _410;
    if (!_392)
    {
        float _394 = in.m_53.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        float _414 = float(_100);
        float _416 = 1.0 / _414;
        float _418 = _134 * _416;
        _410 = _418;
    }
    _412 = false;
    float _420 = _410;
    float _422 = in.m_53.x;
    float _424 = in.m_53.y;
    float _426 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _428 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _430 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _432 = in.m_53.z;
    float _434 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _426);
    float _436 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
    float _438 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _430);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _442 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _434);
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _454 = _452 != 0;
    float _456 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _458 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _438);
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _462 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _464 = log2(_462);
    float _466 = _456 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _468 = _442 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _470 = _458 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _474 = _466 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _478 = _468 + _476;
    float _480 = _422 * 2.0;
    float _482 = _424 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _484 = _422 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _486 = _432 * 2.0;
    float _488 = _424 + _432;
    float _490 = floor(_480);
    float _492 = fma(_482, -2.0, _440);
    float _494 = _488 + (-1.0);
    float _496 = -_460;
    float _498 = fma(_484, 2.0, _496);
    float _500 = _464 * _134;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _504 = _470 + _502;
    float _506 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _508 = floor(_486);
    bool _510 = !_450;
    int _512 = _510 ? 0 : 1;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _518 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _492);
    float _520 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[78].w, _516);
    bool _522 = _490 > 0.0;
    float _524 = exp2(_500);
    bool _526 = _490 >= 0.0;
    bool _528 = isnan(_490);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = _424 * 2.0;
    float _538 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _520);
    int _540 = _534 ? 0 : 1;
    bool _542 = _508 > 0.0;
    float _544 = floor(_536);
    int _546 = ~_540;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    float _552 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[78].z, _514);
    bool _554 = _508 >= 0.0;
    bool _556 = isnan(_508);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    int _564 = abs(_512);
    float _566 = _432 + _422;
    int _568 = _550;
    if (!_522)
    {
        int _570 = ~_540;
        int _572 = _570 + 1;
        _568 = _572;
    }
    int _574 = _568;
    float _576 = -_524;
    float _578 = _576 + 1.0;
    float _580 = float(_564);
    float _582 = _566 + (-1.0);
    float _584 = float(_574);
    float _586 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _552);
    float _588 = _432 + (-0.5);
    int _590 = _562 ? 0 : 1;
    float _592 = _580 * _584;
    float _594 = _474 * _474;
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _598 = fma(_478, _478, _594);
    int _600 = ~_590;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    int _606 = _604;
    if (!_542)
    {
        int _608 = ~_590;
        int _610 = _608 + 1;
        _606 = _610;
    }
    int _612 = _606;
    float _614 = fma(_504, _504, _598);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _618 = 1.0 + _616;
    bool _620 = _544 > 0.0;
    float _622 = rsqrt(_614);
    bool _624 = _544 >= 0.0;
    bool _626 = isnan(_544);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = in.m_55.x;
    float _636 = in.m_55.y;
    float _638 = in.m_55.z;
    bool _640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _642 = isnan(1.0);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _648 = _644 || _646;
    bool _650 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _658 = _654 || _656;
    float _660 = 1.0 / _618;
    bool _662 = !_446;
    int _664 = _662 ? 0 : 1;
    float _666 = _592 * (-2.0);
    float _668 = _658 ? _578 : 0.0;
    int _670 = abs(_664);
    int _672 = _632 ? 0 : 1;
    float _674 = _474 * _622;
    float _676 = -_134;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[76].x, _498);
    float _680 = _478 * _622;
    float _682 = _504 * _622;
    int _684 = ~_672;
    int _686 = _684 + 1;
    int _688 = _686 + 1;
    float _690 = -_680;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _478);
    float _694 = float(_670);
    int _696 = _688;
    float _698 = as_type<float>(_670);
    float _700 = _682;
    if (_648)
    {
        float _702 = _668 * _660;
        _136 = _702;
    }
    float _704 = _136;
    float _706 = -_674;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _474);
    float _710 = fma(_506, _666, _506);
    bool _712 = !_454;
    int _714 = _712 ? 0 : 1;
    float _716 = fma(_666, _636, _636);
    float _718 = _708 * _708;
    float _720 = float(_612);
    float _722 = _424 + (-0.5);
    float _724 = -_682;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _504);
    float _728 = fma(_692, _692, _718);
    if (!_620)
    {
        int _730 = ~_672;
        int _732 = _730 + 1;
        _696 = _732;
    }
    int _734 = _696;
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[196].y, _716);
    int _738 = abs(_714);
    float _740 = fma(_726, _726, _728);
    float _742 = _694 * _720;
    float _744 = float(_734);
    float _746 = _424 + _422;
    float _748 = float(_738);
    float _750 = fma(_710, _704, _736);
    float _752 = _742 * (-2.0);
    float _754 = _746 + (-1.0);
    float _756 = _748 * _744;
    float _758 = _422 + (-0.5);
    float _760 = fma(_752, _634, _634);
    float _762 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _764 = _756 * (-2.0);
    float _766 = _750 * 0.15915493667125701904296875;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[196].x, _760);
    float _770 = fma(_762, _752, _762);
    float _772 = fma(_596, _764, _596);
    float _774 = fma(_764, _638, _638);
    float _776 = _766 * 6.283185482025146484375;
    float _778 = sin(_776);
    float _780 = fma(_770, _704, _768);
    float _782 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _784 = in.m_51.x;
    float _786 = in.m_51.y;
    float _788 = in.m_51.z;
    float _790 = _780 * 0.15915493667125701904296875;
    float _792 = fma(_772, _704, _782);
    float _794 = _766 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _792 * 0.15915493667125701904296875;
    float _800 = in.m_57.x;
    float _802 = in.m_57.y;
    float _804 = in.m_57.z;
    float _806 = _790 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _790 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = _388 * _786;
    float _816 = _390 * _788;
    float _818 = _386 * _784;
    float _820 = _798 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _808 * _778;
    float _826 = _808 * _796;
    float _828 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _830 = _816 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _802);
    float _834 = sqrt(_740);
    float _836 = _812 * _796;
    float _838 = _812 * _778;
    float _840 = _798 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _808 * _822;
    float _846 = _796 * _822;
    float _848 = _812 * _822;
    float _850 = _778 * _822;
    float _852 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _800);
    float _856 = _622 * _834;
    float _858 = _852 * _856;
    float _860 = _828 * _856;
    float _862 = _830 * _856;
    float _864 = _858 * _832;
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _804);
    float _868 = _860 * _854;
    float _870 = fma(_842, _836, _824);
    float _872 = _848 * _864;
    float _874 = _862 * _866;
    float _876 = -_826;
    float _878 = fma(_842, _838, _876);
    float _880 = -_864;
    float _882 = _842 * _880;
    float _884 = fma(_870, _868, _872);
    float _886 = -_838;
    float _888 = fma(_842, _826, _886);
    float _890 = _844 * _864;
    float _892 = fma(_846, _868, _882);
    float _894 = fma(_878, _874, _884);
    float _896 = fma(_842, _824, _836);
    float _898 = fma(_888, _868, _890);
    float _900 = fma(_850, _874, _892);
    float _902 = _894 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _904 = _894 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _906 = fma(_896, _874, _898);
    float _908 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[10].x, _902);
    float _910 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].x, _904);
    float _912 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[10].z, _908);
    float _914 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[8].z, _910);
    float _916 = _470 + _912;
    float _918 = _468 + _914;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _916 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _926 = _918 + _924;
    float _928 = _922 * _922;
    float _930 = fma(_926, _926, _928);
    float _932 = _894 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _934 = sqrt(_930);
    float _936 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[9].x, _932);
    float _938 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[9].z, _936);
    float _940 = _466 + _938;
    bool _942 = _934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _944 = _900;
    float _946 = _856;
    float _948 = _918;
    float _950 = _940;
    if (!_942)
    {
        _944 = _916;
    }
    float _952 = _944;
    float _954 = _952;
    if (!_942)
    {
        _946 = _940;
    }
    float _956 = _946;
    bool _958 = !_942;
    float _960 = _956;
    if (!_958)
    {
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _966 = _934 + _964;
        float _968 = rsqrt(_930);
        float _970 = _966 * _962;
        float _972 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _970 * 0.15915493667125701904296875;
        float _976 = _974 * 6.283185482025146484375;
        float _978 = sin(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = cos(_980);
        float _984 = fma(_978, _972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _986 = _968 * _984;
        float _988 = _982 + (-1.0);
        float _990 = fma(_926, _986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _992 = fma(_922, _986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _994 = _988 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = fma(_940, _982, _994);
        _960 = _996;
        _948 = _990;
        _954 = _992;
    }
    float _998 = _960;
    float _1000 = _948;
    float _1002 = _954;
    float _1004 = -_674;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _998);
    float _1008 = -_680;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1000);
    float _1012 = -_682;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1002);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1022 = _1010 + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1026 = _1014 + _1024;
    float _1028 = _1018 * _1018;
    float _1030 = fma(_1022, _1022, _1028);
    float _1032 = fma(_1026, _1026, _1030);
    float _1034 = rsqrt(_1032);
    float _1036 = sqrt(_1032);
    float _1038 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1040 = _1022 * _1038;
    float _1042 = _1026 * _1038;
    float _1044 = _1040 * _1040;
    float _1046 = _1042 * _1042;
    float _1048 = _1044 + _1046;
    float _1050 = sqrt(_1048);
    bool _1052 = _1050 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1056 = _1050 + _1054;
    float _1058 = _1026;
    float _1060 = _1048;
    float _1062 = _1056;
    float _1064 = _1018;
    if (_1052)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1058 = _1066;
    }
    float _1068 = _1058;
    if (_1052)
    {
        float _1070 = rsqrt(_1048);
        _1060 = _1070;
    }
    float _1072 = _1060;
    if (_1052)
    {
        float _1074 = _1056 * _1068;
        _1062 = _1074;
    }
    float _1076 = _1062;
    if (_1052)
    {
        float _1078 = _1076 * 0.15915493667125701904296875;
        _950 = _1078;
    }
    float _1080 = _950;
    float _1082 = _1028;
    float _1084 = _1080;
    if (_1052)
    {
        float _1086 = _1080 * 6.283185482025146484375;
        float _1088 = sin(_1086);
        _1082 = _1088;
    }
    float _1090 = _1082;
    float _1092 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1094 = precise::max(0.0, _1092);
    float _1096 = _1034;
    float _1098 = _1094;
    float _1100 = _1092;
    if (_1052)
    {
        float _1102 = _1080 * 6.283185482025146484375;
        float _1104 = cos(_1102);
        _1096 = _1104;
    }
    float _1106 = _1096;
    float _1108 = -_1038;
    float _1110 = -_1094;
    float _1112 = fma(_1018, _1108, _1110);
    if (!_1052)
    {
        _1098 = _1040;
    }
    float _1114 = _1098;
    float _1116 = _1114;
    if (_1052)
    {
        float _1118 = _1112 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1118;
    }
    float _1120 = _1100;
    float _1122 = _1090;
    float _1124 = _1120;
    if (_1052)
    {
        float _1126 = fma(_1090, _1120, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1122 = _1126;
    }
    float _1128 = _1122;
    float _1130 = _1128;
    if (!_1052)
    {
        _1124 = _1112;
    }
    float _1132 = _1124;
    float _1134 = _1132;
    float _1136 = _1106;
    if (_1052)
    {
        float _1138 = _1106 + (-1.0);
        _1064 = _1138;
    }
    float _1140 = _1064;
    float _1142 = _1140;
    if (_1052)
    {
        float _1144 = _1072 * _1128;
        _698 = _1144;
    }
    float _1146 = _698;
    if (!_1052)
    {
        _1130 = _1044;
    }
    float _1148 = _1130;
    float _1150 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1152 = _1148;
    if (_1052)
    {
        float _1154 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1084 = _1154;
    }
    float _1156 = _1084;
    if (_1052)
    {
        float _1158 = _1040 * _1146;
        _1116 = _1158;
    }
    float _1160 = _1116;
    if (!_1052)
    {
        _1142 = _1042;
    }
    float _1162 = _1142;
    float _1164 = _1162;
    if (_1052)
    {
        float _1166 = _1042 * _1146;
        _1164 = _1166;
    }
    float _1168 = _1164;
    if (_1052)
    {
        float _1170 = fma(_1112, _1106, _1156);
        _1134 = _1170;
    }
    float _1172 = _1134;
    if (_1052)
    {
        float _1174 = _1160 * _1160;
        _1152 = _1174;
    }
    float _1176 = _1152;
    if (!_1052)
    {
        _1136 = _1046;
    }
    float _1178 = _1136;
    float _1180 = _1178;
    if (_1052)
    {
        float _1182 = _1168 * _1168;
        _1180 = _1182;
    }
    float _1184 = _1180;
    float _1186 = fma(_1172, _1172, _1176);
    float _1188 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1150);
    float _1190 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1192 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1194 = _1186 + _1184;
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1198 = fma(_1036, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1196);
    float _1200 = precise::clamp(_1198, 0.0, 1.0);
    float _1202 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1188);
    float _1204 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1190);
    float _1206 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1208 = -_1200;
    float _1210 = _1208 + 1.0;
    float _1212 = rsqrt(_1194);
    float _1214 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1216 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1204);
    float _1218 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1206);
    float _1220 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1214);
    float _1224 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1226 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1218);
    float _1228 = abs(_1210);
    float _1230 = log2(_1228);
    float _1232 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1222);
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1236 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1238 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1240 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1242 = -_1234;
    float _1244 = fma(_1242, _1192, 1.0);
    float _1246 = _1212 * _1160;
    float _1248 = _1212 * _1172;
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1240);
    float _1252 = _1212 * _1168;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1256 = log2(_1244);
    float _1258 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1250);
    float _1260 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1262 = -_1254;
    float _1264 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1262);
    float _1266 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1268 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1258);
    float _1270 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1272 = -_1252;
    float _1274 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1264);
    float _1276 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1260);
    float _1278 = 1.0 / _1268;
    float _1280 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1270);
    float _1282 = fma(_1274, -0.5, 0.5);
    float _1284 = fma(_1274, 0.5, 0.5);
    float _1286 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1276);
    float _1288 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1280);
    float _1290 = _1248 + 1.0;
    float _1292 = fma(_1284, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = exp2(_1266);
    float _1296 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1288);
    float _1298 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1286);
    float _1300 = fma(_1284, _1292, -0.212114393711090087890625);
    float _1302 = _1256 * 0.693147182464599609375;
    float _1304 = fma(_1284, _1300, 1.570728778839111328125);
    float _1306 = sqrt(_1282);
    float _1308 = _1296 * _1278;
    float _1310 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1312 = fma(_1308, 0.5, 0.5);
    float _1314 = -_1248;
    float _1316 = fma(_1294, _1290, _1314);
    float _1318 = _1298 * _1278;
    float _1320 = fma(_1316, 0.5, 0.5);
    float _1322 = fma(_1318, -0.5, 0.5);
    float _1324 = _1306 * 0.636619746685028076171875;
    float3 _4161 = float3(_1312, _1322, _1310);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4161, float3(0.0), isnan(_4161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4161, float3(0.0), isnan(_4161)), level(0.0)).x;
    float _1328 = -_1304;
    float _1330 = fma(_1324, _1328, 1.0);
    float3 _4177 = float3(_1312, _1322, _1310);
    float4 _1333 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4177, float3(0.0), isnan(_4177)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4177, float3(0.0), isnan(_4177)), level(0.0)).xyzw;
    float _1335 = _1333.x;
    float _1337 = _1333.y;
    float _1339 = _1333.z;
    float _1341 = _1333.w;
    float2 _4194 = float2(_1330, _1320);
    float3 _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4194, float2(0.0), isnan(_4194)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4194, float2(0.0), isnan(_4194)), level(0.0)).xyz;
    float _1347 = _1345.x;
    float _1349 = _1345.y;
    float _1351 = _1345.z;
    float _1353 = in.m_59.y;
    float _1355 = -_674;
    float _1357 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _466);
    float _1359 = in.m_61.z;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1363 = _1361 != 0;
    float _1365 = -_680;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1371 = _1369 != 0;
    float _1373 = in.m_61.x;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1379 = _424 > 0.5;
    float _1381 = -_682;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _470);
    float _1385 = in.m_61.w;
    float _1387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1389 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1391 = isnan(_420);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = in.m_61.y;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1407 = _1310;
    float _1409 = _1387;
    float _1411 = _1268;
    float _1413 = _1298;
    float _1415 = _1296;
    if (_1371)
    {
        float _1417 = in.m_53.x;
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = 1.0 / _1377;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1425 = -_1353;
    float _1427 = _1425 + 1.0;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1435 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.z = _1359;
    float _1437 = _1353;
    if (_1363)
    {
        float _1439 = _1379 ? _1427 : _1353;
        _1437 = _1439;
    }
    float _1441 = _1437;
    float _1443 = 1.0 / _1405;
    out.m_63.x = _1373;
    float _1445 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1451 = _1449 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_63.w = _1385;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1453;
    bool _1457 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1459 = isnan(_420);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = _1451 * _1421;
    out.m_63.y = _1401;
    float _1471 = 1.0 / _1433;
    float _1473 = -_1467;
    float _1475 = _1473 + 1.0;
    bool _1477 = _1419 > 0.5;
    bool _1479 = _1477 && _1371;
    float _1481 = in.m_59.x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1485 = _1455 * _1443;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1487;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1493 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1495 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1497 = isnan(_420);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1503 = _1499 || _1501;
    float _1505 = float(_1503);
    float _1507 = -_1399;
    float _1509 = _1507 + 1.0;
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1513 = _802 != 0.0;
    bool _1515 = isnan(_802);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan(0.0);
    bool _1521 = _1517 || _1519;
    float _1523 = _1505 * _1509;
    float _1525 = _1489 * _1471;
    out.m_65.x = _1435;
    out.m_65.y = _1445;
    out.m_65.z = _1493;
    out.m_65.w = _1511;
    float _1527 = -_1505;
    float _1529 = _1527 + 1.0;
    bool _1531 = _800 == 0.0;
    bool _1533 = !_1521;
    bool _1535 = _1531 && _1533;
    float _1537 = exp2(_1447);
    bool _1539 = _804 == 0.0;
    bool _1541 = _1539 && _1535;
    float _1543 = _1481;
    if (_1371)
    {
        _700 = _1481;
    }
    float _1545 = _700;
    float _1547 = _1399 * _1475;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1551 = _420 + _1549;
    float _1553 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1555 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1557 = isnan(_420);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = _1545;
    float _1569 = _1547;
    if (_1479)
    {
        float _1571 = -_1545;
        float _1573 = _1571 + 1.0;
        _1567 = _1573;
    }
    float _1575 = _1567;
    float _1577 = fma(_1485, _1551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1579 = fma(_1553, _1441, -0.5);
    float _1581 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1583 = _1565 * _1529;
    if (_1371)
    {
        _1543 = _1575;
    }
    float _1585 = _1543;
    float _1587 = -_518;
    float _1589 = fma(_538, _1579, _1587);
    float _1591 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1581);
    float _1593 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1595 = _1577 * _1583;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1599 = _420 + _1597;
    float _1601 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1591);
    float _1603 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1593);
    float _1605 = in.m_67.x;
    float _1607 = in.m_67.y;
    float _1609 = in.m_67.z;
    bool _1611 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1613 = isnan(0.5);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1619 = _1615 || _1617;
    float _1621 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1623 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1603);
    float _1625 = -_1565;
    float _1627 = _1625 + 1.0;
    float _1629 = fma(_1469, _1599, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1631 = 1.0 / _1621;
    float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1635 = _420 + _1633;
    float _1637 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1595);
    float _1639 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1641 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1643 = fma(_1525, _1635, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1645 = fma(_1629, _1523, _1637);
    float _1647 = _1639 + _1621;
    float _1649 = fma(_1641, _1585, -0.5);
    float _1651 = -_1537;
    float _1653 = _1651 + 1.0;
    float _1655 = fma(_1643, _1547, _1645);
    if (!_1619)
    {
        _1569 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1657 = _1569;
    float _1659 = fma(_586, _1649, _678);
    float _1661 = _1589 + 0.5;
    float _1663 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1655);
    float _1665 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1667 = _1647 * _1631;
    float _1669 = _1667 * 0.5;
    float _1671 = _1659 + 0.5;
    float _1673 = _1605;
    float _1675 = _1607;
    float _1677 = _1657;
    float _1679 = _1669;
    float _1681 = _1609;
    float _1683 = _1671;
    if (!_1541)
    {
        float _1685 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1605);
        _1673 = _1685;
    }
    float _1687 = _1673;
    if (!_1541)
    {
        float _1689 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1607);
        _1675 = _1689;
    }
    float _1691 = _1675;
    if (!_1619)
    {
        float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1695 = fma(_1669, _1657, _1693);
        _1677 = _1695;
    }
    float _1697 = _1677;
    if (!_1619)
    {
        _1679 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1699 = _1679;
    if (!_1541)
    {
        float _1701 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1609);
        _1681 = _1701;
    }
    float _1703 = _1681;
    float _1705 = _848 * _1691;
    float _1707 = _1697;
    if (!_1619)
    {
        float _1709 = 1.0 / _1697;
        _1707 = _1709;
    }
    float _1711 = _1707;
    if (!_1619)
    {
        float _1713 = -_1699;
        float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1409 = _1715;
    }
    float _1717 = _1409;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1723 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1725 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1729 = _1621;
    if (!_1619)
    {
        float _1731 = 1.0 / _1717;
        _1729 = _1731;
    }
    float _1733 = _1729;
    float _1735 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1737 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1741 = -_1691;
    float _1743 = _842 * _1741;
    float _1745 = fma(_870, _1687, _1705);
    float _1747 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1723);
    float _1749 = _844 * _1691;
    float _1751 = fma(_846, _1687, _1743);
    float _1753 = fma(_878, _1703, _1745);
    out.m_69.x = _1735;
    out.m_69.y = _1737;
    out.m_69.z = _1739;
    out.m_69.w = _1725;
    float _1755 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1747);
    float _1757 = fma(_888, _1687, _1749);
    float _1759 = fma(_850, _1703, _1751);
    out.m_71.x = _1671;
    out.m_71.y = _1661;
    float _1761 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1755);
    float _1763 = fma(_896, _1703, _1757);
    bool _1765 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1767 = isnan(_1036);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1773 = _1769 || _1771;
    float _1775 = _1296 + _1268;
    float _1777 = _1761 + _1268;
    out.gl_Position.x = _1296;
    out.gl_Position.y = _1298;
    out.gl_Position.z = _1761;
    out.gl_Position.w = _1268;
    float _1779 = _1775 * 0.5;
    float _1781 = _1777 * 0.5;
    float _1783 = _1735;
    float _1785 = _1761;
    float _1787 = _1779;
    if (!_1619)
    {
        float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1791 = -_1699;
        float _1793 = fma(_1711, _1789, _1791);
        _1783 = _1793;
    }
    float _1795 = _1783;
    float _1797 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_1619)
    {
        _1683 = 1.0;
    }
    float _1799 = _1683;
    float _1801 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1803 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1805 = _1799;
    if (!_1619)
    {
        float _1807 = _1795 * _1733;
        float _1809 = precise::clamp(_1807, 0.0, 1.0);
        _1805 = _1809;
    }
    float _1811 = _1805;
    float _1813 = _1268 * 0.5;
    float _1815 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1797);
    float _1817 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1801);
    float _1819 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1803);
    float _1821 = fma(_1298, -0.5, _1813);
    float _1823 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1815);
    float _1825 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1817);
    float _1827 = fma(_1763, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1819);
    float _1829 = _1817;
    if (!_1773)
    {
        _1829 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1831 = _1829;
    out.m_73.x = _1823;
    out.m_73.y = _1825;
    out.m_73.z = _1827;
    float _1833 = _1831;
    float _1835 = _1831;
    if (!_1773)
    {
        _1411 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1837 = _1411;
    float _1839 = _1837;
    float _1841 = _1837;
    if (!_1773)
    {
        _1785 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1843 = _1785;
    out.m_75.x = _1779;
    out.m_75.y = _1821;
    out.m_75.z = _1781;
    out.m_75.w = _1268;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1773)
    {
        _1413 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1849 = _1413;
    float _1851 = _1849;
    float _1853 = _1849;
    if (!_1773)
    {
        _1415 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1855 = _1415;
    float _1857 = _1855;
    float _1859 = _1855;
    if (!_1773)
    {
        _1787 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1861 = _1787;
    float _1863 = _1665 * _1326;
    float _1865 = -_1665;
    float _1867 = _1865 + 1.0;
    float _1869 = _1341 * _1863;
    float _1871 = _1341 * _1867;
    float _1873 = _1351 * _1863;
    float _1875 = fma(_1347, _1869, _1335);
    float _1877 = fma(_1349, _1869, _1337);
    float _1879 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1881 = fma(_1341, _1873, _1339);
    out.m_77.x = _1875;
    out.m_77.y = _1877;
    out.m_77.z = _1881;
    out.m_77.w = _1871;
    bool _1883 = !_1773;
    float _1885 = _1861;
    float _1887 = _1861;
    if (!_1883)
    {
        bool _1889 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1891 = isnan(_1036);
        bool _1893 = _1889 || _1891;
        bool _1895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1897 = _1893 || _1895;
        if (!_1897)
        {
            float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1901 = _1036 + _1899;
            float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1905 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1903;
            float _1907 = 1.0 / _1905;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1927 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1929 = _1901 * _1907;
            float _1931 = precise::clamp(_1929, 0.0, 1.0);
            float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1937 = fma(_1931, _1911, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1939 = fma(_1931, _1935, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1941 = fma(_1931, _1915, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1943 = fma(_1931, _1919, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1945 = fma(_1931, _1923, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1947 = fma(_1931, _1927, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1887 = _1939;
            _1853 = _1945;
            _1835 = _1937;
            _1847 = _1943;
            _1841 = _1941;
            _1859 = _1947;
            _1949 = true;
        }
        else
        {
            bool _1951 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1953 = isnan(_1036);
            bool _1955 = _1951 || _1953;
            bool _1957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1959 = _1955 || _1957;
            if (!_1959)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1961 = _1833;
            _1835 = _1961;
            if (!_1959)
            {
                _1885 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1963 = _1885;
            _1887 = _1963;
            if (!_1959)
            {
                _1839 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1965 = _1839;
            _1841 = _1965;
            if (!_1959)
            {
                _1845 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1967 = _1845;
            _1847 = _1967;
            if (!_1959)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1969 = _1851;
            _1853 = _1969;
            if (!_1959)
            {
                _1857 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1971 = _1857;
            bool _1973 = !_1959;
            _1859 = _1971;
            if (!_1973)
            {
                bool _1975 = _1036 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1977 = isnan(_1036);
                bool _1979 = _1975 || _1977;
                bool _1981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1983 = _1979 || _1981;
                if (!_1983)
                {
                    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1987 = _1036 + _1985;
                    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1991 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1989;
                    float _1993 = 1.0 / _1991;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2015 = _1987 * _1993;
                    float _2017 = precise::clamp(_2015, 0.0, 1.0);
                    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2023 = fma(_2017, _1997, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2025 = fma(_2017, _2021, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2027 = fma(_2017, _2001, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2029 = fma(_2017, _2005, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2031 = fma(_2017, _2009, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2033 = fma(_2017, _2013, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1887 = _2025;
                    _1853 = _2031;
                    _1835 = _2023;
                    _1847 = _2029;
                    _1841 = _2027;
                    _1859 = _2033;
                    _1949 = true;
                }
                else
                {
                    _1887 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1847 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1841 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1859 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1949 = false;
    float _2035 = _1887;
    float _2037 = _1853;
    float _2039 = _1835;
    float _2041 = _1847;
    float _2043 = _1841;
    float _2045 = _1859;
    float _2047 = fma(_1825, -0.5, 0.5);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    float _2051 = -_2035;
    float _2053 = _2051 + _2037;
    float _2055 = _1879 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2057 = -_2039;
    float _2059 = _2057 + _2041;
    float _2061 = fma(_2049, _2053, _2035);
    out.m_79.x = 0.0;
    float _2063 = -_2043;
    float _2065 = _2063 + _2045;
    float _2067 = fma(_2049, _2059, _2039);
    float _2069 = _2061 * 0.586610972881317138671875;
    out.m_47.x = _2055;
    bool _2071 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2073 = fma(_2049, _2065, _2043);
    float _2075 = fma(_2067, 0.298911988735198974609375, _2069);
    bool _2077 = _1811 > 0.0;
    bool _2079 = isnan(_1811);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_2073, 0.114477999508380889892578125, _2075);
    float _2089 = -_2087;
    float _2091 = _2067 + _2089;
    float _2093 = -_2087;
    float _2095 = _2061 + _2093;
    float _2097 = -_2087;
    float _2099 = _2073 + _2097;
    float _2101 = fma(_2091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2103 = fma(_2095, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2105 = fma(_2099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    bool _2107 = !_2071;
    if (!_2107)
    {
        float _2109 = -_1006;
        float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2113 = -_1010;
        float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2117 = -_1014;
        float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2121 = _2111 * _2111;
        float _2123 = fma(_2115, _2115, _2121);
        float _2125 = fma(_2119, _2119, _2123);
        float _2127 = sqrt(_2125);
        float _2129 = rsqrt(_2125);
        float _2131 = -_2127;
        float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2135 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        float _2139 = _2115 * _2129;
        float _2141 = _2111 * _2129;
        float _2143 = abs(_2137);
        float _2145 = log2(_2143);
        float _2147 = _2119 * _2129;
        float _2149 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2151 = _1825 * _2141;
        float _2153 = -_2141;
        float _2155 = -_2149;
        float _2157 = fma(_2153, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2155);
        float _2159 = fma(_1823, _2139, _2151);
        float _2161 = -_2147;
        float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2157);
        float _2165 = fma(_1827, _2147, _2159);
        float _2167 = precise::clamp(_2165, 0.0, 1.0);
        float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2171 = _2163 + _2169;
        float _2173 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2175 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = exp2(_2173);
        float _2181 = _2179 * _2177;
        float _2183 = _2167 * _2181;
        float _2185 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2187 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2189 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2185;
        out.m_79.y = _2187;
        out.m_79.z = _2189;
    }
    out.m_81.x = _2101;
    out.m_81.y = _2103;
    out.m_81.z = _2105;
    if (_2085)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2191 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2191;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

