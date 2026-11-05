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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_73 [[attribute(0)]];
    float4 m_55 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1711 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1996 = as_type<float>(_122);
        out.gl_Position.z = _1996;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2065 = as_type<float>(_160);
        out.gl_Position.z = _2065;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_53.z;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _192 + _196;
    float _200 = in.m_46.x;
    float _202 = in.m_46.y;
    float _204 = in.m_46.z;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    int _210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _212 = _210 != 0;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _216 = _214 != 0;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _220 = _218 != 0;
    float _222 = in.m_53.x;
    float _224 = 1.0 / _208;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = 1.0 / _228;
    float _232 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _234 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _236 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _238 = in.m_53.y;
    float _240 = _194 * 2.0;
    float _242 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _232);
    float _244 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _234);
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    float _250 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _236);
    float _252 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = _192 + _254;
    float _258 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _260 = _222 + _194;
    float _262 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].x, _252);
    float _264 = _222 * 2.0;
    float _266 = floor(_240);
    float _268 = _256 * _224;
    float _270 = _260 + (-1.0);
    float _272 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _274 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _276 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].z, _258);
    float _278 = _198 * _230;
    float _280 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].y, _272);
    float _282 = floor(_264);
    float _284 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].w, _274);
    float _286 = _238 * 2.0;
    float _288 = _238 + _194;
    float _290 = _222 + _238;
    float _292 = _194 + (-0.5);
    bool _294 = _266 > 0.0;
    float _296 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _298 = _266 >= 0.0;
    bool _300 = isnan(_266);
    bool _302 = _298 || _300;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    float _308 = floor(_286);
    float _310 = _288 + (-1.0);
    float _312 = _290 + (-1.0);
    int _314 = _306 ? 0 : 1;
    float _316 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _318 = ~_314;
    int _320 = _318 + 1;
    int _322 = _320 + 1;
    int _324 = _322;
    float _326 = _222;
    if (!_294)
    {
        int _328 = ~_314;
        int _330 = _328 + 1;
        _324 = _330;
    }
    int _332 = _324;
    float _334 = _248 * _140;
    float _336 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _242);
    float _338 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].x, _262);
    bool _340 = _308 > 0.0;
    float _342 = exp2(_334);
    bool _344 = _308 >= 0.0;
    bool _346 = isnan(_308);
    bool _348 = _344 || _346;
    bool _350 = isnan(0.0);
    bool _352 = _348 || _350;
    float _354 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _250);
    float _356 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].z, _276);
    float _358 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].y, _280);
    float _360 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].w, _284);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _364 = 1.0 + _362;
    bool _366 = !_212;
    int _368 = _366 ? 0 : 1;
    float _370 = sqrt(_336);
    float _372 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    bool _374 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _376 = isnan(0.0);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _382 = _378 || _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -_342;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    float _396 = 1.0 / _364;
    bool _398 = _282 > 0.0;
    float _400 = fma(_394, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _402 = _282 >= 0.0;
    bool _404 = isnan(_282);
    bool _406 = _402 || _404;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    float _412 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _244);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = _382 ? _390 : 0.0;
    float _420 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _422 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _424 = isnan(1.0);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _430 = _426 || _428;
    float _432 = fma(_386, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _434 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _436 = isnan(_192);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = fma(_416, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _456 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _458 = isnan(_192);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = -_444;
    float _474 = _472 + 1.0;
    float _476 = fma(_450, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _478 = fma(_454, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _480 = fma(_470, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _482 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _484 = isnan(_192);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = _466 * _474;
    float _496 = -_466;
    float _498 = _496 + 1.0;
    if (_430)
    {
        float _500 = _418 * _396;
        _144 = _500;
    }
    float _502 = _144;
    float _504 = in.m_55.x;
    float _506 = in.m_55.y;
    float _508 = in.m_55.z;
    bool _510 = !_216;
    int _512 = _510 ? 0 : 1;
    float _514 = _492 * _498;
    int _516 = abs(_368);
    float _518 = sqrt(_354);
    int _520 = abs(_512);
    float _522 = _432 * _514;
    int _524 = _410 ? 0 : 1;
    float _526 = _446 * _514;
    float _528 = float(_516);
    float _530 = _400 * _514;
    float _532 = float(_332);
    float _534 = sqrt(_412);
    int _536 = ~_524;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = _358 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    int _544 = _540;
    if (!_398)
    {
        int _546 = ~_524;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    float _552 = _528 * _532;
    float _554 = _370 * _372;
    float _556 = float(_550);
    float _558 = _356 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _560 = float(_520);
    float _562 = _552 * (-2.0);
    float _564 = _518 * _558;
    float _566 = fma(_562, _504, _504);
    float _568 = _534 * _542;
    float _570 = _560 * _556;
    bool _572 = !_220;
    int _574 = _572 ? 0 : 1;
    float _576 = _222 + (-0.5);
    int _578 = _352 ? 0 : 1;
    float _580 = fma(_420, _562, _420);
    int _582 = abs(_574);
    float _584 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[196].x, _566);
    int _586 = ~_578;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    float _592 = _570 * (-2.0);
    int _594 = _590;
    float _596 = _568;
    if (!_340)
    {
        int _598 = ~_578;
        int _600 = _598 + 1;
        _594 = _600;
    }
    int _602 = _594;
    float _604 = fma(_580, _502, _584);
    float _606 = float(_582);
    float _608 = fma(_316, _592, _316);
    float _610 = fma(_592, _506, _506);
    float _612 = _238 + (-0.5);
    float _614 = float(_602);
    float _616 = _604 * 0.15915493667125701904296875;
    float _618 = -_492;
    float _620 = _618 + 1.0;
    float _622 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[196].y, _610);
    float _624 = in.m_57.x;
    float _626 = in.m_57.y;
    float _628 = in.m_57.z;
    float _630 = _606 * _614;
    float _632 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[143].x, _522);
    float _634 = fma(_608, _502, _622);
    float _636 = in.m_59.x;
    float _638 = in.m_59.y;
    float _640 = in.m_59.z;
    float _642 = _630 * (-2.0);
    float _644 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[143].y, _526);
    float _646 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _648 = fma(_476, _494, _632);
    float _650 = fma(_642, _508, _508);
    float _652 = fma(_296, _642, _296);
    float _654 = fma(_478, _494, _644);
    float _656 = fma(_480, _494, _646);
    float _658 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[196].z, _650);
    float _660 = _634 * 0.15915493667125701904296875;
    float _662 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].x, _648);
    float _664 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].z, _656);
    float _666 = fma(_652, _502, _658);
    float _668 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].y, _654);
    float _670 = _616 * 6.283185482025146484375;
    float _672 = sin(_670);
    float _674 = _666 * 0.15915493667125701904296875;
    float _676 = _668 * _626;
    float _678 = _568 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _680 = _664 * _628;
    float _682 = _616 * 6.283185482025146484375;
    float _684 = cos(_682);
    float _686 = _662 * _624;
    float _688 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[24].x, _678);
    float _690 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _638);
    float _694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _640);
    float _696 = _568 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _698 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _700 = _660 * 6.283185482025146484375;
    float _702 = sin(_700);
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _636);
    float _706 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _696);
    float _710 = _690 * _692;
    float _712 = _698 * _694;
    float _714 = _706 * _704;
    float _716 = _360 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _718 = _660 * 6.283185482025146484375;
    float _720 = cos(_718);
    float _722 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[24].z, _688);
    float _724 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[26].z, _708);
    bool _726 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _728 = isnan(0.5);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _734 = _730 || _732;
    float _736 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[24].w, _722);
    float _738 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[26].w, _724);
    float _740 = _674 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _684 * _702;
    float _746 = _738 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _748 = _736 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _750 = _674 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _672 * _720;
    float _756 = _684 * _720;
    float _758 = _672 * _742;
    float _760 = _672 * _702;
    float _762 = _720 * _742;
    float _764 = _702 * _742;
    float _766 = _758 * _710;
    float _768 = _684 * _742;
    float _770 = -_744;
    float _772 = fma(_752, _754, _770);
    float _774 = -_710;
    float _776 = _752 * _774;
    float _778 = fma(_752, _760, _756);
    float _780 = fma(_752, _756, _760);
    float _782 = fma(_772, _714, _766);
    float _784 = fma(_762, _714, _776);
    float _786 = _768 * _710;
    float _788 = -_754;
    float _790 = fma(_752, _744, _788);
    float _792 = fma(_778, _712, _782);
    float _794 = fma(_764, _712, _784);
    float _796 = _568 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _798 = fma(_780, _714, _786);
    float _800 = _746 + _792;
    float _802 = _748 + _794;
    float _804 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[25].x, _796);
    float _806 = fma(_790, _712, _798);
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _810 = _800 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _802 + _812;
    float _816 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[25].z, _804);
    float _818 = _810 * _810;
    float _820 = fma(_814, _814, _818);
    float _822 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[25].w, _816);
    float _824 = sqrt(_820);
    float _826 = _822 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _828 = _826 + _806;
    bool _830 = _824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _832 = _660;
    float _834 = _802;
    float _836 = _800;
    float _838 = _804;
    float _840 = _828;
    float _842 = _820;
    if (!_830)
    {
        _832 = _828;
    }
    float _844 = _832;
    bool _846 = !_830;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _854 = _824 + _852;
        float _856 = rsqrt(_820);
        float _858 = _854 * _850;
        float _860 = _828 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = _858 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = _872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = fma(_870, _860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _878 = fma(_828, _866, _874);
        float _880 = _856 * _876;
        float _882 = fma(_814, _880, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _884 = fma(_810, _880, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _848 = _878;
        _834 = _882;
        _836 = _884;
    }
    float _886 = _848;
    float _888 = _834;
    float _890 = _836;
    float _892 = _886;
    float _894 = _888;
    float _896 = _890;
    if (!_734)
    {
        float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _900 = _826 + _898;
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _904 = _748 + _902;
        float _906 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _908 = -_826;
        float _910 = _908 + _886;
        float _912 = _900 * _900;
        float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _916 = _746 + _914;
        float _918 = fma(_904, _904, _912);
        float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _922 = fma(_916, _916, _918);
        float _924 = sqrt(_922);
        float _926 = _906 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _928 = precise::min(_924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _930 = _928 * _920;
        float _932 = -_748;
        float _934 = _932 + _888;
        float _936 = _926 * _930;
        float _938 = -_746;
        float _940 = _938 + _890;
        float _942 = fma(_934, _936, _748);
        float _944 = fma(_910, _936, _826);
        float _946 = fma(_940, _936, _746);
        _892 = _944;
        _894 = _942;
        _896 = _946;
    }
    float _948 = _892;
    float _950 = _894;
    float _952 = _896;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _956 = _948 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _960 = _950 + _958;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _964 = _952 + _962;
    float _966 = _956 * _956;
    float _968 = fma(_960, _960, _966);
    float _970 = fma(_964, _964, _968);
    float _972 = rsqrt(_970);
    float _974 = sqrt(_970);
    float _976 = _972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _978 = _960 * _976;
    float _980 = _964 * _976;
    float _982 = _978 * _978;
    float _984 = _980 * _980;
    float _986 = _982 + _984;
    float _988 = sqrt(_986);
    bool _990 = _988 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _988 + _992;
    float _996 = _964;
    float _998 = _994;
    float _1000 = _956;
    if (_990)
    {
        float _1002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _996 = _1002;
    }
    float _1004 = _996;
    if (_990)
    {
        float _1006 = rsqrt(_986);
        _838 = _1006;
    }
    float _1008 = _838;
    float _1010 = _1008;
    if (_990)
    {
        float _1012 = _994 * _1004;
        _998 = _1012;
    }
    float _1014 = _998;
    if (_990)
    {
        float _1016 = _1014 * 0.15915493667125701904296875;
        _596 = _1016;
    }
    float _1018 = _596;
    float _1020 = _966;
    if (_990)
    {
        float _1022 = _1018 * 6.283185482025146484375;
        float _1024 = sin(_1022);
        _1020 = _1024;
    }
    float _1026 = _1020;
    float _1028 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1030 = precise::max(0.0, _1028);
    float _1032 = _972;
    float _1034 = _1028;
    float _1036 = _1030;
    if (_990)
    {
        float _1038 = _1018 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        _1032 = _1040;
    }
    float _1042 = _1032;
    float _1044 = -_976;
    float _1046 = -_1030;
    float _1048 = fma(_956, _1044, _1046);
    if (_990)
    {
        float _1050 = _1048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1050;
    }
    float _1052 = _1034;
    float _1054 = _1026;
    if (_990)
    {
        float _1056 = fma(_1026, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _840 = _1056;
    }
    float _1058 = _840;
    float _1060 = _1058;
    if (!_990)
    {
        _1054 = _1048;
    }
    float _1062 = _1054;
    float _1064 = _1062;
    float _1066 = _1042;
    if (_990)
    {
        float _1068 = _1042 + (-1.0);
        _1000 = _1068;
    }
    float _1070 = _1000;
    float _1072 = _1070;
    if (_990)
    {
        float _1074 = _1008 * _1058;
        _842 = _1074;
    }
    float _1076 = _842;
    if (!_990)
    {
        _1010 = _978;
    }
    float _1078 = _1010;
    float _1080 = _1078;
    if (_990)
    {
        float _1082 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1082;
    }
    float _1084 = _1036;
    if (_990)
    {
        float _1086 = _978 * _1076;
        _1080 = _1086;
    }
    float _1088 = _1080;
    if (!_990)
    {
        _1072 = _980;
    }
    float _1090 = _1072;
    float _1092 = _1090;
    if (_990)
    {
        float _1094 = _980 * _1076;
        _1092 = _1094;
    }
    float _1096 = _1092;
    if (_990)
    {
        float _1098 = fma(_1048, _1042, _1084);
        _1064 = _1098;
    }
    float _1100 = _1064;
    if (!_990)
    {
        _1066 = _982;
    }
    float _1102 = _1066;
    float _1104 = _1102;
    if (_990)
    {
        float _1106 = _1088 * _1088;
        _1104 = _1106;
    }
    float _1108 = _1104;
    if (!_990)
    {
        _1060 = _984;
    }
    float _1110 = _1060;
    float _1112 = _1110;
    if (_990)
    {
        float _1114 = _1096 * _1096;
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = fma(_1100, _1100, _1108);
    float _1120 = _948 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1122 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1124 = _948 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1126 = _1118 + _1116;
    float _1128 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1120);
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1132 = fma(_974, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1130);
    float _1134 = precise::clamp(_1132, 0.0, 1.0);
    float _1136 = _948 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1128);
    float _1140 = rsqrt(_1126);
    float _1142 = -_1134;
    float _1144 = _1142 + 1.0;
    float _1146 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1148 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1150 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1136);
    float _1152 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1124);
    float _1154 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1156 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1150);
    float _1158 = abs(_1144);
    float _1160 = log2(_1158);
    float _1162 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1152);
    float _1164 = -_1154;
    float _1166 = fma(_1164, _1146, 1.0);
    float _1168 = _948 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1172 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1174 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1176 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1178 = _1140 * _1088;
    float _1180 = floor(_1122);
    float _1182 = _1140 * _1100;
    float _1184 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1176);
    float _1186 = _1140 * _1096;
    float _1188 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1190 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1192 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1194 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1196 = -_1188;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1196);
    float _1200 = floor(_1172);
    float _1202 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1190);
    float _1204 = -_1186;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1198);
    float _1208 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1202);
    float _1210 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1212 = fma(_1206, -0.5, 0.5);
    float _1214 = -_1180;
    float _1216 = _1122 + _1214;
    float _1218 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1208);
    float _1220 = log2(_1166);
    float _1222 = fma(_1206, 0.5, 0.5);
    float _1224 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1226 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1210);
    float _1228 = fma(_1222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1230 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1224);
    float _1232 = -_1200;
    float _1234 = _1172 + _1232;
    float _1236 = exp2(_1194);
    float _1238 = fma(_1222, _1228, -0.212114393711090087890625);
    float _1240 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1230);
    float _1242 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1226);
    float _1244 = _1182 + 1.0;
    float _1246 = 1.0 / _1218;
    float _1248 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1240);
    float _1250 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1242);
    float _1252 = _1220 * 0.693147182464599609375;
    float _1254 = sqrt(_1212);
    float _1256 = -_1182;
    float _1258 = fma(_1236, _1244, _1256);
    float2 _3826 = float2(_1216, _1234);
    float _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3826, float2(0.0), isnan(_3826)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3826, float2(0.0), isnan(_3826)), level(0.0)).x;
    float _1262 = fma(_1222, _1238, 1.570728778839111328125);
    float _1264 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1266 = _1248 * _1246;
    float _1268 = _1250 * _1246;
    float _1270 = fma(_1266, 0.5, 0.5);
    float _1272 = fma(_1268, -0.5, 0.5);
    float _1274 = _1254 * 0.636619746685028076171875;
    float3 _3858 = float3(_1270, _1272, _1264);
    float _1276 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3858, float3(0.0), isnan(_3858)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3858, float3(0.0), isnan(_3858)), level(0.0)).x;
    float _1278 = -_1262;
    float _1280 = fma(_1274, _1278, 1.0);
    float _1282 = fma(_1258, 0.5, 0.5);
    float3 _3876 = float3(_1270, _1272, _1264);
    float4 _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3876, float3(0.0), isnan(_3876)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3876, float3(0.0), isnan(_3876)), level(0.0)).xyzw;
    float _1287 = _1285.x;
    float _1289 = _1285.y;
    float _1291 = _1285.z;
    float _1293 = _1285.w;
    float2 _3892 = float2(_1280, _1282);
    float3 _1297 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3892, float2(0.0), isnan(_3892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3892, float2(0.0), isnan(_3892)), level(0.0)).xyz;
    float _1299 = _1297.x;
    float _1301 = _1297.y;
    float _1303 = _1297.z;
    float _1305 = _826 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1307 = _826 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1309 = in.m_61.y;
    bool _1311 = _238 > 0.5;
    float _1313 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1305);
    float _1315 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1307);
    float _1317 = in.m_61.x;
    float _1319 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1313);
    float _1321 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1315);
    float _1323 = in.m_63.x;
    float _1325 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1327 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1329 = in.m_63.y;
    float _1331 = 1.0 / _1325;
    float _1333 = _1327 + _1325;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1337 = _1335 != 0;
    float _1339 = in.m_63.z;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1343 = _1341 != 0;
    float _1345 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1347 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1351 = _222 > 0.5;
    bool _1353 = _1351 && _1343;
    float _1355 = -_1309;
    float _1357 = _1355 + 1.0;
    float _1359 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1347);
    float _1361 = in.m_63.w;
    float _1363 = _1309;
    float _1365 = _1317;
    float _1367 = _1218;
    float _1369 = _1250;
    if (_1337)
    {
        float _1371 = _1311 ? _1357 : _1309;
        _1363 = _1371;
    }
    float _1373 = _1363;
    float _1375 = _1333 * _1331;
    float _1377 = _1375 * 0.5;
    bool _1379 = _638 != 0.0;
    bool _1381 = isnan(_638);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan(0.0);
    bool _1387 = _1383 || _1385;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_65.x = _1323;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1393 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1391);
    float _1395 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_65.y = _1329;
    bool _1397 = _636 == 0.0;
    bool _1399 = !_1387;
    bool _1401 = _1397 && _1399;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1405 = 1.0 / _1393;
    out.m_65.z = _1339;
    bool _1407 = _640 == 0.0;
    bool _1409 = _1407 && _1401;
    float _1411 = _1395 * _1349;
    if (_1343)
    {
        _326 = _1317;
    }
    float _1413 = _326;
    float _1415 = in.m_67.x;
    float _1417 = in.m_67.y;
    float _1419 = in.m_67.z;
    float _1421 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = exp2(_1345);
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1431 = _1413;
    if (_1353)
    {
        float _1433 = -_1413;
        float _1435 = _1433 + 1.0;
        _1431 = _1435;
    }
    float _1437 = _1431;
    float _1439 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1359);
    out.m_65.w = _1361;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1443 = _1405 * _1441;
    if (_1343)
    {
        _1365 = _1437;
    }
    float _1445 = _1365;
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1451 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1455 = -_1423;
    float _1457 = _1455 + 1.0;
    float _1459 = abs(_1443);
    float _1461 = log2(_1459);
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1465 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1419;
    float _1469 = _1417;
    float _1471 = _1415;
    if (!_1409)
    {
        float _1473 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1419);
        _1467 = _1473;
    }
    float _1475 = _1467;
    if (!_1409)
    {
        float _1477 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1417);
        _1469 = _1477;
    }
    float _1479 = _1469;
    if (!_1409)
    {
        float _1481 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1415);
        _1471 = _1481;
    }
    float _1483 = _1471;
    bool _1485 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1487 = isnan(_974);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1493 = _1489 || _1491;
    float _1495 = _1451 * _1447;
    float _1497 = -_1479;
    float _1499 = _752 * _1497;
    float _1501 = _768 * _1479;
    float _1503 = _758 * _1479;
    bool _1505 = _1443 <= 8000.0;
    bool _1507 = isnan(_1443);
    bool _1509 = _1505 || _1507;
    bool _1511 = isnan(8000.0);
    bool _1513 = _1509 || _1511;
    float _1515 = float(_1513);
    float _1517 = fma(_762, _1483, _1499);
    float _1519 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1439);
    float _1521 = fma(_780, _1483, _1501);
    float _1523 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1525 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1527 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1529 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1495;
    out.m_69.y = _1411;
    float _1531 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1533 = exp2(_1523);
    out.m_71.x = _1465;
    out.m_71.y = _1421;
    out.m_71.z = _1525;
    out.m_71.w = _1463;
    float _1535 = in.m_73.x;
    out.m_75.x = _1527;
    out.m_75.y = _1529;
    out.m_75.z = _1531;
    out.m_75.w = _1429;
    float _1537 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1539 = precise::clamp(_1537, 0.0, 1.0);
    float _1541 = fma(_1539, -2.0, 3.0);
    float _1543 = _1539 * _1539;
    float _1545 = _1543 * _1541;
    float _1547 = -_1545;
    float _1549 = _1547 + 1.0;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1545);
    float _1553 = _1519 + _1218;
    float _1555 = fma(_772, _1483, _1503);
    float _1557 = fma(_764, _1475, _1517);
    float _1559 = _1515 * _1551;
    float _1561 = _1553 * 0.5;
    float _1563 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1565 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1567 = fma(_790, _1475, _1521);
    float _1569 = fma(_778, _1475, _1555);
    out.m_77.z = _1561;
    out.m_77.w = _1218;
    out.m_79.x = _1557;
    out.m_79.y = _1567;
    out.m_79.z = _1569;
    out.gl_Position.x = _1248;
    out.gl_Position.y = _1250;
    out.gl_Position.z = _1519;
    out.gl_Position.w = _1218;
    float _1571 = _1248;
    float _1573 = _1563;
    if (!_1493)
    {
        _1367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1575 = _1367;
    float _1577 = _1575;
    float _1579 = _1575;
    if (!_1493)
    {
        _1571 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1581 = _1571;
    float _1583 = _1581;
    float _1585 = _1581;
    if (!_1493)
    {
        _1369 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1587 = _1369;
    float _1589 = -_1260;
    float _1591 = _1589 + 1.0;
    float _1593 = _1591 * _1565;
    float _1595 = precise::clamp(_1593, 0.0, 1.0);
    float _1597 = -_1595;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1601 = -_1563;
    float _1603 = _1601 + 1.0;
    float _1605 = _1599 * _1535;
    float _1607 = _1563 * _1276;
    float _1609 = _1605 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1611 = _1603;
    float _1613 = _1587;
    float _1615 = _1587;
    if (!_1493)
    {
        _1573 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1617 = _1573;
    float _1619 = _1293 * _1607;
    float _1621 = _1293 * _1603;
    out.m_81.x = _1609;
    float _1623 = _1619;
    float _1625 = _1617;
    float _1627 = _1617;
    if (!_1493)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1629 = _1611;
    float _1631 = _1303 * _1607;
    float _1633 = fma(_1299, _1619, _1287);
    float _1635 = fma(_1301, _1619, _1289);
    float _1637 = _1629;
    float _1639 = _1629;
    if (!_1493)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1641 = _1623;
    float _1643 = fma(_1293, _1631, _1291);
    out.m_83.x = _1633;
    out.m_83.y = _1635;
    out.m_83.z = _1643;
    out.m_83.w = _1621;
    bool _1645 = !_1493;
    float _1647 = _1641;
    float _1649 = _1641;
    if (!_1645)
    {
        bool _1651 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1653 = isnan(_974);
        bool _1655 = _1651 || _1653;
        bool _1657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1659 = _1655 || _1657;
        if (!_1659)
        {
            float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1663 = _974 + _1661;
            float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1665;
            float _1669 = 1.0 / _1667;
            float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1673 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1677 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1691 = _1663 * _1669;
            float _1693 = precise::clamp(_1691, 0.0, 1.0);
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1699 = fma(_1693, _1673, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1701 = fma(_1693, _1697, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1703 = fma(_1693, _1677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1705 = fma(_1693, _1681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1707 = fma(_1693, _1685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1709 = fma(_1693, _1689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1585 = _1701;
            _1627 = _1707;
            _1579 = _1699;
            _1649 = _1705;
            _1615 = _1703;
            _1639 = _1709;
            _1711 = true;
        }
        else
        {
            bool _1713 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1715 = isnan(_974);
            bool _1717 = _1713 || _1715;
            bool _1719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1721 = _1717 || _1719;
            if (!_1721)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1723 = _1577;
            _1579 = _1723;
            if (!_1721)
            {
                _1583 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1725 = _1583;
            _1585 = _1725;
            if (!_1721)
            {
                _1613 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1727 = _1613;
            _1615 = _1727;
            if (!_1721)
            {
                _1647 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1729 = _1647;
            _1649 = _1729;
            if (!_1721)
            {
                _1625 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1731 = _1625;
            _1627 = _1731;
            if (!_1721)
            {
                _1637 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1733 = _1637;
            bool _1735 = !_1721;
            _1639 = _1733;
            if (!_1735)
            {
                bool _1737 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1739 = isnan(_974);
                bool _1741 = _1737 || _1739;
                bool _1743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1745 = _1741 || _1743;
                if (!_1745)
                {
                    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1749 = _974 + _1747;
                    float _1751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1751;
                    float _1755 = 1.0 / _1753;
                    float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1767 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1777 = _1749 * _1755;
                    float _1779 = precise::clamp(_1777, 0.0, 1.0);
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1785 = fma(_1779, _1759, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1787 = fma(_1779, _1783, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1789 = fma(_1779, _1763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1791 = fma(_1779, _1767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1793 = fma(_1779, _1771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1795 = fma(_1779, _1775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1585 = _1787;
                    _1627 = _1793;
                    _1579 = _1785;
                    _1649 = _1791;
                    _1615 = _1789;
                    _1639 = _1795;
                    _1711 = true;
                }
                else
                {
                    _1585 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1627 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1649 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1615 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1639 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1711 = false;
    float _1797 = _1585;
    float _1799 = _1627;
    float _1801 = _1579;
    float _1803 = _1649;
    float _1805 = _1615;
    float _1807 = _1639;
    float _1809 = fma(_1567, -0.5, 0.5);
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = -_1797;
    float _1815 = _1813 + _1799;
    float _1817 = -_1801;
    float _1819 = _1817 + _1803;
    float _1821 = -_1805;
    float _1823 = _1821 + _1807;
    bool _1825 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1827 = fma(_1811, _1815, _1797);
    float _1829 = fma(_1811, _1819, _1801);
    float _1831 = fma(_1811, _1823, _1805);
    float _1833 = _1827 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _1835 = fma(_1829, 0.298911988735198974609375, _1833);
    float _1837 = fma(_1831, 0.114477999508380889892578125, _1835);
    out.m_85.x = 0.0;
    float _1839 = -_1837;
    float _1841 = _1829 + _1839;
    float _1843 = -_1837;
    float _1845 = _1827 + _1843;
    float _1847 = -_1837;
    float _1849 = _1831 + _1847;
    float _1851 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1853 = fma(_1841, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1837);
    float _1855 = fma(_1845, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1837);
    float _1857 = fma(_1849, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1837);
    out.m_81.w = _1851;
    out.m_87.x = _1853;
    out.m_87.y = _1855;
    out.m_87.z = _1857;
    if (!_1825)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1859 = -_948;
    float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1863 = -_950;
    float _1865 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1867 = -_952;
    float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1871 = _1861 * _1861;
    float _1873 = fma(_1865, _1865, _1871);
    float _1875 = fma(_1869, _1869, _1873);
    float _1877 = sqrt(_1875);
    float _1879 = rsqrt(_1875);
    float _1881 = -_1877;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1885 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1887 = precise::clamp(_1885, 0.0, 1.0);
    float _1889 = _1865 * _1879;
    float _1891 = _1861 * _1879;
    float _1893 = abs(_1887);
    float _1895 = log2(_1893);
    float _1897 = _1869 * _1879;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1901 = _1567 * _1891;
    float _1903 = -_1891;
    float _1905 = -_1899;
    float _1907 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1905);
    float _1909 = fma(_1557, _1889, _1901);
    float _1911 = -_1897;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1907);
    float _1915 = fma(_1569, _1897, _1909);
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1921 = _1913 + _1919;
    float _1923 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1925 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1927 = precise::clamp(_1925, 0.0, 1.0);
    float _1929 = exp2(_1923);
    float _1931 = _1929 * _1927;
    float _1933 = _1917 * _1931;
    float _1935 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1937 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1939 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1935;
    out.m_85.y = _1937;
    out.m_85.z = _1939;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1711 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1996 = as_type<float>(_122);
        out.gl_Position.z = _1996;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2065 = as_type<float>(_160);
        out.gl_Position.z = _2065;
    }
    if (_154)
    {
        return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_53.z;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _192 + _196;
    float _200 = in.m_46.x;
    float _202 = in.m_46.y;
    float _204 = in.m_46.z;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    int _210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _212 = _210 != 0;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _216 = _214 != 0;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _220 = _218 != 0;
    float _222 = in.m_53.x;
    float _224 = 1.0 / _208;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = 1.0 / _228;
    float _232 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _234 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _236 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _238 = in.m_53.y;
    float _240 = _194 * 2.0;
    float _242 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _232);
    float _244 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _234);
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    float _250 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _236);
    float _252 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = _192 + _254;
    float _258 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _260 = _222 + _194;
    float _262 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].x, _252);
    float _264 = _222 * 2.0;
    float _266 = floor(_240);
    float _268 = _256 * _224;
    float _270 = _260 + (-1.0);
    float _272 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _274 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _276 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].z, _258);
    float _278 = _198 * _230;
    float _280 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].y, _272);
    float _282 = floor(_264);
    float _284 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].w, _274);
    float _286 = _238 * 2.0;
    float _288 = _238 + _194;
    float _290 = _222 + _238;
    float _292 = _194 + (-0.5);
    bool _294 = _266 > 0.0;
    float _296 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _298 = _266 >= 0.0;
    bool _300 = isnan(_266);
    bool _302 = _298 || _300;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    float _308 = floor(_286);
    float _310 = _288 + (-1.0);
    float _312 = _290 + (-1.0);
    int _314 = _306 ? 0 : 1;
    float _316 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _318 = ~_314;
    int _320 = _318 + 1;
    int _322 = _320 + 1;
    int _324 = _322;
    float _326 = _222;
    if (!_294)
    {
        int _328 = ~_314;
        int _330 = _328 + 1;
        _324 = _330;
    }
    int _332 = _324;
    float _334 = _248 * _140;
    float _336 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _242);
    float _338 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].x, _262);
    bool _340 = _308 > 0.0;
    float _342 = exp2(_334);
    bool _344 = _308 >= 0.0;
    bool _346 = isnan(_308);
    bool _348 = _344 || _346;
    bool _350 = isnan(0.0);
    bool _352 = _348 || _350;
    float _354 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _250);
    float _356 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].z, _276);
    float _358 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].y, _280);
    float _360 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].w, _284);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _364 = 1.0 + _362;
    bool _366 = !_212;
    int _368 = _366 ? 0 : 1;
    float _370 = sqrt(_336);
    float _372 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    bool _374 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _376 = isnan(0.0);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _382 = _378 || _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -_342;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    float _396 = 1.0 / _364;
    bool _398 = _282 > 0.0;
    float _400 = fma(_394, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _402 = _282 >= 0.0;
    bool _404 = isnan(_282);
    bool _406 = _402 || _404;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    float _412 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _244);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = _382 ? _390 : 0.0;
    float _420 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _422 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _424 = isnan(1.0);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _430 = _426 || _428;
    float _432 = fma(_386, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _434 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _436 = isnan(_192);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = fma(_416, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _456 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _458 = isnan(_192);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = -_444;
    float _474 = _472 + 1.0;
    float _476 = fma(_450, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _478 = fma(_454, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _480 = fma(_470, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _482 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _484 = isnan(_192);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = _466 * _474;
    float _496 = -_466;
    float _498 = _496 + 1.0;
    if (_430)
    {
        float _500 = _418 * _396;
        _144 = _500;
    }
    float _502 = _144;
    float _504 = in.m_55.x;
    float _506 = in.m_55.y;
    float _508 = in.m_55.z;
    bool _510 = !_216;
    int _512 = _510 ? 0 : 1;
    float _514 = _492 * _498;
    int _516 = abs(_368);
    float _518 = sqrt(_354);
    int _520 = abs(_512);
    float _522 = _432 * _514;
    int _524 = _410 ? 0 : 1;
    float _526 = _446 * _514;
    float _528 = float(_516);
    float _530 = _400 * _514;
    float _532 = float(_332);
    float _534 = sqrt(_412);
    int _536 = ~_524;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = _358 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    int _544 = _540;
    if (!_398)
    {
        int _546 = ~_524;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    float _552 = _528 * _532;
    float _554 = _370 * _372;
    float _556 = float(_550);
    float _558 = _356 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _560 = float(_520);
    float _562 = _552 * (-2.0);
    float _564 = _518 * _558;
    float _566 = fma(_562, _504, _504);
    float _568 = _534 * _542;
    float _570 = _560 * _556;
    bool _572 = !_220;
    int _574 = _572 ? 0 : 1;
    float _576 = _222 + (-0.5);
    int _578 = _352 ? 0 : 1;
    float _580 = fma(_420, _562, _420);
    int _582 = abs(_574);
    float _584 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[196].x, _566);
    int _586 = ~_578;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    float _592 = _570 * (-2.0);
    int _594 = _590;
    float _596 = _568;
    if (!_340)
    {
        int _598 = ~_578;
        int _600 = _598 + 1;
        _594 = _600;
    }
    int _602 = _594;
    float _604 = fma(_580, _502, _584);
    float _606 = float(_582);
    float _608 = fma(_316, _592, _316);
    float _610 = fma(_592, _506, _506);
    float _612 = _238 + (-0.5);
    float _614 = float(_602);
    float _616 = _604 * 0.15915493667125701904296875;
    float _618 = -_492;
    float _620 = _618 + 1.0;
    float _622 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[196].y, _610);
    float _624 = in.m_57.x;
    float _626 = in.m_57.y;
    float _628 = in.m_57.z;
    float _630 = _606 * _614;
    float _632 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[143].x, _522);
    float _634 = fma(_608, _502, _622);
    float _636 = in.m_59.x;
    float _638 = in.m_59.y;
    float _640 = in.m_59.z;
    float _642 = _630 * (-2.0);
    float _644 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[143].y, _526);
    float _646 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _648 = fma(_476, _494, _632);
    float _650 = fma(_642, _508, _508);
    float _652 = fma(_296, _642, _296);
    float _654 = fma(_478, _494, _644);
    float _656 = fma(_480, _494, _646);
    float _658 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[196].z, _650);
    float _660 = _634 * 0.15915493667125701904296875;
    float _662 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].x, _648);
    float _664 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].z, _656);
    float _666 = fma(_652, _502, _658);
    float _668 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].y, _654);
    float _670 = _616 * 6.283185482025146484375;
    float _672 = sin(_670);
    float _674 = _666 * 0.15915493667125701904296875;
    float _676 = _668 * _626;
    float _678 = _568 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _680 = _664 * _628;
    float _682 = _616 * 6.283185482025146484375;
    float _684 = cos(_682);
    float _686 = _662 * _624;
    float _688 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[24].x, _678);
    float _690 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _638);
    float _694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _640);
    float _696 = _568 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _698 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _700 = _660 * 6.283185482025146484375;
    float _702 = sin(_700);
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _636);
    float _706 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _696);
    float _710 = _690 * _692;
    float _712 = _698 * _694;
    float _714 = _706 * _704;
    float _716 = _360 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _718 = _660 * 6.283185482025146484375;
    float _720 = cos(_718);
    float _722 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[24].z, _688);
    float _724 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[26].z, _708);
    bool _726 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _728 = isnan(0.5);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _734 = _730 || _732;
    float _736 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[24].w, _722);
    float _738 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[26].w, _724);
    float _740 = _674 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _684 * _702;
    float _746 = _738 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _748 = _736 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _750 = _674 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _672 * _720;
    float _756 = _684 * _720;
    float _758 = _672 * _742;
    float _760 = _672 * _702;
    float _762 = _720 * _742;
    float _764 = _702 * _742;
    float _766 = _758 * _710;
    float _768 = _684 * _742;
    float _770 = -_744;
    float _772 = fma(_752, _754, _770);
    float _774 = -_710;
    float _776 = _752 * _774;
    float _778 = fma(_752, _760, _756);
    float _780 = fma(_752, _756, _760);
    float _782 = fma(_772, _714, _766);
    float _784 = fma(_762, _714, _776);
    float _786 = _768 * _710;
    float _788 = -_754;
    float _790 = fma(_752, _744, _788);
    float _792 = fma(_778, _712, _782);
    float _794 = fma(_764, _712, _784);
    float _796 = _568 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _798 = fma(_780, _714, _786);
    float _800 = _746 + _792;
    float _802 = _748 + _794;
    float _804 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[25].x, _796);
    float _806 = fma(_790, _712, _798);
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _810 = _800 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _802 + _812;
    float _816 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[25].z, _804);
    float _818 = _810 * _810;
    float _820 = fma(_814, _814, _818);
    float _822 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[25].w, _816);
    float _824 = sqrt(_820);
    float _826 = _822 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _828 = _826 + _806;
    bool _830 = _824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _832 = _660;
    float _834 = _802;
    float _836 = _800;
    float _838 = _804;
    float _840 = _828;
    float _842 = _820;
    if (!_830)
    {
        _832 = _828;
    }
    float _844 = _832;
    bool _846 = !_830;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _854 = _824 + _852;
        float _856 = rsqrt(_820);
        float _858 = _854 * _850;
        float _860 = _828 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = _858 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = _872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = fma(_870, _860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _878 = fma(_828, _866, _874);
        float _880 = _856 * _876;
        float _882 = fma(_814, _880, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _884 = fma(_810, _880, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _848 = _878;
        _834 = _882;
        _836 = _884;
    }
    float _886 = _848;
    float _888 = _834;
    float _890 = _836;
    float _892 = _886;
    float _894 = _888;
    float _896 = _890;
    if (!_734)
    {
        float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _900 = _826 + _898;
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _904 = _748 + _902;
        float _906 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _908 = -_826;
        float _910 = _908 + _886;
        float _912 = _900 * _900;
        float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _916 = _746 + _914;
        float _918 = fma(_904, _904, _912);
        float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _922 = fma(_916, _916, _918);
        float _924 = sqrt(_922);
        float _926 = _906 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _928 = precise::min(_924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _930 = _928 * _920;
        float _932 = -_748;
        float _934 = _932 + _888;
        float _936 = _926 * _930;
        float _938 = -_746;
        float _940 = _938 + _890;
        float _942 = fma(_934, _936, _748);
        float _944 = fma(_910, _936, _826);
        float _946 = fma(_940, _936, _746);
        _892 = _944;
        _894 = _942;
        _896 = _946;
    }
    float _948 = _892;
    float _950 = _894;
    float _952 = _896;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _956 = _948 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _960 = _950 + _958;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _964 = _952 + _962;
    float _966 = _956 * _956;
    float _968 = fma(_960, _960, _966);
    float _970 = fma(_964, _964, _968);
    float _972 = rsqrt(_970);
    float _974 = sqrt(_970);
    float _976 = _972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _978 = _960 * _976;
    float _980 = _964 * _976;
    float _982 = _978 * _978;
    float _984 = _980 * _980;
    float _986 = _982 + _984;
    float _988 = sqrt(_986);
    bool _990 = _988 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _988 + _992;
    float _996 = _964;
    float _998 = _994;
    float _1000 = _956;
    if (_990)
    {
        float _1002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _996 = _1002;
    }
    float _1004 = _996;
    if (_990)
    {
        float _1006 = rsqrt(_986);
        _838 = _1006;
    }
    float _1008 = _838;
    float _1010 = _1008;
    if (_990)
    {
        float _1012 = _994 * _1004;
        _998 = _1012;
    }
    float _1014 = _998;
    if (_990)
    {
        float _1016 = _1014 * 0.15915493667125701904296875;
        _596 = _1016;
    }
    float _1018 = _596;
    float _1020 = _966;
    if (_990)
    {
        float _1022 = _1018 * 6.283185482025146484375;
        float _1024 = sin(_1022);
        _1020 = _1024;
    }
    float _1026 = _1020;
    float _1028 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1030 = precise::max(0.0, _1028);
    float _1032 = _972;
    float _1034 = _1028;
    float _1036 = _1030;
    if (_990)
    {
        float _1038 = _1018 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        _1032 = _1040;
    }
    float _1042 = _1032;
    float _1044 = -_976;
    float _1046 = -_1030;
    float _1048 = fma(_956, _1044, _1046);
    if (_990)
    {
        float _1050 = _1048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1050;
    }
    float _1052 = _1034;
    float _1054 = _1026;
    if (_990)
    {
        float _1056 = fma(_1026, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _840 = _1056;
    }
    float _1058 = _840;
    float _1060 = _1058;
    if (!_990)
    {
        _1054 = _1048;
    }
    float _1062 = _1054;
    float _1064 = _1062;
    float _1066 = _1042;
    if (_990)
    {
        float _1068 = _1042 + (-1.0);
        _1000 = _1068;
    }
    float _1070 = _1000;
    float _1072 = _1070;
    if (_990)
    {
        float _1074 = _1008 * _1058;
        _842 = _1074;
    }
    float _1076 = _842;
    if (!_990)
    {
        _1010 = _978;
    }
    float _1078 = _1010;
    float _1080 = _1078;
    if (_990)
    {
        float _1082 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1082;
    }
    float _1084 = _1036;
    if (_990)
    {
        float _1086 = _978 * _1076;
        _1080 = _1086;
    }
    float _1088 = _1080;
    if (!_990)
    {
        _1072 = _980;
    }
    float _1090 = _1072;
    float _1092 = _1090;
    if (_990)
    {
        float _1094 = _980 * _1076;
        _1092 = _1094;
    }
    float _1096 = _1092;
    if (_990)
    {
        float _1098 = fma(_1048, _1042, _1084);
        _1064 = _1098;
    }
    float _1100 = _1064;
    if (!_990)
    {
        _1066 = _982;
    }
    float _1102 = _1066;
    float _1104 = _1102;
    if (_990)
    {
        float _1106 = _1088 * _1088;
        _1104 = _1106;
    }
    float _1108 = _1104;
    if (!_990)
    {
        _1060 = _984;
    }
    float _1110 = _1060;
    float _1112 = _1110;
    if (_990)
    {
        float _1114 = _1096 * _1096;
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = fma(_1100, _1100, _1108);
    float _1120 = _948 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1122 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1124 = _948 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1126 = _1118 + _1116;
    float _1128 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1120);
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1132 = fma(_974, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1130);
    float _1134 = precise::clamp(_1132, 0.0, 1.0);
    float _1136 = _948 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1128);
    float _1140 = rsqrt(_1126);
    float _1142 = -_1134;
    float _1144 = _1142 + 1.0;
    float _1146 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1148 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1150 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1136);
    float _1152 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1124);
    float _1154 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1156 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1150);
    float _1158 = abs(_1144);
    float _1160 = log2(_1158);
    float _1162 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1152);
    float _1164 = -_1154;
    float _1166 = fma(_1164, _1146, 1.0);
    float _1168 = _948 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1172 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1174 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1176 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1178 = _1140 * _1088;
    float _1180 = floor(_1122);
    float _1182 = _1140 * _1100;
    float _1184 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1176);
    float _1186 = _1140 * _1096;
    float _1188 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1190 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1192 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1194 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1196 = -_1188;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1196);
    float _1200 = floor(_1172);
    float _1202 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1190);
    float _1204 = -_1186;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1198);
    float _1208 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1202);
    float _1210 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1212 = fma(_1206, -0.5, 0.5);
    float _1214 = -_1180;
    float _1216 = _1122 + _1214;
    float _1218 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1208);
    float _1220 = log2(_1166);
    float _1222 = fma(_1206, 0.5, 0.5);
    float _1224 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1226 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1210);
    float _1228 = fma(_1222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1230 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1224);
    float _1232 = -_1200;
    float _1234 = _1172 + _1232;
    float _1236 = exp2(_1194);
    float _1238 = fma(_1222, _1228, -0.212114393711090087890625);
    float _1240 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1230);
    float _1242 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1226);
    float _1244 = _1182 + 1.0;
    float _1246 = 1.0 / _1218;
    float _1248 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1240);
    float _1250 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1242);
    float _1252 = _1220 * 0.693147182464599609375;
    float _1254 = sqrt(_1212);
    float _1256 = -_1182;
    float _1258 = fma(_1236, _1244, _1256);
    float2 _3826 = float2(_1216, _1234);
    float _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3826, float2(0.0), isnan(_3826)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3826, float2(0.0), isnan(_3826)), level(0.0)).x;
    float _1262 = fma(_1222, _1238, 1.570728778839111328125);
    float _1264 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1266 = _1248 * _1246;
    float _1268 = _1250 * _1246;
    float _1270 = fma(_1266, 0.5, 0.5);
    float _1272 = fma(_1268, -0.5, 0.5);
    float _1274 = _1254 * 0.636619746685028076171875;
    float3 _3858 = float3(_1270, _1272, _1264);
    float _1276 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3858, float3(0.0), isnan(_3858)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3858, float3(0.0), isnan(_3858)), level(0.0)).x;
    float _1278 = -_1262;
    float _1280 = fma(_1274, _1278, 1.0);
    float _1282 = fma(_1258, 0.5, 0.5);
    float3 _3876 = float3(_1270, _1272, _1264);
    float4 _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3876, float3(0.0), isnan(_3876)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3876, float3(0.0), isnan(_3876)), level(0.0)).xyzw;
    float _1287 = _1285.x;
    float _1289 = _1285.y;
    float _1291 = _1285.z;
    float _1293 = _1285.w;
    float2 _3892 = float2(_1280, _1282);
    float3 _1297 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3892, float2(0.0), isnan(_3892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3892, float2(0.0), isnan(_3892)), level(0.0)).xyz;
    float _1299 = _1297.x;
    float _1301 = _1297.y;
    float _1303 = _1297.z;
    float _1305 = _826 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1307 = _826 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1309 = in.m_61.y;
    bool _1311 = _238 > 0.5;
    float _1313 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1305);
    float _1315 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1307);
    float _1317 = in.m_61.x;
    float _1319 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1313);
    float _1321 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1315);
    float _1323 = in.m_63.x;
    float _1325 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1327 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1329 = in.m_63.y;
    float _1331 = 1.0 / _1325;
    float _1333 = _1327 + _1325;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1337 = _1335 != 0;
    float _1339 = in.m_63.z;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1343 = _1341 != 0;
    float _1345 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1347 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1351 = _222 > 0.5;
    bool _1353 = _1351 && _1343;
    float _1355 = -_1309;
    float _1357 = _1355 + 1.0;
    float _1359 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1347);
    float _1361 = in.m_63.w;
    float _1363 = _1309;
    float _1365 = _1317;
    float _1367 = _1218;
    float _1369 = _1250;
    if (_1337)
    {
        float _1371 = _1311 ? _1357 : _1309;
        _1363 = _1371;
    }
    float _1373 = _1363;
    float _1375 = _1333 * _1331;
    float _1377 = _1375 * 0.5;
    bool _1379 = _638 != 0.0;
    bool _1381 = isnan(_638);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan(0.0);
    bool _1387 = _1383 || _1385;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_65.x = _1323;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1393 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1391);
    float _1395 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_65.y = _1329;
    bool _1397 = _636 == 0.0;
    bool _1399 = !_1387;
    bool _1401 = _1397 && _1399;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1405 = 1.0 / _1393;
    out.m_65.z = _1339;
    bool _1407 = _640 == 0.0;
    bool _1409 = _1407 && _1401;
    float _1411 = _1395 * _1349;
    if (_1343)
    {
        _326 = _1317;
    }
    float _1413 = _326;
    float _1415 = in.m_67.x;
    float _1417 = in.m_67.y;
    float _1419 = in.m_67.z;
    float _1421 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = exp2(_1345);
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1431 = _1413;
    if (_1353)
    {
        float _1433 = -_1413;
        float _1435 = _1433 + 1.0;
        _1431 = _1435;
    }
    float _1437 = _1431;
    float _1439 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1359);
    out.m_65.w = _1361;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1443 = _1405 * _1441;
    if (_1343)
    {
        _1365 = _1437;
    }
    float _1445 = _1365;
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1451 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1455 = -_1423;
    float _1457 = _1455 + 1.0;
    float _1459 = abs(_1443);
    float _1461 = log2(_1459);
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1465 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1419;
    float _1469 = _1417;
    float _1471 = _1415;
    if (!_1409)
    {
        float _1473 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1419);
        _1467 = _1473;
    }
    float _1475 = _1467;
    if (!_1409)
    {
        float _1477 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1417);
        _1469 = _1477;
    }
    float _1479 = _1469;
    if (!_1409)
    {
        float _1481 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1415);
        _1471 = _1481;
    }
    float _1483 = _1471;
    bool _1485 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1487 = isnan(_974);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1493 = _1489 || _1491;
    float _1495 = _1451 * _1447;
    float _1497 = -_1479;
    float _1499 = _752 * _1497;
    float _1501 = _768 * _1479;
    float _1503 = _758 * _1479;
    bool _1505 = _1443 <= 8000.0;
    bool _1507 = isnan(_1443);
    bool _1509 = _1505 || _1507;
    bool _1511 = isnan(8000.0);
    bool _1513 = _1509 || _1511;
    float _1515 = float(_1513);
    float _1517 = fma(_762, _1483, _1499);
    float _1519 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1439);
    float _1521 = fma(_780, _1483, _1501);
    float _1523 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1525 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1527 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1529 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1495;
    out.m_69.y = _1411;
    float _1531 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1533 = exp2(_1523);
    out.m_71.x = _1465;
    out.m_71.y = _1421;
    out.m_71.z = _1525;
    out.m_71.w = _1463;
    float _1535 = in.m_73.x;
    out.m_75.x = _1527;
    out.m_75.y = _1529;
    out.m_75.z = _1531;
    out.m_75.w = _1429;
    float _1537 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1539 = precise::clamp(_1537, 0.0, 1.0);
    float _1541 = fma(_1539, -2.0, 3.0);
    float _1543 = _1539 * _1539;
    float _1545 = _1543 * _1541;
    float _1547 = -_1545;
    float _1549 = _1547 + 1.0;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1545);
    float _1553 = _1519 + _1218;
    float _1555 = fma(_772, _1483, _1503);
    float _1557 = fma(_764, _1475, _1517);
    float _1559 = _1515 * _1551;
    float _1561 = _1553 * 0.5;
    float _1563 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1565 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1567 = fma(_790, _1475, _1521);
    float _1569 = fma(_778, _1475, _1555);
    out.m_77.z = _1561;
    out.m_77.w = _1218;
    out.m_79.x = _1557;
    out.m_79.y = _1567;
    out.m_79.z = _1569;
    out.gl_Position.x = _1248;
    out.gl_Position.y = _1250;
    out.gl_Position.z = _1519;
    out.gl_Position.w = _1218;
    float _1571 = _1248;
    float _1573 = _1563;
    if (!_1493)
    {
        _1367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1575 = _1367;
    float _1577 = _1575;
    float _1579 = _1575;
    if (!_1493)
    {
        _1571 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1581 = _1571;
    float _1583 = _1581;
    float _1585 = _1581;
    if (!_1493)
    {
        _1369 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1587 = _1369;
    float _1589 = -_1260;
    float _1591 = _1589 + 1.0;
    float _1593 = _1591 * _1565;
    float _1595 = precise::clamp(_1593, 0.0, 1.0);
    float _1597 = -_1595;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1601 = -_1563;
    float _1603 = _1601 + 1.0;
    float _1605 = _1599 * _1535;
    float _1607 = _1563 * _1276;
    float _1609 = _1605 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1611 = _1603;
    float _1613 = _1587;
    float _1615 = _1587;
    if (!_1493)
    {
        _1573 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1617 = _1573;
    float _1619 = _1293 * _1607;
    float _1621 = _1293 * _1603;
    out.m_81.x = _1609;
    float _1623 = _1619;
    float _1625 = _1617;
    float _1627 = _1617;
    if (!_1493)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1629 = _1611;
    float _1631 = _1303 * _1607;
    float _1633 = fma(_1299, _1619, _1287);
    float _1635 = fma(_1301, _1619, _1289);
    float _1637 = _1629;
    float _1639 = _1629;
    if (!_1493)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1641 = _1623;
    float _1643 = fma(_1293, _1631, _1291);
    out.m_83.x = _1633;
    out.m_83.y = _1635;
    out.m_83.z = _1643;
    out.m_83.w = _1621;
    bool _1645 = !_1493;
    float _1647 = _1641;
    float _1649 = _1641;
    if (!_1645)
    {
        bool _1651 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1653 = isnan(_974);
        bool _1655 = _1651 || _1653;
        bool _1657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1659 = _1655 || _1657;
        if (!_1659)
        {
            float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1663 = _974 + _1661;
            float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1665;
            float _1669 = 1.0 / _1667;
            float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1673 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1677 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1691 = _1663 * _1669;
            float _1693 = precise::clamp(_1691, 0.0, 1.0);
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1699 = fma(_1693, _1673, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1701 = fma(_1693, _1697, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1703 = fma(_1693, _1677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1705 = fma(_1693, _1681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1707 = fma(_1693, _1685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1709 = fma(_1693, _1689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1585 = _1701;
            _1627 = _1707;
            _1579 = _1699;
            _1649 = _1705;
            _1615 = _1703;
            _1639 = _1709;
            _1711 = true;
        }
        else
        {
            bool _1713 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1715 = isnan(_974);
            bool _1717 = _1713 || _1715;
            bool _1719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1721 = _1717 || _1719;
            if (!_1721)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1723 = _1577;
            _1579 = _1723;
            if (!_1721)
            {
                _1583 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1725 = _1583;
            _1585 = _1725;
            if (!_1721)
            {
                _1613 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1727 = _1613;
            _1615 = _1727;
            if (!_1721)
            {
                _1647 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1729 = _1647;
            _1649 = _1729;
            if (!_1721)
            {
                _1625 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1731 = _1625;
            _1627 = _1731;
            if (!_1721)
            {
                _1637 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1733 = _1637;
            bool _1735 = !_1721;
            _1639 = _1733;
            if (!_1735)
            {
                bool _1737 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1739 = isnan(_974);
                bool _1741 = _1737 || _1739;
                bool _1743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1745 = _1741 || _1743;
                if (!_1745)
                {
                    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1749 = _974 + _1747;
                    float _1751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1751;
                    float _1755 = 1.0 / _1753;
                    float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1767 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1777 = _1749 * _1755;
                    float _1779 = precise::clamp(_1777, 0.0, 1.0);
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1785 = fma(_1779, _1759, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1787 = fma(_1779, _1783, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1789 = fma(_1779, _1763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1791 = fma(_1779, _1767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1793 = fma(_1779, _1771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1795 = fma(_1779, _1775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1585 = _1787;
                    _1627 = _1793;
                    _1579 = _1785;
                    _1649 = _1791;
                    _1615 = _1789;
                    _1639 = _1795;
                    _1711 = true;
                }
                else
                {
                    _1585 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1627 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1649 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1615 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1639 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1711 = false;
    float _1797 = _1585;
    float _1799 = _1627;
    float _1801 = _1579;
    float _1803 = _1649;
    float _1805 = _1615;
    float _1807 = _1639;
    float _1809 = fma(_1567, -0.5, 0.5);
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = -_1797;
    float _1815 = _1813 + _1799;
    float _1817 = -_1801;
    float _1819 = _1817 + _1803;
    float _1821 = -_1805;
    float _1823 = _1821 + _1807;
    bool _1825 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1827 = fma(_1811, _1815, _1797);
    float _1829 = fma(_1811, _1819, _1801);
    float _1831 = fma(_1811, _1823, _1805);
    float _1833 = _1827 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _1835 = fma(_1829, 0.298911988735198974609375, _1833);
    float _1837 = fma(_1831, 0.114477999508380889892578125, _1835);
    out.m_85.x = 0.0;
    float _1839 = -_1837;
    float _1841 = _1829 + _1839;
    float _1843 = -_1837;
    float _1845 = _1827 + _1843;
    float _1847 = -_1837;
    float _1849 = _1831 + _1847;
    float _1851 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1853 = fma(_1841, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1837);
    float _1855 = fma(_1845, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1837);
    float _1857 = fma(_1849, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1837);
    out.m_81.w = _1851;
    out.m_87.x = _1853;
    out.m_87.y = _1855;
    out.m_87.z = _1857;
    if (!_1825)
    {
        return out;
    }
    float _1859 = -_948;
    float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1863 = -_950;
    float _1865 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1867 = -_952;
    float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1871 = _1861 * _1861;
    float _1873 = fma(_1865, _1865, _1871);
    float _1875 = fma(_1869, _1869, _1873);
    float _1877 = sqrt(_1875);
    float _1879 = rsqrt(_1875);
    float _1881 = -_1877;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1885 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1887 = precise::clamp(_1885, 0.0, 1.0);
    float _1889 = _1865 * _1879;
    float _1891 = _1861 * _1879;
    float _1893 = abs(_1887);
    float _1895 = log2(_1893);
    float _1897 = _1869 * _1879;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1901 = _1567 * _1891;
    float _1903 = -_1891;
    float _1905 = -_1899;
    float _1907 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1905);
    float _1909 = fma(_1557, _1889, _1901);
    float _1911 = -_1897;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1907);
    float _1915 = fma(_1569, _1897, _1909);
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1921 = _1913 + _1919;
    float _1923 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1925 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1927 = precise::clamp(_1925, 0.0, 1.0);
    float _1929 = exp2(_1923);
    float _1931 = _1929 * _1927;
    float _1933 = _1917 * _1931;
    float _1935 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1937 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1939 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1935;
    out.m_85.y = _1937;
    out.m_85.z = _1939;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1711 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1996 = as_type<float>(_122);
        out.gl_Position.z = _1996;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2065 = as_type<float>(_160);
        out.gl_Position.z = _2065;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_53.z;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _192 + _196;
    float _200 = in.m_46.x;
    float _202 = in.m_46.y;
    float _204 = in.m_46.z;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    int _210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _212 = _210 != 0;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _216 = _214 != 0;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _220 = _218 != 0;
    float _222 = in.m_53.x;
    float _224 = 1.0 / _208;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = 1.0 / _228;
    float _232 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _234 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _236 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _238 = in.m_53.y;
    float _240 = _194 * 2.0;
    float _242 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _232);
    float _244 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _234);
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    float _250 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _236);
    float _252 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = _192 + _254;
    float _258 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _260 = _222 + _194;
    float _262 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].x, _252);
    float _264 = _222 * 2.0;
    float _266 = floor(_240);
    float _268 = _256 * _224;
    float _270 = _260 + (-1.0);
    float _272 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _274 = _202 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _276 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].z, _258);
    float _278 = _198 * _230;
    float _280 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].y, _272);
    float _282 = floor(_264);
    float _284 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[14].w, _274);
    float _286 = _238 * 2.0;
    float _288 = _238 + _194;
    float _290 = _222 + _238;
    float _292 = _194 + (-0.5);
    bool _294 = _266 > 0.0;
    float _296 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _298 = _266 >= 0.0;
    bool _300 = isnan(_266);
    bool _302 = _298 || _300;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    float _308 = floor(_286);
    float _310 = _288 + (-1.0);
    float _312 = _290 + (-1.0);
    int _314 = _306 ? 0 : 1;
    float _316 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _318 = ~_314;
    int _320 = _318 + 1;
    int _322 = _320 + 1;
    int _324 = _322;
    float _326 = _222;
    if (!_294)
    {
        int _328 = ~_314;
        int _330 = _328 + 1;
        _324 = _330;
    }
    int _332 = _324;
    float _334 = _248 * _140;
    float _336 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _242);
    float _338 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].x, _262);
    bool _340 = _308 > 0.0;
    float _342 = exp2(_334);
    bool _344 = _308 >= 0.0;
    bool _346 = isnan(_308);
    bool _348 = _344 || _346;
    bool _350 = isnan(0.0);
    bool _352 = _348 || _350;
    float _354 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _250);
    float _356 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].z, _276);
    float _358 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].y, _280);
    float _360 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[16].w, _284);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _364 = 1.0 + _362;
    bool _366 = !_212;
    int _368 = _366 ? 0 : 1;
    float _370 = sqrt(_336);
    float _372 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    bool _374 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _376 = isnan(0.0);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _382 = _378 || _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -_342;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    float _396 = 1.0 / _364;
    bool _398 = _282 > 0.0;
    float _400 = fma(_394, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _402 = _282 >= 0.0;
    bool _404 = isnan(_282);
    bool _406 = _402 || _404;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    float _412 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _244);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = _382 ? _390 : 0.0;
    float _420 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _422 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _424 = isnan(1.0);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _430 = _426 || _428;
    float _432 = fma(_386, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _434 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _436 = isnan(_192);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = fma(_416, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _456 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _458 = isnan(_192);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = -_444;
    float _474 = _472 + 1.0;
    float _476 = fma(_450, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _478 = fma(_454, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _480 = fma(_470, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _482 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _484 = isnan(_192);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = _466 * _474;
    float _496 = -_466;
    float _498 = _496 + 1.0;
    if (_430)
    {
        float _500 = _418 * _396;
        _144 = _500;
    }
    float _502 = _144;
    float _504 = in.m_55.x;
    float _506 = in.m_55.y;
    float _508 = in.m_55.z;
    bool _510 = !_216;
    int _512 = _510 ? 0 : 1;
    float _514 = _492 * _498;
    int _516 = abs(_368);
    float _518 = sqrt(_354);
    int _520 = abs(_512);
    float _522 = _432 * _514;
    int _524 = _410 ? 0 : 1;
    float _526 = _446 * _514;
    float _528 = float(_516);
    float _530 = _400 * _514;
    float _532 = float(_332);
    float _534 = sqrt(_412);
    int _536 = ~_524;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = _358 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    int _544 = _540;
    if (!_398)
    {
        int _546 = ~_524;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    float _552 = _528 * _532;
    float _554 = _370 * _372;
    float _556 = float(_550);
    float _558 = _356 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _560 = float(_520);
    float _562 = _552 * (-2.0);
    float _564 = _518 * _558;
    float _566 = fma(_562, _504, _504);
    float _568 = _534 * _542;
    float _570 = _560 * _556;
    bool _572 = !_220;
    int _574 = _572 ? 0 : 1;
    float _576 = _222 + (-0.5);
    int _578 = _352 ? 0 : 1;
    float _580 = fma(_420, _562, _420);
    int _582 = abs(_574);
    float _584 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[196].x, _566);
    int _586 = ~_578;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    float _592 = _570 * (-2.0);
    int _594 = _590;
    float _596 = _568;
    if (!_340)
    {
        int _598 = ~_578;
        int _600 = _598 + 1;
        _594 = _600;
    }
    int _602 = _594;
    float _604 = fma(_580, _502, _584);
    float _606 = float(_582);
    float _608 = fma(_316, _592, _316);
    float _610 = fma(_592, _506, _506);
    float _612 = _238 + (-0.5);
    float _614 = float(_602);
    float _616 = _604 * 0.15915493667125701904296875;
    float _618 = -_492;
    float _620 = _618 + 1.0;
    float _622 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[196].y, _610);
    float _624 = in.m_57.x;
    float _626 = in.m_57.y;
    float _628 = in.m_57.z;
    float _630 = _606 * _614;
    float _632 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[143].x, _522);
    float _634 = fma(_608, _502, _622);
    float _636 = in.m_59.x;
    float _638 = in.m_59.y;
    float _640 = in.m_59.z;
    float _642 = _630 * (-2.0);
    float _644 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[143].y, _526);
    float _646 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _648 = fma(_476, _494, _632);
    float _650 = fma(_642, _508, _508);
    float _652 = fma(_296, _642, _296);
    float _654 = fma(_478, _494, _644);
    float _656 = fma(_480, _494, _646);
    float _658 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[196].z, _650);
    float _660 = _634 * 0.15915493667125701904296875;
    float _662 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].x, _648);
    float _664 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].z, _656);
    float _666 = fma(_652, _502, _658);
    float _668 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[145].y, _654);
    float _670 = _616 * 6.283185482025146484375;
    float _672 = sin(_670);
    float _674 = _666 * 0.15915493667125701904296875;
    float _676 = _668 * _626;
    float _678 = _568 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _680 = _664 * _628;
    float _682 = _616 * 6.283185482025146484375;
    float _684 = cos(_682);
    float _686 = _662 * _624;
    float _688 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[24].x, _678);
    float _690 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _638);
    float _694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _640);
    float _696 = _568 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _698 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _700 = _660 * 6.283185482025146484375;
    float _702 = sin(_700);
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _636);
    float _706 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _696);
    float _710 = _690 * _692;
    float _712 = _698 * _694;
    float _714 = _706 * _704;
    float _716 = _360 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _718 = _660 * 6.283185482025146484375;
    float _720 = cos(_718);
    float _722 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[24].z, _688);
    float _724 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[26].z, _708);
    bool _726 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _728 = isnan(0.5);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _734 = _730 || _732;
    float _736 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[24].w, _722);
    float _738 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[26].w, _724);
    float _740 = _674 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _684 * _702;
    float _746 = _738 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _748 = _736 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _750 = _674 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _672 * _720;
    float _756 = _684 * _720;
    float _758 = _672 * _742;
    float _760 = _672 * _702;
    float _762 = _720 * _742;
    float _764 = _702 * _742;
    float _766 = _758 * _710;
    float _768 = _684 * _742;
    float _770 = -_744;
    float _772 = fma(_752, _754, _770);
    float _774 = -_710;
    float _776 = _752 * _774;
    float _778 = fma(_752, _760, _756);
    float _780 = fma(_752, _756, _760);
    float _782 = fma(_772, _714, _766);
    float _784 = fma(_762, _714, _776);
    float _786 = _768 * _710;
    float _788 = -_754;
    float _790 = fma(_752, _744, _788);
    float _792 = fma(_778, _712, _782);
    float _794 = fma(_764, _712, _784);
    float _796 = _568 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _798 = fma(_780, _714, _786);
    float _800 = _746 + _792;
    float _802 = _748 + _794;
    float _804 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[25].x, _796);
    float _806 = fma(_790, _712, _798);
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _810 = _800 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _802 + _812;
    float _816 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[25].z, _804);
    float _818 = _810 * _810;
    float _820 = fma(_814, _814, _818);
    float _822 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[25].w, _816);
    float _824 = sqrt(_820);
    float _826 = _822 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _828 = _826 + _806;
    bool _830 = _824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _832 = _660;
    float _834 = _802;
    float _836 = _800;
    float _838 = _804;
    float _840 = _828;
    float _842 = _820;
    if (!_830)
    {
        _832 = _828;
    }
    float _844 = _832;
    bool _846 = !_830;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _854 = _824 + _852;
        float _856 = rsqrt(_820);
        float _858 = _854 * _850;
        float _860 = _828 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = _858 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = _872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = fma(_870, _860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _878 = fma(_828, _866, _874);
        float _880 = _856 * _876;
        float _882 = fma(_814, _880, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _884 = fma(_810, _880, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _848 = _878;
        _834 = _882;
        _836 = _884;
    }
    float _886 = _848;
    float _888 = _834;
    float _890 = _836;
    float _892 = _886;
    float _894 = _888;
    float _896 = _890;
    if (!_734)
    {
        float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _900 = _826 + _898;
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _904 = _748 + _902;
        float _906 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _908 = -_826;
        float _910 = _908 + _886;
        float _912 = _900 * _900;
        float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _916 = _746 + _914;
        float _918 = fma(_904, _904, _912);
        float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _922 = fma(_916, _916, _918);
        float _924 = sqrt(_922);
        float _926 = _906 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _928 = precise::min(_924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _930 = _928 * _920;
        float _932 = -_748;
        float _934 = _932 + _888;
        float _936 = _926 * _930;
        float _938 = -_746;
        float _940 = _938 + _890;
        float _942 = fma(_934, _936, _748);
        float _944 = fma(_910, _936, _826);
        float _946 = fma(_940, _936, _746);
        _892 = _944;
        _894 = _942;
        _896 = _946;
    }
    float _948 = _892;
    float _950 = _894;
    float _952 = _896;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _956 = _948 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _960 = _950 + _958;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _964 = _952 + _962;
    float _966 = _956 * _956;
    float _968 = fma(_960, _960, _966);
    float _970 = fma(_964, _964, _968);
    float _972 = rsqrt(_970);
    float _974 = sqrt(_970);
    float _976 = _972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _978 = _960 * _976;
    float _980 = _964 * _976;
    float _982 = _978 * _978;
    float _984 = _980 * _980;
    float _986 = _982 + _984;
    float _988 = sqrt(_986);
    bool _990 = _988 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _988 + _992;
    float _996 = _964;
    float _998 = _994;
    float _1000 = _956;
    if (_990)
    {
        float _1002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _996 = _1002;
    }
    float _1004 = _996;
    if (_990)
    {
        float _1006 = rsqrt(_986);
        _838 = _1006;
    }
    float _1008 = _838;
    float _1010 = _1008;
    if (_990)
    {
        float _1012 = _994 * _1004;
        _998 = _1012;
    }
    float _1014 = _998;
    if (_990)
    {
        float _1016 = _1014 * 0.15915493667125701904296875;
        _596 = _1016;
    }
    float _1018 = _596;
    float _1020 = _966;
    if (_990)
    {
        float _1022 = _1018 * 6.283185482025146484375;
        float _1024 = sin(_1022);
        _1020 = _1024;
    }
    float _1026 = _1020;
    float _1028 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1030 = precise::max(0.0, _1028);
    float _1032 = _972;
    float _1034 = _1028;
    float _1036 = _1030;
    if (_990)
    {
        float _1038 = _1018 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        _1032 = _1040;
    }
    float _1042 = _1032;
    float _1044 = -_976;
    float _1046 = -_1030;
    float _1048 = fma(_956, _1044, _1046);
    if (_990)
    {
        float _1050 = _1048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1050;
    }
    float _1052 = _1034;
    float _1054 = _1026;
    if (_990)
    {
        float _1056 = fma(_1026, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _840 = _1056;
    }
    float _1058 = _840;
    float _1060 = _1058;
    if (!_990)
    {
        _1054 = _1048;
    }
    float _1062 = _1054;
    float _1064 = _1062;
    float _1066 = _1042;
    if (_990)
    {
        float _1068 = _1042 + (-1.0);
        _1000 = _1068;
    }
    float _1070 = _1000;
    float _1072 = _1070;
    if (_990)
    {
        float _1074 = _1008 * _1058;
        _842 = _1074;
    }
    float _1076 = _842;
    if (!_990)
    {
        _1010 = _978;
    }
    float _1078 = _1010;
    float _1080 = _1078;
    if (_990)
    {
        float _1082 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1082;
    }
    float _1084 = _1036;
    if (_990)
    {
        float _1086 = _978 * _1076;
        _1080 = _1086;
    }
    float _1088 = _1080;
    if (!_990)
    {
        _1072 = _980;
    }
    float _1090 = _1072;
    float _1092 = _1090;
    if (_990)
    {
        float _1094 = _980 * _1076;
        _1092 = _1094;
    }
    float _1096 = _1092;
    if (_990)
    {
        float _1098 = fma(_1048, _1042, _1084);
        _1064 = _1098;
    }
    float _1100 = _1064;
    if (!_990)
    {
        _1066 = _982;
    }
    float _1102 = _1066;
    float _1104 = _1102;
    if (_990)
    {
        float _1106 = _1088 * _1088;
        _1104 = _1106;
    }
    float _1108 = _1104;
    if (!_990)
    {
        _1060 = _984;
    }
    float _1110 = _1060;
    float _1112 = _1110;
    if (_990)
    {
        float _1114 = _1096 * _1096;
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = fma(_1100, _1100, _1108);
    float _1120 = _948 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1122 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1124 = _948 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1126 = _1118 + _1116;
    float _1128 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1120);
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1132 = fma(_974, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1130);
    float _1134 = precise::clamp(_1132, 0.0, 1.0);
    float _1136 = _948 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1128);
    float _1140 = rsqrt(_1126);
    float _1142 = -_1134;
    float _1144 = _1142 + 1.0;
    float _1146 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1148 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1150 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1136);
    float _1152 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1124);
    float _1154 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1156 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1150);
    float _1158 = abs(_1144);
    float _1160 = log2(_1158);
    float _1162 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1152);
    float _1164 = -_1154;
    float _1166 = fma(_1164, _1146, 1.0);
    float _1168 = _948 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1172 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1174 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1176 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1178 = _1140 * _1088;
    float _1180 = floor(_1122);
    float _1182 = _1140 * _1100;
    float _1184 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1176);
    float _1186 = _1140 * _1096;
    float _1188 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1190 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1192 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1194 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1196 = -_1188;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1196);
    float _1200 = floor(_1172);
    float _1202 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1190);
    float _1204 = -_1186;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1198);
    float _1208 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1202);
    float _1210 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1212 = fma(_1206, -0.5, 0.5);
    float _1214 = -_1180;
    float _1216 = _1122 + _1214;
    float _1218 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1208);
    float _1220 = log2(_1166);
    float _1222 = fma(_1206, 0.5, 0.5);
    float _1224 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1226 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1210);
    float _1228 = fma(_1222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1230 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1224);
    float _1232 = -_1200;
    float _1234 = _1172 + _1232;
    float _1236 = exp2(_1194);
    float _1238 = fma(_1222, _1228, -0.212114393711090087890625);
    float _1240 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1230);
    float _1242 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1226);
    float _1244 = _1182 + 1.0;
    float _1246 = 1.0 / _1218;
    float _1248 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1240);
    float _1250 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1242);
    float _1252 = _1220 * 0.693147182464599609375;
    float _1254 = sqrt(_1212);
    float _1256 = -_1182;
    float _1258 = fma(_1236, _1244, _1256);
    float2 _3826 = float2(_1216, _1234);
    float _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3826, float2(0.0), isnan(_3826)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3826, float2(0.0), isnan(_3826)), level(0.0)).x;
    float _1262 = fma(_1222, _1238, 1.570728778839111328125);
    float _1264 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1266 = _1248 * _1246;
    float _1268 = _1250 * _1246;
    float _1270 = fma(_1266, 0.5, 0.5);
    float _1272 = fma(_1268, -0.5, 0.5);
    float _1274 = _1254 * 0.636619746685028076171875;
    float3 _3858 = float3(_1270, _1272, _1264);
    float _1276 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3858, float3(0.0), isnan(_3858)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3858, float3(0.0), isnan(_3858)), level(0.0)).x;
    float _1278 = -_1262;
    float _1280 = fma(_1274, _1278, 1.0);
    float _1282 = fma(_1258, 0.5, 0.5);
    float3 _3876 = float3(_1270, _1272, _1264);
    float4 _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3876, float3(0.0), isnan(_3876)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3876, float3(0.0), isnan(_3876)), level(0.0)).xyzw;
    float _1287 = _1285.x;
    float _1289 = _1285.y;
    float _1291 = _1285.z;
    float _1293 = _1285.w;
    float2 _3892 = float2(_1280, _1282);
    float3 _1297 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3892, float2(0.0), isnan(_3892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3892, float2(0.0), isnan(_3892)), level(0.0)).xyz;
    float _1299 = _1297.x;
    float _1301 = _1297.y;
    float _1303 = _1297.z;
    float _1305 = _826 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1307 = _826 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1309 = in.m_61.y;
    bool _1311 = _238 > 0.5;
    float _1313 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1305);
    float _1315 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1307);
    float _1317 = in.m_61.x;
    float _1319 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1313);
    float _1321 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1315);
    float _1323 = in.m_63.x;
    float _1325 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1327 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1329 = in.m_63.y;
    float _1331 = 1.0 / _1325;
    float _1333 = _1327 + _1325;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1337 = _1335 != 0;
    float _1339 = in.m_63.z;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1343 = _1341 != 0;
    float _1345 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1347 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1351 = _222 > 0.5;
    bool _1353 = _1351 && _1343;
    float _1355 = -_1309;
    float _1357 = _1355 + 1.0;
    float _1359 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1347);
    float _1361 = in.m_63.w;
    float _1363 = _1309;
    float _1365 = _1317;
    float _1367 = _1218;
    float _1369 = _1250;
    if (_1337)
    {
        float _1371 = _1311 ? _1357 : _1309;
        _1363 = _1371;
    }
    float _1373 = _1363;
    float _1375 = _1333 * _1331;
    float _1377 = _1375 * 0.5;
    bool _1379 = _638 != 0.0;
    bool _1381 = isnan(_638);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan(0.0);
    bool _1387 = _1383 || _1385;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_65.x = _1323;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1393 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1391);
    float _1395 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_65.y = _1329;
    bool _1397 = _636 == 0.0;
    bool _1399 = !_1387;
    bool _1401 = _1397 && _1399;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1405 = 1.0 / _1393;
    out.m_65.z = _1339;
    bool _1407 = _640 == 0.0;
    bool _1409 = _1407 && _1401;
    float _1411 = _1395 * _1349;
    if (_1343)
    {
        _326 = _1317;
    }
    float _1413 = _326;
    float _1415 = in.m_67.x;
    float _1417 = in.m_67.y;
    float _1419 = in.m_67.z;
    float _1421 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = exp2(_1345);
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1431 = _1413;
    if (_1353)
    {
        float _1433 = -_1413;
        float _1435 = _1433 + 1.0;
        _1431 = _1435;
    }
    float _1437 = _1431;
    float _1439 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1359);
    out.m_65.w = _1361;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1443 = _1405 * _1441;
    if (_1343)
    {
        _1365 = _1437;
    }
    float _1445 = _1365;
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1451 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1455 = -_1423;
    float _1457 = _1455 + 1.0;
    float _1459 = abs(_1443);
    float _1461 = log2(_1459);
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1465 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1419;
    float _1469 = _1417;
    float _1471 = _1415;
    if (!_1409)
    {
        float _1473 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1419);
        _1467 = _1473;
    }
    float _1475 = _1467;
    if (!_1409)
    {
        float _1477 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1417);
        _1469 = _1477;
    }
    float _1479 = _1469;
    if (!_1409)
    {
        float _1481 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1415);
        _1471 = _1481;
    }
    float _1483 = _1471;
    bool _1485 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1487 = isnan(_974);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1493 = _1489 || _1491;
    float _1495 = _1451 * _1447;
    float _1497 = -_1479;
    float _1499 = _752 * _1497;
    float _1501 = _768 * _1479;
    float _1503 = _758 * _1479;
    bool _1505 = _1443 <= 8000.0;
    bool _1507 = isnan(_1443);
    bool _1509 = _1505 || _1507;
    bool _1511 = isnan(8000.0);
    bool _1513 = _1509 || _1511;
    float _1515 = float(_1513);
    float _1517 = fma(_762, _1483, _1499);
    float _1519 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1439);
    float _1521 = fma(_780, _1483, _1501);
    float _1523 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1525 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1527 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1529 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1495;
    out.m_69.y = _1411;
    float _1531 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1533 = exp2(_1523);
    out.m_71.x = _1465;
    out.m_71.y = _1421;
    out.m_71.z = _1525;
    out.m_71.w = _1463;
    float _1535 = in.m_73.x;
    out.m_75.x = _1527;
    out.m_75.y = _1529;
    out.m_75.z = _1531;
    out.m_75.w = _1429;
    float _1537 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1539 = precise::clamp(_1537, 0.0, 1.0);
    float _1541 = fma(_1539, -2.0, 3.0);
    float _1543 = _1539 * _1539;
    float _1545 = _1543 * _1541;
    float _1547 = -_1545;
    float _1549 = _1547 + 1.0;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1545);
    float _1553 = _1519 + _1218;
    float _1555 = fma(_772, _1483, _1503);
    float _1557 = fma(_764, _1475, _1517);
    float _1559 = _1515 * _1551;
    float _1561 = _1553 * 0.5;
    float _1563 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1565 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1567 = fma(_790, _1475, _1521);
    float _1569 = fma(_778, _1475, _1555);
    out.m_77.z = _1561;
    out.m_77.w = _1218;
    out.m_79.x = _1557;
    out.m_79.y = _1567;
    out.m_79.z = _1569;
    out.gl_Position.x = _1248;
    out.gl_Position.y = _1250;
    out.gl_Position.z = _1519;
    out.gl_Position.w = _1218;
    float _1571 = _1248;
    float _1573 = _1563;
    if (!_1493)
    {
        _1367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1575 = _1367;
    float _1577 = _1575;
    float _1579 = _1575;
    if (!_1493)
    {
        _1571 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1581 = _1571;
    float _1583 = _1581;
    float _1585 = _1581;
    if (!_1493)
    {
        _1369 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1587 = _1369;
    float _1589 = -_1260;
    float _1591 = _1589 + 1.0;
    float _1593 = _1591 * _1565;
    float _1595 = precise::clamp(_1593, 0.0, 1.0);
    float _1597 = -_1595;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1601 = -_1563;
    float _1603 = _1601 + 1.0;
    float _1605 = _1599 * _1535;
    float _1607 = _1563 * _1276;
    float _1609 = _1605 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1611 = _1603;
    float _1613 = _1587;
    float _1615 = _1587;
    if (!_1493)
    {
        _1573 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1617 = _1573;
    float _1619 = _1293 * _1607;
    float _1621 = _1293 * _1603;
    out.m_81.x = _1609;
    float _1623 = _1619;
    float _1625 = _1617;
    float _1627 = _1617;
    if (!_1493)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1629 = _1611;
    float _1631 = _1303 * _1607;
    float _1633 = fma(_1299, _1619, _1287);
    float _1635 = fma(_1301, _1619, _1289);
    float _1637 = _1629;
    float _1639 = _1629;
    if (!_1493)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1641 = _1623;
    float _1643 = fma(_1293, _1631, _1291);
    out.m_83.x = _1633;
    out.m_83.y = _1635;
    out.m_83.z = _1643;
    out.m_83.w = _1621;
    bool _1645 = !_1493;
    float _1647 = _1641;
    float _1649 = _1641;
    if (!_1645)
    {
        bool _1651 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1653 = isnan(_974);
        bool _1655 = _1651 || _1653;
        bool _1657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1659 = _1655 || _1657;
        if (!_1659)
        {
            float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1663 = _974 + _1661;
            float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1665;
            float _1669 = 1.0 / _1667;
            float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1673 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1677 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1691 = _1663 * _1669;
            float _1693 = precise::clamp(_1691, 0.0, 1.0);
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1699 = fma(_1693, _1673, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1701 = fma(_1693, _1697, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1703 = fma(_1693, _1677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1705 = fma(_1693, _1681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1707 = fma(_1693, _1685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1709 = fma(_1693, _1689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1585 = _1701;
            _1627 = _1707;
            _1579 = _1699;
            _1649 = _1705;
            _1615 = _1703;
            _1639 = _1709;
            _1711 = true;
        }
        else
        {
            bool _1713 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1715 = isnan(_974);
            bool _1717 = _1713 || _1715;
            bool _1719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1721 = _1717 || _1719;
            if (!_1721)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1723 = _1577;
            _1579 = _1723;
            if (!_1721)
            {
                _1583 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1725 = _1583;
            _1585 = _1725;
            if (!_1721)
            {
                _1613 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1727 = _1613;
            _1615 = _1727;
            if (!_1721)
            {
                _1647 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1729 = _1647;
            _1649 = _1729;
            if (!_1721)
            {
                _1625 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1731 = _1625;
            _1627 = _1731;
            if (!_1721)
            {
                _1637 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1733 = _1637;
            bool _1735 = !_1721;
            _1639 = _1733;
            if (!_1735)
            {
                bool _1737 = _974 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1739 = isnan(_974);
                bool _1741 = _1737 || _1739;
                bool _1743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1745 = _1741 || _1743;
                if (!_1745)
                {
                    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1749 = _974 + _1747;
                    float _1751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1751;
                    float _1755 = 1.0 / _1753;
                    float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1767 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1777 = _1749 * _1755;
                    float _1779 = precise::clamp(_1777, 0.0, 1.0);
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1785 = fma(_1779, _1759, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1787 = fma(_1779, _1783, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1789 = fma(_1779, _1763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1791 = fma(_1779, _1767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1793 = fma(_1779, _1771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1795 = fma(_1779, _1775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1585 = _1787;
                    _1627 = _1793;
                    _1579 = _1785;
                    _1649 = _1791;
                    _1615 = _1789;
                    _1639 = _1795;
                    _1711 = true;
                }
                else
                {
                    _1585 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1627 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1649 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1615 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1639 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1711 = false;
    float _1797 = _1585;
    float _1799 = _1627;
    float _1801 = _1579;
    float _1803 = _1649;
    float _1805 = _1615;
    float _1807 = _1639;
    float _1809 = fma(_1567, -0.5, 0.5);
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = -_1797;
    float _1815 = _1813 + _1799;
    float _1817 = -_1801;
    float _1819 = _1817 + _1803;
    float _1821 = -_1805;
    float _1823 = _1821 + _1807;
    bool _1825 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1827 = fma(_1811, _1815, _1797);
    float _1829 = fma(_1811, _1819, _1801);
    float _1831 = fma(_1811, _1823, _1805);
    float _1833 = _1827 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _1835 = fma(_1829, 0.298911988735198974609375, _1833);
    float _1837 = fma(_1831, 0.114477999508380889892578125, _1835);
    out.m_85.x = 0.0;
    float _1839 = -_1837;
    float _1841 = _1829 + _1839;
    float _1843 = -_1837;
    float _1845 = _1827 + _1843;
    float _1847 = -_1837;
    float _1849 = _1831 + _1847;
    float _1851 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1853 = fma(_1841, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1837);
    float _1855 = fma(_1845, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1837);
    float _1857 = fma(_1849, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1837);
    out.m_81.w = _1851;
    out.m_87.x = _1853;
    out.m_87.y = _1855;
    out.m_87.z = _1857;
    if (!_1825)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1859 = -_948;
    float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1863 = -_950;
    float _1865 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1867 = -_952;
    float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1871 = _1861 * _1861;
    float _1873 = fma(_1865, _1865, _1871);
    float _1875 = fma(_1869, _1869, _1873);
    float _1877 = sqrt(_1875);
    float _1879 = rsqrt(_1875);
    float _1881 = -_1877;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1885 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1887 = precise::clamp(_1885, 0.0, 1.0);
    float _1889 = _1865 * _1879;
    float _1891 = _1861 * _1879;
    float _1893 = abs(_1887);
    float _1895 = log2(_1893);
    float _1897 = _1869 * _1879;
    float _1899 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1901 = _1567 * _1891;
    float _1903 = -_1891;
    float _1905 = -_1899;
    float _1907 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1905);
    float _1909 = fma(_1557, _1889, _1901);
    float _1911 = -_1897;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1907);
    float _1915 = fma(_1569, _1897, _1909);
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1921 = _1913 + _1919;
    float _1923 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1925 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1927 = precise::clamp(_1925, 0.0, 1.0);
    float _1929 = exp2(_1923);
    float _1931 = _1929 * _1927;
    float _1933 = _1917 * _1931;
    float _1935 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1937 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1939 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1935;
    out.m_85.y = _1937;
    out.m_85.z = _1939;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

