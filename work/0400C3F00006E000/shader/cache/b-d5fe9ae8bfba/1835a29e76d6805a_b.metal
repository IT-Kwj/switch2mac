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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_55 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2470 = false;
    bool _1376 = false;
    bool _990 = false;
    bool _848 = false;
    bool _452 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3092 = as_type<float>(_104);
        out.gl_Position.z = _3092;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3161 = as_type<float>(_140);
        out.gl_Position.z = _3161;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _292 + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_308;
    float _348 = _346 + 1.0;
    float _350 = 1.0 / _328;
    float _352 = _344 * _348;
    float _354 = -_344;
    float _356 = _354 + 1.0;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = 1.0 / _332;
    float _366 = _324 * _356;
    float _368 = -_324;
    float _370 = _368 + 1.0;
    float _372 = _296 * _350;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = fma(_360, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = fma(_376, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = fma(_380, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = _312 * _364;
    float _390 = _382 * _366;
    float _392 = _384 * _366;
    float _394 = _386 * _366;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _390);
    float _410 = fma(_398, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = fma(_402, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _414 = fma(_406, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _416 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _392);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _420 = fma(_410, _352, _408);
    float _422 = fma(_412, _352, _416);
    float _424 = fma(_414, _352, _418);
    float _426 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _420);
    float _428 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _422);
    float _430 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _424);
    bool _432 = !_362;
    float _450;
    if (!_432)
    {
        float _434 = in.m_53.x;
        float _436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _438 = _434 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _442 = _440 * _436;
        float _444 = floor(_442);
        float _446 = -_444;
        float _448 = _442 + _446;
        _450 = _448;
        _452 = true;
    }
    else
    {
        float _454 = float(_88);
        float _456 = 1.0 / _454;
        float _458 = _122 * _456;
        _450 = _458;
    }
    _452 = false;
    float _460 = _450;
    float _462 = in.m_51.x;
    float _464 = in.m_51.y;
    float _466 = in.m_51.z;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _470 = _460 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _488 = 1.0 / _474;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _498 = 1.0 / _486;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _502 = _460 + _500;
    bool _504 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _506 = isnan(_460);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    bool _516 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _518 = isnan(_460);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _478;
    float _530 = _502 * _488;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _534 = _460 + _532;
    float _536 = _428 * _464;
    bool _538 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _540 = isnan(_460);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _430 * _466;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _554 = _460 + _552;
    float _556 = 1.0 / _496;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _560 = _460 + _558;
    float _562 = _534 * _498;
    bool _564 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _566 = isnan(_460);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -_548;
    float _578 = _576 + 1.0;
    bool _580 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _582 = 1.0 / _492;
    float _584 = _560 * _528;
    bool _586 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _588 = isnan(_460);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _598;
    float _602 = -_574;
    float _604 = _602 + 1.0;
    float _606 = _574 * _578;
    float _608 = fma(_600, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _610 = 1.0 / _482;
    float _612 = _470 * _556;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _620 = _460 + _618;
    float _622 = _596 * _604;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _628 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _630 = isnan(_460);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = _554 * _582;
    float _642 = fma(_616, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _644 = -_596;
    float _646 = _644 + 1.0;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _656 = fma(_626, _584, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _658 = _514 * _646;
    float _660 = fma(_650, _584, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _662 = _620 * _610;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _664;
    float _668 = -_514;
    float _670 = _668 + 1.0;
    bool _672 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _674 = isnan(_460);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = fma(_654, _584, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _686 = fma(_666, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _688 = _526 * _670;
    float _690 = -_526;
    float _692 = _690 + 1.0;
    float _694 = -_682;
    float _696 = _694 + 1.0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _702;
    float _706 = _682 * _692;
    float _708 = _638 * _696;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _710;
    float _714 = fma(_700, _640, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _716 = fma(_704, _640, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _718 = _608 * _708;
    float _720 = _642 * _708;
    float _722 = _686 * _708;
    float _724 = -_638;
    float _726 = _724 + 1.0;
    float _728 = fma(_712, _640, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[107].x, _718);
    float _744 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[107].y, _720);
    float _746 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[107].z, _722);
    float _748 = fma(_732, _612, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _750 = fma(_736, _612, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _752 = fma(_740, _612, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _754 = fma(_660, _706, _742);
    float _756 = fma(_656, _706, _744);
    float _758 = fma(_684, _706, _746);
    float _760 = fma(_728, _688, _754);
    float _762 = fma(_714, _688, _756);
    float _764 = fma(_716, _688, _758);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _770;
    float _774 = fma(_748, _658, _760);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _776;
    float _780 = fma(_750, _658, _762);
    float _782 = fma(_752, _658, _764);
    float _784 = fma(_768, _662, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _786 = fma(_772, _662, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _792 = fma(_778, _662, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _802 = fma(_784, _622, _774);
    float _804 = fma(_790, _562, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _806 = fma(_796, _562, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _808 = fma(_800, _562, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _810 = fma(_786, _622, _780);
    float _812 = fma(_792, _622, _782);
    float _814 = fma(_804, _606, _802);
    float _816 = fma(_806, _606, _810);
    float _818 = fma(_808, _606, _812);
    float _820 = _426 * _462;
    float _822 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[113].x, _814);
    float _824 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[113].y, _816);
    float _826 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[113].z, _818);
    bool _828 = !_580;
    float _846;
    if (!_828)
    {
        float _830 = in.m_53.x;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _834 = _830 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _838 = _836 * _832;
        float _840 = floor(_838);
        float _842 = -_840;
        float _844 = _838 + _842;
        _846 = _844;
        _848 = true;
    }
    else
    {
        float _850 = float(_88);
        float _852 = 1.0 / _850;
        float _854 = _122 * _852;
        _846 = _854;
    }
    _848 = false;
    float _856 = _846;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _860 = _856 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _868 = isnan(_856);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _882 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _884 = isnan(_856);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _894;
    bool _898 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _900 = isnan(_856);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = 1.0 / _864;
    float _912 = -_876;
    float _914 = _912 + 1.0;
    bool _916 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _918 = 1.0 / _880;
    float _920 = _896 * _910;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _926 = -_908;
    float _928 = _926 + 1.0;
    float _930 = fma(_920, _860, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _932 = _892 * _914;
    float _934 = -_892;
    float _936 = _934 + 1.0;
    float _938 = _876 * _928;
    float _940 = _924 * _918;
    float _942 = _930 * _932;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _946 = _856 + _944;
    float _948 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _826 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _954 = fma(_940, _946, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _956 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = fma(_954, _938, _952);
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[117].x, _960);
    float _966 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _964 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _958;
    out.m_55.y = _962;
    out.m_55.z = _966;
    out.m_55.w = _968;
    bool _970 = !_916;
    float _988;
    if (!_970)
    {
        float _972 = in.m_53.x;
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _976 = _972 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _980 = _978 * _974;
        float _982 = floor(_980);
        float _984 = -_982;
        float _986 = _980 + _984;
        _988 = _986;
        _990 = true;
    }
    else
    {
        float _992 = float(_88);
        float _994 = 1.0 / _992;
        float _996 = _122 * _994;
        _988 = _996;
    }
    _990 = false;
    float _998 = _988;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = _998 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1020 = 1.0 / _1006;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1030 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1032 = isnan(_998);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = 1.0 / _1024;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1046 = _998 + _1044;
    float _1048 = 1.0 / _1018;
    float _1050 = _1046 * _1020;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1054 = _998 + _1052;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1058 = _998 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1060;
    bool _1064 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1066 = 1.0 / _1010;
    float _1068 = _1054 * _1042;
    bool _1070 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1072 = isnan(_998);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1082;
    float _1086 = fma(_1084, _1050, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1088 = 1.0 / _1014;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1092 = _998 + _1090;
    float _1094 = _1058 * _1048;
    float _1096 = 1.0 / _1028;
    float _1098 = _1092 * _1066;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1102 = _998 + _1100;
    bool _1104 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1106 = isnan(_998);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = -_1080;
    float _1118 = _1116 + 1.0;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1120;
    float _1124 = _1002 * _1088;
    bool _1126 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1128 = isnan(_998);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -_1114;
    float _1140 = _1138 + 1.0;
    float _1142 = _1114 * _1118;
    float _1144 = fma(_1122, _1050, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1146 = _1136 * _1140;
    float _1148 = -_1136;
    float _1150 = _1148 + 1.0;
    float _1152 = _1102 * _1096;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1162 = -_1040;
    float _1164 = _1162 + 1.0;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1170 = fma(_1156, _1050, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1172 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1174 = isnan(_998);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1188 = _1040 * _1150;
    bool _1190 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1192 = isnan(_998);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = fma(_1168, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1204 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1206 = isnan(_998);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1182 * _1164;
    float _1218 = -_1182;
    float _1220 = _1218 + 1.0;
    float _1222 = fma(_1160, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1224 = fma(_1186, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1226 = -_1214;
    float _1228 = _1226 + 1.0;
    float _1230 = _1214 * _1220;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1236;
    float _1240 = _1200 * _1228;
    float _1242 = -_1200;
    float _1244 = _1242 + 1.0;
    float _1246 = fma(_1234, _1124, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1248 = fma(_1238, _1124, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1250 = fma(_1062, _1124, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1252 = _1144 * _1240;
    float _1254 = _1170 * _1240;
    float _1256 = _1086 * _1240;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1252);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1254);
    float _1266 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1256);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1276 = fma(_1222, _1230, _1264);
    float _1278 = fma(_1224, _1230, _1266);
    float _1280 = fma(_1202, _1230, _1262);
    float _1282 = fma(_1260, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1284 = fma(_1270, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1286 = fma(_1274, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1288;
    float _1292 = fma(_1246, _1216, _1280);
    float _1294 = fma(_1248, _1216, _1276);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1296;
    float _1300 = fma(_1250, _1216, _1278);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1302;
    float _1306 = fma(_1290, _1068, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1308 = fma(_1298, _1068, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1310 = fma(_1282, _1188, _1292);
    float _1312 = fma(_1284, _1188, _1294);
    float _1314 = fma(_1286, _1188, _1300);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1324 = fma(_1304, _1068, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1330 = fma(_1308, _1146, _1310);
    float _1332 = fma(_1318, _1152, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1334 = fma(_1322, _1152, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1336 = fma(_1306, _1146, _1312);
    float _1338 = fma(_1328, _1152, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1340 = fma(_1324, _1146, _1314);
    float _1342 = fma(_1332, _1142, _1330);
    float _1344 = fma(_1334, _1142, _1336);
    float _1346 = fma(_1338, _1142, _1340);
    float _1348 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1342);
    float _1350 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1344);
    float _1352 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1346);
    bool _1354 = !_1064;
    float _1356 = _1284;
    float _1374;
    if (!_1354)
    {
        float _1358 = in.m_53.x;
        float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1362 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1366 = _1364 * _1360;
        float _1368 = floor(_1366);
        float _1370 = -_1368;
        float _1372 = _1366 + _1370;
        _1374 = _1372;
        _1376 = true;
    }
    else
    {
        float _1378 = float(_88);
        float _1380 = 1.0 / _1378;
        float _1382 = _122 * _1380;
        _1374 = _1382;
    }
    _1376 = false;
    float _1384 = _1374;
    float _1386 = in.m_53.w;
    float _1388 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1390 = in.m_53.x;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1394 = _1392 != 0;
    float _1396 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1400 = _1398 != 0;
    float _1402 = in.m_53.y;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1406 = _1404 != 0;
    float _1408 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1396);
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1412 = _1410 != 0;
    float _1414 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1418 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1388);
    float _1420 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1414);
    bool _1422 = _1412;
    if (_1394)
    {
        float _1424 = in.m_53.z;
        _1356 = _1424;
    }
    float _1426 = _1356;
    float _1428 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1408);
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1434 = in.m_57.x;
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1438 = _1386 > 0.5;
    float _1440 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1442 = in.m_57.y;
    float _1444 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1448 = false;
    bool _1450 = _1438;
    if (_1400)
    {
        bool _1452 = _1390 > 0.5;
        _1448 = _1452;
    }
    bool _1454 = _1448;
    float _1456 = -_1416;
    float _1458 = fma(_1444, 2.0, _1456);
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1462 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1464 = 1.0 / _1432;
    bool _1466 = _1402 > 0.5;
    float _1468 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1418);
    float _1470 = fma(_1462, -2.0, _1460);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1474 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1446);
    float _1476 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1478 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1470);
    float _1480 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1472);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1482;
    float _1486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1488 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1420);
    bool _1490 = _1384 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1492 = isnan(_1384);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1504 = _1384 + _1502;
    float _1506 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1474);
    bool _1508 = _1384 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1510 = isnan(_1384);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = -_1442;
    float _1522 = _1520 + 1.0;
    float _1524 = _1484 * _1464;
    float _1526 = -_1500;
    float _1528 = _1526 + 1.0;
    float _1530 = -_122;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1458);
    float _1534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1536 = _1438 ? as_type<int>(_1522) : as_type<int>(_1442);
    float _1538 = fma(_1524, _1504, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1540 = _1442;
    int _1542 = as_type<int>(_1528);
    float _1544 = _1524;
    if (_1394)
    {
        bool _1546 = _1426 > 0.5;
        _1450 = _1546;
    }
    bool _1548 = _1450;
    float _1550 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1480);
    float _1552 = _1406 ? as_type<float>(_1536) : _1442;
    float _1554 = _1518 * _1528;
    float _1556 = _1554;
    float _1558 = _1552;
    if (_1412)
    {
        float _1560 = _1466 ? _1522 : _1442;
        _1540 = _1560;
    }
    float _1562 = _1540;
    float _1564 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1566 = as_type<int>(_1486);
    if (_1394)
    {
        float _1568 = -_1434;
        float _1570 = _1568 + 1.0;
        _1566 = as_type<int>(_1570);
    }
    int _1572 = _1566;
    float _1574 = _1468 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1576 = _1538 * _1554;
    float _1578 = _1574;
    if (_1400)
    {
        float _1580 = -_1434;
        float _1582 = _1580 + 1.0;
        _1542 = as_type<int>(_1582);
    }
    int _1584 = _1542;
    if (!_1394)
    {
        _1556 = _1434;
    }
    float _1586 = _1556;
    float _1588 = _1488 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1590 = _1586;
    if (_1394)
    {
        float _1592 = _1548 ? as_type<float>(_1572) : _1434;
        _1590 = _1592;
    }
    float _1594 = _1590;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1598 = _1574 + _1596;
    if (!_1400)
    {
        _1544 = _1434;
    }
    float _1600 = _1544;
    float _1602 = fma(_1564, _1562, -0.5);
    float _1604 = _1600;
    if (_1400)
    {
        float _1606 = _1454 ? as_type<float>(_1584) : _1434;
        _1604 = _1606;
    }
    float _1608 = _1604;
    float _1610 = -_1518;
    float _1612 = _1610 + 1.0;
    float _1614 = _1428 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1618 = _1588 + _1616;
    float _1620 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1622 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1624 = fma(_1612, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1576);
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1614 + _1626;
    float _1630 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1620);
    float _1632 = fma(_1622, _1608, -0.5);
    float _1634 = -_1478;
    float _1636 = fma(_1550, _1602, _1634);
    float _1638 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1624);
    float _1640 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1630);
    float _1642 = fma(_1506, _1632, _1532);
    float _1644 = _1598 * _1598;
    float _1646 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1650 = _1640 >= 0.0;
    float _1652 = fma(_1618, _1618, _1644);
    float _1654 = _1646 * _1534;
    float _1656 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1658 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1660 = fma(_1628, _1628, _1652);
    float _1662 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = _1636 + 0.5;
    float _1666 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = rsqrt(_1660);
    float _1670 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1672 = as_type<int>(_1636);
    if (_1650)
    {
        _1558 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1674 = _1558;
    float _1676 = _1656 * _1648;
    float _1678 = _1642 + 0.5;
    float _1680 = _1638 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1650)
    {
        float _1682 = _1674 * 5.0;
        _1672 = as_type<int>(_1682);
    }
    int _1684 = _1672;
    if (_1650)
    {
        out.m_47.x = 0.0;
    }
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1686 = _1598 * _1668;
    out.m_61.x = _1678;
    out.m_61.y = _1664;
    out.m_61.z = _1654;
    out.m_61.w = _1676;
    float _1688 = _1618 * _1668;
    if (_1650)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5735 = as_type<float>(_1684);
        out.gl_Position.z = _5735;
    }
    out.m_63.x = _1662;
    out.m_63.y = _1670;
    out.m_63.z = _1666;
    out.m_63.w = _1680;
    if (_1650)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1690 = -_1686;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1574);
    float _1694 = _1628 * _1668;
    float _1696 = -_1688;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1588);
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1702 = _1692 + _1700;
    float _1704 = -_1694;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1710 = _1698 + _1708;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1706 + _1714;
    float _1718 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1712);
    float _1720 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1718);
    bool _1722 = _1720 >= 0.0;
    float _1724 = _1716;
    if (_1722)
    {
        _1724 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1726 = _1724;
    int _1728 = as_type<int>(_1726);
    if (_1722)
    {
        out.m_47.x = 0.0;
    }
    if (_1722)
    {
        float _1730 = _1726 * 5.0;
        _1728 = as_type<int>(_1730);
    }
    int _1732 = _1728;
    if (_1722)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5834 = as_type<float>(_1732);
        out.gl_Position.z = _5834;
    }
    if (_1722)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1734 = -_1574;
    float _1736 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1738 = -_1588;
    float _1740 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1736 * _1736;
    float _1744 = -_1614;
    float _1746 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1750 = -_1688;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1618);
    float _1754 = fma(_1740, _1740, _1742);
    float _1756 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1748);
    float _1758 = -_1694;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1628);
    float _1762 = fma(_1746, _1746, _1754);
    float _1764 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1756);
    float _1766 = rsqrt(_1762);
    float _1768 = rsqrt(_1764);
    float _1770 = _1740 * _1766;
    float _1772 = _1736 * _1766;
    float _1774 = _1746 * _1766;
    float _1776 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1778 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1780 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1782 = _1776 * _1770;
    float _1784 = _1778 * _1774;
    float _1786 = _1780 * _1772;
    float _1788 = -_1782;
    float _1790 = fma(_1778, _1772, _1788);
    float _1792 = -_1784;
    float _1794 = fma(_1780, _1770, _1792);
    float _1796 = -_1786;
    float _1798 = fma(_1776, _1774, _1796);
    float _1800 = -_1574;
    float _1802 = _1800 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1804 = _1770 * _1790;
    float _1806 = _1774 * _1794;
    float _1808 = -_1588;
    float _1810 = _1808 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1812 = _1772 * _1798;
    float _1814 = -_1804;
    float _1816 = fma(_1774, _1798, _1814);
    float _1818 = -_1806;
    float _1820 = fma(_1772, _1790, _1818);
    float _1822 = -_1812;
    float _1824 = fma(_1770, _1794, _1822);
    float _1826 = _1802 * _1816;
    float _1828 = _1794 * _1802;
    float _1830 = fma(_1810, _1820, _1826);
    float _1832 = -_1614;
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1836 = fma(_1798, _1810, _1828);
    float _1838 = fma(_1834, _1824, _1830);
    float _1840 = fma(_1790, _1834, _1836);
    float _1842 = -_1686;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1598);
    float _1846 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1848 = _1838 * _1838;
    float _1850 = _1844 * _1844;
    float _1852 = fma(_1840, _1840, _1848);
    float _1854 = fma(_1752, _1752, _1850);
    float _1856 = rsqrt(_1852);
    float _1858 = _1840 * _1856;
    float _1860 = _1838 * _1856;
    float _1862 = fma(_1760, _1760, _1854);
    float _1864 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1866 = abs(_1858);
    float _1868 = abs(_1860);
    float _1870 = precise::max(_1866, _1868);
    float _1872 = sqrt(_1862);
    bool _1874 = _1870 >= 16.0;
    float _1876 = in.m_65.x;
    float _1878 = in.m_65.y;
    float _1880 = in.m_65.z;
    float _1882 = _1860;
    float _1884 = _1858;
    if (_1874)
    {
        float _1886 = _1860 * 0.0625;
        _1882 = _1886;
    }
    float _1888 = _1882;
    if (_1874)
    {
        float _1890 = _1858 * 0.0625;
        _1884 = _1890;
    }
    float _1892 = _1884;
    float _1894 = _1668 * _1872;
    float _1896 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1898 = abs(_1888);
    bool _1900 = _1898 != 0.0;
    bool _1902 = isnan(_1898);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan(0.0);
    bool _1908 = _1904 || _1906;
    float _1910 = _1894 * _1896;
    float _1912 = abs(_1892);
    bool _1914 = _1912 == 0.0;
    float _1916 = _1894 * _1864;
    float _1918 = abs(_1892);
    bool _1920 = _1918 == 0.0;
    bool _1922 = !_1908;
    bool _1924 = _1920 && _1922;
    float _1926 = _1894 * _1846;
    float _1928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1878);
    float _1930 = _1772 * _1772;
    float _1932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1876);
    float _1934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1880);
    float _1936 = fma(_1770, _1770, _1930);
    float _1938 = _1926 * _1932;
    float _1940 = fma(_1774, _1774, _1936);
    int _1942 = as_type<int>(_1880);
    if (_1924)
    {
        bool _1944 = as_type<int>(_1892) >= 0;
        _1422 = _1944;
    }
    bool _1946 = _1422;
    int _1948 = _1946 ? (-1) : 0;
    if (_1924)
    {
        int _1950 = _1946 ? 0 : 1078530011;
        _1942 = _1950;
    }
    int _1952 = _1942;
    int _1954 = _1952;
    if (_1924)
    {
        int _1956 = int(0x80000000) & as_type<int>(_1888);
        int _1958 = _1952 | _1956;
        _1954 = _1958;
    }
    int _1960 = _1954;
    bool _1962 = !_1908;
    bool _1964 = _1962 && _1914;
    int _1966 = _1960;
    float _1968 = as_type<float>(_1960);
    if (!_1964)
    {
        float _1970 = abs(_1888);
        bool _1972 = _1970 != as_type<float>(0x7f800000u /* inf */);
        bool _1974 = isnan(_1970);
        bool _1976 = _1972 || _1974;
        bool _1978 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1980 = _1976 || _1978;
        float _1982 = abs(_1892);
        bool _1984 = _1982 == as_type<float>(0x7f800000u /* inf */);
        float _1986 = abs(_1892);
        bool _1988 = _1986 == as_type<float>(0x7f800000u /* inf */);
        bool _1990 = !_1980;
        bool _1992 = _1988 && _1990;
        if (_1992)
        {
            bool _1994 = as_type<int>(_1892) >= 0;
            _1948 = _1994 ? (-1) : 0;
        }
        int _1996 = _1948;
        if (_1992)
        {
            _1966 = 1075235812;
        }
        int _1998 = _1966;
        int _2000 = _1998;
        if (_1992)
        {
            int _2002 = ~_1996;
            int _2004 = (_2002 != 0) ? _1998 : 1061752795;
            _2000 = _2004;
        }
        int _2006 = _2000;
        float _2008 = as_type<float>(_2006);
        if (_1992)
        {
            int _2010 = int(0x80000000) & as_type<int>(_1888);
            int _2012 = _2006 | _2010;
            _2008 = as_type<float>(_2012);
        }
        float _2014 = _2008;
        bool _2016 = !_1980;
        bool _2018 = _2016 && _1984;
        _1968 = _2014;
        if (!_2018)
        {
            float _2020 = abs(_1888);
            float _2022 = abs(_1892);
            float _2024 = precise::max(_2020, _2022);
            float _2026 = abs(_1888);
            float _2028 = abs(_1892);
            float _2030 = precise::min(_2026, _2028);
            float _2032 = 1.0 / _2024;
            float _2034 = abs(_1888);
            float _2036 = abs(_1892);
            bool _2038 = _2034 > _2036;
            bool _2040 = as_type<int>(_1892) >= 0;
            float _2042 = _2030 * _2032;
            float _2044 = abs(_1888);
            float _2046 = abs(_1892);
            float _2048 = _2044 + _2046;
            int _2050 = as_type<int>(_1888) & int(0x80000000);
            float _2052 = _2042 * _2042;
            bool _2054 = _2048 > as_type<float>(0x7f800000u /* inf */);
            bool _2056 = isnan(_2048);
            bool _2058 = _2054 || _2056;
            bool _2060 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2062 = _2058 || _2060;
            float _2064 = _2052 + 11.33538818359375;
            float _2066 = fma(_2052, _2064, 28.84246826171875);
            float _2068 = fma(_2052, _2066, 19.6966705322265625);
            float _2070 = fma(_2052, -0.82336294651031494140625, -5.674867153167724609375);
            float _2072 = fma(_2052, _2070, -6.565555095672607421875);
            float _2074 = 1.0 / _2068;
            float _2076 = _2052 * _2072;
            float _2078 = _2042 * _2076;
            float _2080 = fma(_2078, _2074, _2042);
            float _2082 = _2080;
            _1968 = _2048;
            if (_2038)
            {
                float _2084 = -_2080;
                float _2086 = _2084 + 1.57079637050628662109375;
                _2082 = _2086;
            }
            float _2088 = _2082;
            int _2090 = as_type<int>(_2088);
            if (!_2040)
            {
                float _2092 = -_2088;
                float _2094 = _2092 + 3.1415927410125732421875;
                _2090 = as_type<int>(_2094);
            }
            int _2096 = _2090;
            if (!_2062)
            {
                int _2098 = _2050 | _2096;
                _1968 = as_type<float>(_2098);
            }
        }
    }
    float _2100 = _1968;
    float _2102 = _2100 + 1.57079637050628662109375;
    float _2104 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2106 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2110 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _2108;
    float _2112 = _1916 * _1928;
    float _2114 = _2102 * 0.15915493667125701904296875;
    float _2116 = _2106 * _2106;
    float _2118 = rsqrt(_1940);
    float _2120 = _1910 * _1934;
    float _2122 = fma(_2110, _2110, _2116);
    float _2124 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2126 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2128 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2130 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _2130;
    float _2134 = _2114 * 6.283185482025146484375;
    float _2136 = cos(_2134);
    float _2138 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2124);
    float _2140 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2126);
    float _2142 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    float _2144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2148 = fma(_2132, _2132, _2122);
    float _2150 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2138);
    float _2152 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2140);
    float _2154 = _2114 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    float _2158 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2142);
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2162 = _2160 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2164 = _2146 * _2146;
    float _2166 = _1770 * _2118;
    float _2168 = _1774 * _2118;
    float _2170 = _1772 * _2118;
    float _2172 = fma(_2162, _2162, _2164);
    float _2174 = sqrt(_2148);
    float _2176 = -_2136;
    float _2178 = _2176 + 1.0;
    float _2180 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2184 = _2182 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2186 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2188 = _2166 * _2178;
    float _2190 = _2170 * _2178;
    float _2192 = _2168 * _2168;
    float _2194 = _2168 * _2156;
    float _2196 = _2166 * _2156;
    float _2198 = _2170 * _2156;
    float _2200 = fma(_2184, _2184, _2172);
    float _2202 = -_2194;
    float _2204 = fma(_2170, _2188, _2202);
    float _2206 = fma(_2168, _2190, _2196);
    float _2208 = fma(_2166, _2188, _2136);
    float _2210 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2212 = _2186 * _2204;
    float _2214 = -_2198;
    float _2216 = fma(_2168, _2188, _2214);
    float _2218 = _2186 * _2206;
    float _2220 = fma(_2178, _2192, _2136);
    float _2222 = _2174 * 0.066666670143604278564453125;
    float _2224 = fma(_2180, _2208, _2212);
    float _2226 = precise::max(_2174, 15.0);
    float _2228 = fma(_2180, _2216, _2218);
    float _2230 = rsqrt(_2200);
    float _2232 = fma(_2168, _2188, _2198);
    float _2234 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _2236 = _2234 + 1.0;
    float _2238 = precise::max(_2222, 1.0);
    float _2240 = fma(_2210, _2232, _2224);
    float _2242 = precise::min(_2226, 30.0);
    float _2244 = fma(_2210, _2220, _2228);
    float _2246 = precise::min(_2238, 2.0);
    float _2248 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, 0.3499999940395355224609375, _2236);
    float _2250 = _1588 + _2240;
    float _2252 = fma(_2242, 0.066666670143604278564453125, -1.0);
    float _2254 = _1614 + _2244;
    float _2256 = _2246 * _2248;
    float _2258 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2260 = _2250 + _2258;
    float _2262 = _2252 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _2264 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2266 = _2254 + _2264;
    float _2268 = fma(_2170, _2190, _2136);
    float _2270 = fma(_2260, _2256, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _2272 = _2230 * _2262;
    float _2274 = fma(_2266, _2256, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _2276 = fma(_2170, _2188, _2194);
    float _2278 = _2186 * _2268;
    float _2280 = -_2272;
    float _2282 = fma(_2162, _2280, _2270);
    float _2284 = -_2272;
    float _2286 = fma(_2184, _2284, _2274);
    float _2288 = -_2196;
    float _2290 = fma(_2168, _2190, _2288);
    float _2292 = fma(_2180, _2276, _2278);
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2296 = _2282 + _2294;
    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2300 = _2286 + _2298;
    float _2302 = fma(_2210, _2290, _2292);
    float _2304 = _2296 * _2296;
    float _2306 = _2300 * _2300;
    float _2308 = _1574 + _2302;
    float _2310 = _2304 + _2306;
    float _2312 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2314 = _2308 + _2312;
    float _2316 = sqrt(_2310);
    float _2318 = fma(_2314, _2256, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _2320 = -_2272;
    float _2322 = fma(_2146, _2320, _2318);
    bool _2324 = _2316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2326 = _2180;
    float _2328 = _2146;
    float _2330 = _2292;
    float _2332 = _2168;
    if (!_2324)
    {
        _1578 = _2306;
    }
    float _2334 = _1578;
    float _2336 = _2334;
    if (!_2324)
    {
        _2326 = _2304;
    }
    float _2338 = _2326;
    float _2340 = _2338;
    if (!_2324)
    {
        _2328 = _2282;
    }
    float _2342 = _2328;
    float _2344 = _2342;
    if (!_2324)
    {
        _2330 = _2286;
    }
    float _2346 = _2330;
    float _2348 = _2346;
    if (!_2324)
    {
        _2332 = _2322;
    }
    float _2350 = _2332;
    bool _2352 = !_2324;
    float _2354 = _2350;
    if (!_2352)
    {
        float _2356 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2360 = _2316 + _2358;
        float _2362 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2364 = rsqrt(_2310);
        float _2366 = _2360 * _2356;
        float _2368 = _2366 * 0.15915493667125701904296875;
        float _2370 = _2368 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        float _2374 = _2368 * 6.283185482025146484375;
        float _2376 = cos(_2374);
        float _2378 = fma(_2372, _2362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2380 = _2364 * _2378;
        float _2382 = _2376 + (-1.0);
        float _2384 = fma(_2296, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2386 = fma(_2300, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2388 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2392 = _2384 + _2390;
        float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2396 = _2386 + _2394;
        float _2398 = fma(_2322, _2376, _2388);
        float _2400 = _2392 * _2392;
        float _2402 = _2396 * _2396;
        _2354 = _2398;
        _2340 = _2400;
        _2336 = _2402;
        _2344 = _2384;
        _2348 = _2386;
    }
    float _2404 = _2354;
    float _2406 = _2340;
    float _2408 = _2336;
    float _2410 = _2344;
    float _2412 = _2348;
    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2416 = _2404 + _2414;
    out.m_55.x = _958;
    out.m_55.y = _962;
    out.m_55.z = _966;
    out.m_55.w = _968;
    float _2418 = fma(_2416, _2416, _2406);
    out.m_63.x = _1662;
    out.m_63.y = _1670;
    out.m_63.z = _1666;
    out.m_63.w = _1680;
    float _2420 = _2418 + _2408;
    float _2422 = sqrt(_2420);
    bool _2424 = _2422 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2426 = isnan(_2422);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2432 = _2428 || _2430;
    float _2434 = _2418;
    if (!_2432)
    {
        _2434 = 1.0;
    }
    float _2436 = _2434;
    bool _2438 = !_2432;
    float _2440 = _2436;
    if (!_2438)
    {
        bool _2442 = _2422 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2444 = isnan(_2422);
        bool _2446 = _2442 || _2444;
        bool _2448 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2450 = _2446 || _2448;
        if (!_2450)
        {
            float _2452 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2454 = _2422 + _2452;
            float _2456 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2458 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2456;
            float _2460 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2464 = 1.0 / _2458;
            float _2466 = _2454 * _2464;
            float _2468 = fma(_2466, _2462, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2440 = _2468;
            _2470 = true;
        }
        else
        {
            bool _2472 = _2422 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2474 = isnan(_2422);
            bool _2476 = _2472 || _2474;
            bool _2478 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2480 = _2476 || _2478;
            if (!_2480)
            {
                float _2482 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2484 = _2422 + _2482;
                float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2488 = _2486 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2490 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2492 = _2490 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2494 = 1.0 / _2488;
                float _2496 = _2484 * _2494;
                float _2498 = fma(_2496, _2492, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2440 = _2498;
                _2470 = true;
            }
            else
            {
                _2440 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2470 = false;
    float _2500 = _2440;
    float _2502 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2504 = _2404 + _2502;
    float _2506 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2508 = _2410 + _2506;
    float _2510 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2512 = _2412 + _2510;
    float _2514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2516 = fma(_2504, _2500, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2518 = fma(_2508, _2500, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2520 = fma(_2512, _2500, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2522 = -_1686;
    float _2524 = fma(_2522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2516);
    float _2526 = -_1688;
    float _2528 = fma(_2526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2518);
    float _2530 = -_1694;
    float _2532 = fma(_2530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2520);
    float _2534 = precise::max(0.0, _2514);
    float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2538 = _2524 + _2536;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2542 = _2528 + _2540;
    float _2544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2546 = _2532 + _2544;
    float _2548 = _2538 * _2538;
    float _2550 = fma(_2542, _2542, _2548);
    float _2552 = fma(_2546, _2546, _2550);
    float _2554 = rsqrt(_2552);
    float _2556 = sqrt(_2552);
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2560 = _2542 * _2558;
    float _2562 = _2546 * _2558;
    float _2564 = -_2558;
    float _2566 = -_2534;
    float _2568 = fma(_2538, _2564, _2566);
    float _2570 = _2560 * _2560;
    float _2572 = _2562 * _2562;
    float _2574 = _2570 + _2572;
    float _2576 = sqrt(_2574);
    bool _2578 = _2576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2582 = _2576 + _2580;
    float _2584 = _962;
    float _2586 = _2538;
    float _2588 = _2546;
    float _2590 = _2582;
    float _2592 = _2508;
    float _2594 = _2560;
    if (_2578)
    {
        float _2596 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2584 = _2596;
    }
    float _2598 = _2584;
    if (_2578)
    {
        float _2600 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2586 = _2600;
    }
    float _2602 = _2586;
    float _2604 = _2602;
    if (_2578)
    {
        float _2606 = rsqrt(_2574);
        _2588 = _2606;
    }
    float _2608 = _2588;
    float _2610 = _2598;
    float _2612 = _2608;
    if (_2578)
    {
        float _2614 = _2582 * _2598;
        _2590 = _2614;
    }
    float _2616 = _2590;
    if (_2578)
    {
        float _2618 = _2616 * 0.15915493667125701904296875;
        _2610 = _2618;
    }
    float _2620 = _2610;
    float _2622 = _2616;
    float _2624 = _2620;
    if (_2578)
    {
        float _2626 = _2620 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        _2622 = _2628;
    }
    float _2630 = _2622;
    float _2632 = _958;
    if (_2578)
    {
        float _2634 = _2620 * 6.283185482025146484375;
        float _2636 = cos(_2634);
        _2632 = _2636;
    }
    float _2638 = _2632;
    float _2640 = _2630;
    if (_2578)
    {
        float _2642 = fma(_2630, _2602, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2604 = _2642;
    }
    float _2644 = _2604;
    float _2646 = _2644;
    if (_2578)
    {
        float _2648 = _2608 * _2644;
        _2592 = _2648;
    }
    float _2650 = _2592;
    if (!_2578)
    {
        _2646 = _2568;
    }
    float _2652 = _2646;
    float _2654 = _2652;
    if (!_2578)
    {
        _2612 = _2570;
    }
    float _2656 = _2612;
    float _2658 = _2656;
    float _2660 = _2638;
    if (_2578)
    {
        float _2662 = _2638 + (-1.0);
        _2640 = _2662;
    }
    float _2664 = _2640;
    float _2666 = _2664;
    if (_2578)
    {
        float _2668 = _2560 * _2650;
        _2594 = _2668;
    }
    float _2670 = _2594;
    if (_2578)
    {
        float _2672 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2624 = _2672;
    }
    float _2674 = _2624;
    if (!_2578)
    {
        _2666 = _2562;
    }
    float _2676 = _2666;
    float _2678 = _2676;
    if (_2578)
    {
        float _2680 = _2562 * _2650;
        _2678 = _2680;
    }
    float _2682 = _2678;
    if (_2578)
    {
        float _2684 = _2670 * _2670;
        _2658 = _2684;
    }
    float _2686 = _2658;
    if (_2578)
    {
        float _2688 = fma(_2568, _2638, _2674);
        _2654 = _2688;
    }
    float _2690 = _2654;
    if (!_2578)
    {
        _2660 = _2572;
    }
    float _2692 = _2660;
    float _2694 = _2692;
    if (_2578)
    {
        float _2696 = _2682 * _2682;
        _2694 = _2696;
    }
    float _2698 = _2694;
    float _2700 = fma(_2690, _2690, _2686);
    float _2702 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2704 = _2700 + _2698;
    float _2706 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2710 = fma(_2556, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2708);
    float _2712 = precise::clamp(_2710, 0.0, 1.0);
    float _2714 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2716 = rsqrt(_2704);
    float _2718 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2706);
    float _2720 = -_2712;
    float _2722 = _2720 + 1.0;
    float _2724 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2714);
    float _2726 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2718);
    float _2728 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2730 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2724);
    float _2732 = abs(_2722);
    float _2734 = log2(_2732);
    float _2736 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2738 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2728);
    float _2740 = _2730 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2742 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2744 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2746 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2738);
    float _2748 = _2716 * _2690;
    float _2750 = -_2744;
    float _2752 = fma(_2750, _2702, 1.0);
    float _2754 = _2746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2756 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2758 = _2716 * _2670;
    float _2760 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2742);
    float _2762 = _2716 * _2682;
    float _2764 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2756);
    float _2766 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2768 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2760);
    float _2770 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2772 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2764);
    float _2774 = -_2766;
    float _2776 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2774);
    float _2778 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2780 = log2(_2752);
    float _2782 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2784 = -_2762;
    float _2786 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2776);
    float _2788 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2772);
    float _2790 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2792 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2782);
    float _2794 = fma(_2786, -0.5, 0.5);
    float _2796 = fma(_2786, 0.5, 0.5);
    float _2798 = exp2(_2770);
    float _2800 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2790);
    float _2802 = _2748 + 1.0;
    float _2804 = fma(_2796, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2806 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2792);
    float _2808 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2800);
    float _2810 = fma(_2796, _2804, -0.212114393711090087890625);
    float _2812 = 1.0 / _2788;
    float _2814 = _2780 * 0.693147182464599609375;
    float _2816 = fma(_2796, _2810, 1.570728778839111328125);
    float _2818 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2820 = sqrt(_2794);
    float _2822 = -_2748;
    float _2824 = fma(_2798, _2802, _2822);
    float _2826 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2808);
    float _2828 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2806);
    float _2830 = fma(_2824, 0.5, 0.5);
    float _2832 = _2826 * _2812;
    float _2834 = _2828 * _2812;
    float _2836 = fma(_2832, 0.5, 0.5);
    float _2838 = fma(_2834, -0.5, 0.5);
    float _2840 = _2820 * 0.636619746685028076171875;
    float _2842 = -_2816;
    float _2844 = fma(_2840, _2842, 1.0);
    float3 _7649 = float3(_2836, _2838, _2818);
    float _2846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7649, float3(0.0), isnan(_7649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7649, float3(0.0), isnan(_7649)), level(0.0)).x;
    float3 _7660 = float3(_2836, _2838, _2818);
    float4 _2849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7660, float3(0.0), isnan(_7660)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7660, float3(0.0), isnan(_7660)), level(0.0)).xyzw;
    float _2851 = _2849.x;
    float _2853 = _2849.y;
    float _2855 = _2849.z;
    float _2857 = _2849.w;
    float2 _7677 = float2(_2844, _2830);
    float3 _2861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7677, float2(0.0), isnan(_7677)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7677, float2(0.0), isnan(_7677)), level(0.0)).xyz;
    float _2863 = _2861.x;
    float _2865 = _2861.y;
    float _2867 = _2861.z;
    float _2869 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2871 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2869);
    float _2873 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2875 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2871);
    float _2877 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2873);
    bool _2879 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2883 = _2879 || _2881;
    bool _2885 = isnan(0.5);
    bool _2887 = _2883 || _2885;
    float _2889 = _2875 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2891 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2877);
    float _2893 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2895 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2897 = 1.0 / _2889;
    float _2899 = _2891 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2901 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2895);
    float _2903 = _2899 + _2889;
    float _2905 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2901);
    float _2907 = exp2(_2893);
    float _2909 = _2895;
    if (_2887)
    {
        _2909 = 1.0;
    }
    float _2911 = _2909;
    float _2913 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2905);
    float _2915 = _2903 * _2897;
    float _2917 = _2915 * 0.5;
    float _2919 = _2911;
    if (!_2887)
    {
        float _2921 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2925 = fma(_2917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2923);
        float _2927 = _2921 * 0.15915493667125701904296875;
        float _2929 = _2927 * 6.283185482025146484375;
        float _2931 = cos(_2929);
        float _2933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2935 = _2933 * 0.15915493667125701904296875;
        float _2937 = _2927 * 6.283185482025146484375;
        float _2939 = sin(_2937);
        float _2941 = 1.0 / _2931;
        float _2943 = _2935 * 6.283185482025146484375;
        float _2945 = cos(_2943);
        float _2947 = _2939 * _2941;
        float _2949 = 1.0 / _2925;
        float _2951 = _2945 * _2947;
        float _2953 = _2935 * 6.283185482025146484375;
        float _2955 = sin(_2953);
        float _2957 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2959 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2957;
        float _2961 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2963 = _2949 * _2961;
        float _2965 = 1.0 / _2951;
        float _2967 = 1.0 / _2959;
        float _2969 = _2955 * _2965;
        float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2973 = fma(_2969, _2963, _2971);
        float _2975 = _2973 * _2967;
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        float _2979 = -_2977;
        float _2981 = _2979 + 1.0;
        _2919 = _2981;
    }
    float _2983 = _2919;
    float _2985 = _2788 * 0.5;
    float _2987 = -_2907;
    float _2989 = _2987 + 1.0;
    bool _2991 = _2983 > 0.0;
    bool _2993 = isnan(_2983);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan(0.0);
    bool _2999 = _2995 || _2997;
    float _3001 = _2983 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3003 = fma(_2828, -0.5, _2985);
    float _3005 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3007 = _2913 + _2788;
    float _3009 = _2826 + _2788;
    out.gl_Position.x = _2826;
    out.gl_Position.y = _2828;
    out.gl_Position.z = _2913;
    out.gl_Position.w = _2788;
    float _3011 = _3005 * _2846;
    float _3013 = -_3005;
    float _3015 = _3013 + 1.0;
    float _3017 = _3007 * 0.5;
    float _3019 = _2857 * _3011;
    float _3021 = _2867 * _3011;
    float _3023 = _3009 * 0.5;
    float _3025 = _3001 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3027 = fma(_2863, _3019, _2851);
    float _3029 = fma(_2865, _3019, _2853);
    float _3031 = _2857 * _3015;
    float _3033 = fma(_2857, _3021, _2855);
    out.m_67.x = _3023;
    out.m_67.y = _3003;
    out.m_67.z = _3017;
    out.m_67.w = _2788;
    out.m_47.x = _3025;
    out.m_69.x = _3027;
    out.m_69.y = _3029;
    out.m_69.z = _3033;
    out.m_69.w = _3031;
    if (_2999)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3035 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3035;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2470 = false;
    bool _1376 = false;
    bool _990 = false;
    bool _848 = false;
    bool _452 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3092 = as_type<float>(_104);
        out.gl_Position.z = _3092;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3161 = as_type<float>(_140);
        out.gl_Position.z = _3161;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _292 + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_308;
    float _348 = _346 + 1.0;
    float _350 = 1.0 / _328;
    float _352 = _344 * _348;
    float _354 = -_344;
    float _356 = _354 + 1.0;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = 1.0 / _332;
    float _366 = _324 * _356;
    float _368 = -_324;
    float _370 = _368 + 1.0;
    float _372 = _296 * _350;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = fma(_360, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = fma(_376, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = fma(_380, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = _312 * _364;
    float _390 = _382 * _366;
    float _392 = _384 * _366;
    float _394 = _386 * _366;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _390);
    float _410 = fma(_398, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = fma(_402, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _414 = fma(_406, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _416 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _392);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _420 = fma(_410, _352, _408);
    float _422 = fma(_412, _352, _416);
    float _424 = fma(_414, _352, _418);
    float _426 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _420);
    float _428 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _422);
    float _430 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _424);
    bool _432 = !_362;
    float _450;
    if (!_432)
    {
        float _434 = in.m_53.x;
        float _436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _438 = _434 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _442 = _440 * _436;
        float _444 = floor(_442);
        float _446 = -_444;
        float _448 = _442 + _446;
        _450 = _448;
        _452 = true;
    }
    else
    {
        float _454 = float(_88);
        float _456 = 1.0 / _454;
        float _458 = _122 * _456;
        _450 = _458;
    }
    _452 = false;
    float _460 = _450;
    float _462 = in.m_51.x;
    float _464 = in.m_51.y;
    float _466 = in.m_51.z;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _470 = _460 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _488 = 1.0 / _474;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _498 = 1.0 / _486;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _502 = _460 + _500;
    bool _504 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _506 = isnan(_460);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    bool _516 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _518 = isnan(_460);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _478;
    float _530 = _502 * _488;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _534 = _460 + _532;
    float _536 = _428 * _464;
    bool _538 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _540 = isnan(_460);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _430 * _466;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _554 = _460 + _552;
    float _556 = 1.0 / _496;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _560 = _460 + _558;
    float _562 = _534 * _498;
    bool _564 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _566 = isnan(_460);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -_548;
    float _578 = _576 + 1.0;
    bool _580 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _582 = 1.0 / _492;
    float _584 = _560 * _528;
    bool _586 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _588 = isnan(_460);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _598;
    float _602 = -_574;
    float _604 = _602 + 1.0;
    float _606 = _574 * _578;
    float _608 = fma(_600, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _610 = 1.0 / _482;
    float _612 = _470 * _556;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _620 = _460 + _618;
    float _622 = _596 * _604;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _628 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _630 = isnan(_460);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = _554 * _582;
    float _642 = fma(_616, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _644 = -_596;
    float _646 = _644 + 1.0;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _656 = fma(_626, _584, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _658 = _514 * _646;
    float _660 = fma(_650, _584, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _662 = _620 * _610;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _664;
    float _668 = -_514;
    float _670 = _668 + 1.0;
    bool _672 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _674 = isnan(_460);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = fma(_654, _584, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _686 = fma(_666, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _688 = _526 * _670;
    float _690 = -_526;
    float _692 = _690 + 1.0;
    float _694 = -_682;
    float _696 = _694 + 1.0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _702;
    float _706 = _682 * _692;
    float _708 = _638 * _696;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _710;
    float _714 = fma(_700, _640, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _716 = fma(_704, _640, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _718 = _608 * _708;
    float _720 = _642 * _708;
    float _722 = _686 * _708;
    float _724 = -_638;
    float _726 = _724 + 1.0;
    float _728 = fma(_712, _640, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[107].x, _718);
    float _744 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[107].y, _720);
    float _746 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[107].z, _722);
    float _748 = fma(_732, _612, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _750 = fma(_736, _612, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _752 = fma(_740, _612, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _754 = fma(_660, _706, _742);
    float _756 = fma(_656, _706, _744);
    float _758 = fma(_684, _706, _746);
    float _760 = fma(_728, _688, _754);
    float _762 = fma(_714, _688, _756);
    float _764 = fma(_716, _688, _758);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _770;
    float _774 = fma(_748, _658, _760);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _776;
    float _780 = fma(_750, _658, _762);
    float _782 = fma(_752, _658, _764);
    float _784 = fma(_768, _662, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _786 = fma(_772, _662, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _792 = fma(_778, _662, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _802 = fma(_784, _622, _774);
    float _804 = fma(_790, _562, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _806 = fma(_796, _562, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _808 = fma(_800, _562, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _810 = fma(_786, _622, _780);
    float _812 = fma(_792, _622, _782);
    float _814 = fma(_804, _606, _802);
    float _816 = fma(_806, _606, _810);
    float _818 = fma(_808, _606, _812);
    float _820 = _426 * _462;
    float _822 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[113].x, _814);
    float _824 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[113].y, _816);
    float _826 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[113].z, _818);
    bool _828 = !_580;
    float _846;
    if (!_828)
    {
        float _830 = in.m_53.x;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _834 = _830 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _838 = _836 * _832;
        float _840 = floor(_838);
        float _842 = -_840;
        float _844 = _838 + _842;
        _846 = _844;
        _848 = true;
    }
    else
    {
        float _850 = float(_88);
        float _852 = 1.0 / _850;
        float _854 = _122 * _852;
        _846 = _854;
    }
    _848 = false;
    float _856 = _846;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _860 = _856 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _868 = isnan(_856);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _882 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _884 = isnan(_856);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _894;
    bool _898 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _900 = isnan(_856);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = 1.0 / _864;
    float _912 = -_876;
    float _914 = _912 + 1.0;
    bool _916 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _918 = 1.0 / _880;
    float _920 = _896 * _910;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _926 = -_908;
    float _928 = _926 + 1.0;
    float _930 = fma(_920, _860, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _932 = _892 * _914;
    float _934 = -_892;
    float _936 = _934 + 1.0;
    float _938 = _876 * _928;
    float _940 = _924 * _918;
    float _942 = _930 * _932;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _946 = _856 + _944;
    float _948 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _826 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _954 = fma(_940, _946, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _956 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = fma(_954, _938, _952);
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[117].x, _960);
    float _966 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _964 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _958;
    out.m_55.y = _962;
    out.m_55.z = _966;
    out.m_55.w = _968;
    bool _970 = !_916;
    float _988;
    if (!_970)
    {
        float _972 = in.m_53.x;
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _976 = _972 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _980 = _978 * _974;
        float _982 = floor(_980);
        float _984 = -_982;
        float _986 = _980 + _984;
        _988 = _986;
        _990 = true;
    }
    else
    {
        float _992 = float(_88);
        float _994 = 1.0 / _992;
        float _996 = _122 * _994;
        _988 = _996;
    }
    _990 = false;
    float _998 = _988;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = _998 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1020 = 1.0 / _1006;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1030 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1032 = isnan(_998);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = 1.0 / _1024;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1046 = _998 + _1044;
    float _1048 = 1.0 / _1018;
    float _1050 = _1046 * _1020;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1054 = _998 + _1052;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1058 = _998 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1060;
    bool _1064 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1066 = 1.0 / _1010;
    float _1068 = _1054 * _1042;
    bool _1070 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1072 = isnan(_998);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1082;
    float _1086 = fma(_1084, _1050, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1088 = 1.0 / _1014;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1092 = _998 + _1090;
    float _1094 = _1058 * _1048;
    float _1096 = 1.0 / _1028;
    float _1098 = _1092 * _1066;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1102 = _998 + _1100;
    bool _1104 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1106 = isnan(_998);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = -_1080;
    float _1118 = _1116 + 1.0;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1120;
    float _1124 = _1002 * _1088;
    bool _1126 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1128 = isnan(_998);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -_1114;
    float _1140 = _1138 + 1.0;
    float _1142 = _1114 * _1118;
    float _1144 = fma(_1122, _1050, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1146 = _1136 * _1140;
    float _1148 = -_1136;
    float _1150 = _1148 + 1.0;
    float _1152 = _1102 * _1096;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1162 = -_1040;
    float _1164 = _1162 + 1.0;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1170 = fma(_1156, _1050, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1172 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1174 = isnan(_998);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1188 = _1040 * _1150;
    bool _1190 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1192 = isnan(_998);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = fma(_1168, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1204 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1206 = isnan(_998);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1182 * _1164;
    float _1218 = -_1182;
    float _1220 = _1218 + 1.0;
    float _1222 = fma(_1160, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1224 = fma(_1186, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1226 = -_1214;
    float _1228 = _1226 + 1.0;
    float _1230 = _1214 * _1220;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1236;
    float _1240 = _1200 * _1228;
    float _1242 = -_1200;
    float _1244 = _1242 + 1.0;
    float _1246 = fma(_1234, _1124, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1248 = fma(_1238, _1124, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1250 = fma(_1062, _1124, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1252 = _1144 * _1240;
    float _1254 = _1170 * _1240;
    float _1256 = _1086 * _1240;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1252);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1254);
    float _1266 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1256);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1276 = fma(_1222, _1230, _1264);
    float _1278 = fma(_1224, _1230, _1266);
    float _1280 = fma(_1202, _1230, _1262);
    float _1282 = fma(_1260, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1284 = fma(_1270, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1286 = fma(_1274, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1288;
    float _1292 = fma(_1246, _1216, _1280);
    float _1294 = fma(_1248, _1216, _1276);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1296;
    float _1300 = fma(_1250, _1216, _1278);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1302;
    float _1306 = fma(_1290, _1068, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1308 = fma(_1298, _1068, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1310 = fma(_1282, _1188, _1292);
    float _1312 = fma(_1284, _1188, _1294);
    float _1314 = fma(_1286, _1188, _1300);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1324 = fma(_1304, _1068, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1330 = fma(_1308, _1146, _1310);
    float _1332 = fma(_1318, _1152, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1334 = fma(_1322, _1152, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1336 = fma(_1306, _1146, _1312);
    float _1338 = fma(_1328, _1152, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1340 = fma(_1324, _1146, _1314);
    float _1342 = fma(_1332, _1142, _1330);
    float _1344 = fma(_1334, _1142, _1336);
    float _1346 = fma(_1338, _1142, _1340);
    float _1348 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1342);
    float _1350 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1344);
    float _1352 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1346);
    bool _1354 = !_1064;
    float _1356 = _1284;
    float _1374;
    if (!_1354)
    {
        float _1358 = in.m_53.x;
        float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1362 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1366 = _1364 * _1360;
        float _1368 = floor(_1366);
        float _1370 = -_1368;
        float _1372 = _1366 + _1370;
        _1374 = _1372;
        _1376 = true;
    }
    else
    {
        float _1378 = float(_88);
        float _1380 = 1.0 / _1378;
        float _1382 = _122 * _1380;
        _1374 = _1382;
    }
    _1376 = false;
    float _1384 = _1374;
    float _1386 = in.m_53.w;
    float _1388 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1390 = in.m_53.x;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1394 = _1392 != 0;
    float _1396 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1400 = _1398 != 0;
    float _1402 = in.m_53.y;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1406 = _1404 != 0;
    float _1408 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1396);
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1412 = _1410 != 0;
    float _1414 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1418 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1388);
    float _1420 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1414);
    bool _1422 = _1412;
    if (_1394)
    {
        float _1424 = in.m_53.z;
        _1356 = _1424;
    }
    float _1426 = _1356;
    float _1428 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1408);
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1434 = in.m_57.x;
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1438 = _1386 > 0.5;
    float _1440 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1442 = in.m_57.y;
    float _1444 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1448 = false;
    bool _1450 = _1438;
    if (_1400)
    {
        bool _1452 = _1390 > 0.5;
        _1448 = _1452;
    }
    bool _1454 = _1448;
    float _1456 = -_1416;
    float _1458 = fma(_1444, 2.0, _1456);
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1462 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1464 = 1.0 / _1432;
    bool _1466 = _1402 > 0.5;
    float _1468 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1418);
    float _1470 = fma(_1462, -2.0, _1460);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1474 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1446);
    float _1476 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1478 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1470);
    float _1480 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1472);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1482;
    float _1486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1488 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1420);
    bool _1490 = _1384 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1492 = isnan(_1384);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1504 = _1384 + _1502;
    float _1506 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1474);
    bool _1508 = _1384 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1510 = isnan(_1384);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = -_1442;
    float _1522 = _1520 + 1.0;
    float _1524 = _1484 * _1464;
    float _1526 = -_1500;
    float _1528 = _1526 + 1.0;
    float _1530 = -_122;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1458);
    float _1534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1536 = _1438 ? as_type<int>(_1522) : as_type<int>(_1442);
    float _1538 = fma(_1524, _1504, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1540 = _1442;
    int _1542 = as_type<int>(_1528);
    float _1544 = _1524;
    if (_1394)
    {
        bool _1546 = _1426 > 0.5;
        _1450 = _1546;
    }
    bool _1548 = _1450;
    float _1550 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1480);
    float _1552 = _1406 ? as_type<float>(_1536) : _1442;
    float _1554 = _1518 * _1528;
    float _1556 = _1554;
    float _1558 = _1552;
    if (_1412)
    {
        float _1560 = _1466 ? _1522 : _1442;
        _1540 = _1560;
    }
    float _1562 = _1540;
    float _1564 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1566 = as_type<int>(_1486);
    if (_1394)
    {
        float _1568 = -_1434;
        float _1570 = _1568 + 1.0;
        _1566 = as_type<int>(_1570);
    }
    int _1572 = _1566;
    float _1574 = _1468 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1576 = _1538 * _1554;
    float _1578 = _1574;
    if (_1400)
    {
        float _1580 = -_1434;
        float _1582 = _1580 + 1.0;
        _1542 = as_type<int>(_1582);
    }
    int _1584 = _1542;
    if (!_1394)
    {
        _1556 = _1434;
    }
    float _1586 = _1556;
    float _1588 = _1488 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1590 = _1586;
    if (_1394)
    {
        float _1592 = _1548 ? as_type<float>(_1572) : _1434;
        _1590 = _1592;
    }
    float _1594 = _1590;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1598 = _1574 + _1596;
    if (!_1400)
    {
        _1544 = _1434;
    }
    float _1600 = _1544;
    float _1602 = fma(_1564, _1562, -0.5);
    float _1604 = _1600;
    if (_1400)
    {
        float _1606 = _1454 ? as_type<float>(_1584) : _1434;
        _1604 = _1606;
    }
    float _1608 = _1604;
    float _1610 = -_1518;
    float _1612 = _1610 + 1.0;
    float _1614 = _1428 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1618 = _1588 + _1616;
    float _1620 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1622 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1624 = fma(_1612, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1576);
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1614 + _1626;
    float _1630 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1620);
    float _1632 = fma(_1622, _1608, -0.5);
    float _1634 = -_1478;
    float _1636 = fma(_1550, _1602, _1634);
    float _1638 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1624);
    float _1640 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1630);
    float _1642 = fma(_1506, _1632, _1532);
    float _1644 = _1598 * _1598;
    float _1646 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1650 = _1640 >= 0.0;
    float _1652 = fma(_1618, _1618, _1644);
    float _1654 = _1646 * _1534;
    float _1656 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1658 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1660 = fma(_1628, _1628, _1652);
    float _1662 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = _1636 + 0.5;
    float _1666 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = rsqrt(_1660);
    float _1670 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1672 = as_type<int>(_1636);
    if (_1650)
    {
        _1558 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1674 = _1558;
    float _1676 = _1656 * _1648;
    float _1678 = _1642 + 0.5;
    float _1680 = _1638 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1650)
    {
        float _1682 = _1674 * 5.0;
        _1672 = as_type<int>(_1682);
    }
    int _1684 = _1672;
    if (_1650)
    {
        out.m_47.x = 0.0;
    }
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1686 = _1598 * _1668;
    out.m_61.x = _1678;
    out.m_61.y = _1664;
    out.m_61.z = _1654;
    out.m_61.w = _1676;
    float _1688 = _1618 * _1668;
    if (_1650)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5735 = as_type<float>(_1684);
        out.gl_Position.z = _5735;
    }
    out.m_63.x = _1662;
    out.m_63.y = _1670;
    out.m_63.z = _1666;
    out.m_63.w = _1680;
    if (_1650)
    {
        return out;
    }
    float _1690 = -_1686;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1574);
    float _1694 = _1628 * _1668;
    float _1696 = -_1688;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1588);
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1702 = _1692 + _1700;
    float _1704 = -_1694;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1710 = _1698 + _1708;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1706 + _1714;
    float _1718 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1712);
    float _1720 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1718);
    bool _1722 = _1720 >= 0.0;
    float _1724 = _1716;
    if (_1722)
    {
        _1724 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1726 = _1724;
    int _1728 = as_type<int>(_1726);
    if (_1722)
    {
        out.m_47.x = 0.0;
    }
    if (_1722)
    {
        float _1730 = _1726 * 5.0;
        _1728 = as_type<int>(_1730);
    }
    int _1732 = _1728;
    if (_1722)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5834 = as_type<float>(_1732);
        out.gl_Position.z = _5834;
    }
    if (_1722)
    {
        return out;
    }
    float _1734 = -_1574;
    float _1736 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1738 = -_1588;
    float _1740 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1736 * _1736;
    float _1744 = -_1614;
    float _1746 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1750 = -_1688;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1618);
    float _1754 = fma(_1740, _1740, _1742);
    float _1756 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1748);
    float _1758 = -_1694;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1628);
    float _1762 = fma(_1746, _1746, _1754);
    float _1764 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1756);
    float _1766 = rsqrt(_1762);
    float _1768 = rsqrt(_1764);
    float _1770 = _1740 * _1766;
    float _1772 = _1736 * _1766;
    float _1774 = _1746 * _1766;
    float _1776 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1778 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1780 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1782 = _1776 * _1770;
    float _1784 = _1778 * _1774;
    float _1786 = _1780 * _1772;
    float _1788 = -_1782;
    float _1790 = fma(_1778, _1772, _1788);
    float _1792 = -_1784;
    float _1794 = fma(_1780, _1770, _1792);
    float _1796 = -_1786;
    float _1798 = fma(_1776, _1774, _1796);
    float _1800 = -_1574;
    float _1802 = _1800 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1804 = _1770 * _1790;
    float _1806 = _1774 * _1794;
    float _1808 = -_1588;
    float _1810 = _1808 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1812 = _1772 * _1798;
    float _1814 = -_1804;
    float _1816 = fma(_1774, _1798, _1814);
    float _1818 = -_1806;
    float _1820 = fma(_1772, _1790, _1818);
    float _1822 = -_1812;
    float _1824 = fma(_1770, _1794, _1822);
    float _1826 = _1802 * _1816;
    float _1828 = _1794 * _1802;
    float _1830 = fma(_1810, _1820, _1826);
    float _1832 = -_1614;
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1836 = fma(_1798, _1810, _1828);
    float _1838 = fma(_1834, _1824, _1830);
    float _1840 = fma(_1790, _1834, _1836);
    float _1842 = -_1686;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1598);
    float _1846 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1848 = _1838 * _1838;
    float _1850 = _1844 * _1844;
    float _1852 = fma(_1840, _1840, _1848);
    float _1854 = fma(_1752, _1752, _1850);
    float _1856 = rsqrt(_1852);
    float _1858 = _1840 * _1856;
    float _1860 = _1838 * _1856;
    float _1862 = fma(_1760, _1760, _1854);
    float _1864 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1866 = abs(_1858);
    float _1868 = abs(_1860);
    float _1870 = precise::max(_1866, _1868);
    float _1872 = sqrt(_1862);
    bool _1874 = _1870 >= 16.0;
    float _1876 = in.m_65.x;
    float _1878 = in.m_65.y;
    float _1880 = in.m_65.z;
    float _1882 = _1860;
    float _1884 = _1858;
    if (_1874)
    {
        float _1886 = _1860 * 0.0625;
        _1882 = _1886;
    }
    float _1888 = _1882;
    if (_1874)
    {
        float _1890 = _1858 * 0.0625;
        _1884 = _1890;
    }
    float _1892 = _1884;
    float _1894 = _1668 * _1872;
    float _1896 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1898 = abs(_1888);
    bool _1900 = _1898 != 0.0;
    bool _1902 = isnan(_1898);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan(0.0);
    bool _1908 = _1904 || _1906;
    float _1910 = _1894 * _1896;
    float _1912 = abs(_1892);
    bool _1914 = _1912 == 0.0;
    float _1916 = _1894 * _1864;
    float _1918 = abs(_1892);
    bool _1920 = _1918 == 0.0;
    bool _1922 = !_1908;
    bool _1924 = _1920 && _1922;
    float _1926 = _1894 * _1846;
    float _1928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1878);
    float _1930 = _1772 * _1772;
    float _1932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1876);
    float _1934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1880);
    float _1936 = fma(_1770, _1770, _1930);
    float _1938 = _1926 * _1932;
    float _1940 = fma(_1774, _1774, _1936);
    int _1942 = as_type<int>(_1880);
    if (_1924)
    {
        bool _1944 = as_type<int>(_1892) >= 0;
        _1422 = _1944;
    }
    bool _1946 = _1422;
    int _1948 = _1946 ? (-1) : 0;
    if (_1924)
    {
        int _1950 = _1946 ? 0 : 1078530011;
        _1942 = _1950;
    }
    int _1952 = _1942;
    int _1954 = _1952;
    if (_1924)
    {
        int _1956 = int(0x80000000) & as_type<int>(_1888);
        int _1958 = _1952 | _1956;
        _1954 = _1958;
    }
    int _1960 = _1954;
    bool _1962 = !_1908;
    bool _1964 = _1962 && _1914;
    int _1966 = _1960;
    float _1968 = as_type<float>(_1960);
    if (!_1964)
    {
        float _1970 = abs(_1888);
        bool _1972 = _1970 != as_type<float>(0x7f800000u /* inf */);
        bool _1974 = isnan(_1970);
        bool _1976 = _1972 || _1974;
        bool _1978 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1980 = _1976 || _1978;
        float _1982 = abs(_1892);
        bool _1984 = _1982 == as_type<float>(0x7f800000u /* inf */);
        float _1986 = abs(_1892);
        bool _1988 = _1986 == as_type<float>(0x7f800000u /* inf */);
        bool _1990 = !_1980;
        bool _1992 = _1988 && _1990;
        if (_1992)
        {
            bool _1994 = as_type<int>(_1892) >= 0;
            _1948 = _1994 ? (-1) : 0;
        }
        int _1996 = _1948;
        if (_1992)
        {
            _1966 = 1075235812;
        }
        int _1998 = _1966;
        int _2000 = _1998;
        if (_1992)
        {
            int _2002 = ~_1996;
            int _2004 = (_2002 != 0) ? _1998 : 1061752795;
            _2000 = _2004;
        }
        int _2006 = _2000;
        float _2008 = as_type<float>(_2006);
        if (_1992)
        {
            int _2010 = int(0x80000000) & as_type<int>(_1888);
            int _2012 = _2006 | _2010;
            _2008 = as_type<float>(_2012);
        }
        float _2014 = _2008;
        bool _2016 = !_1980;
        bool _2018 = _2016 && _1984;
        _1968 = _2014;
        if (!_2018)
        {
            float _2020 = abs(_1888);
            float _2022 = abs(_1892);
            float _2024 = precise::max(_2020, _2022);
            float _2026 = abs(_1888);
            float _2028 = abs(_1892);
            float _2030 = precise::min(_2026, _2028);
            float _2032 = 1.0 / _2024;
            float _2034 = abs(_1888);
            float _2036 = abs(_1892);
            bool _2038 = _2034 > _2036;
            bool _2040 = as_type<int>(_1892) >= 0;
            float _2042 = _2030 * _2032;
            float _2044 = abs(_1888);
            float _2046 = abs(_1892);
            float _2048 = _2044 + _2046;
            int _2050 = as_type<int>(_1888) & int(0x80000000);
            float _2052 = _2042 * _2042;
            bool _2054 = _2048 > as_type<float>(0x7f800000u /* inf */);
            bool _2056 = isnan(_2048);
            bool _2058 = _2054 || _2056;
            bool _2060 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2062 = _2058 || _2060;
            float _2064 = _2052 + 11.33538818359375;
            float _2066 = fma(_2052, _2064, 28.84246826171875);
            float _2068 = fma(_2052, _2066, 19.6966705322265625);
            float _2070 = fma(_2052, -0.82336294651031494140625, -5.674867153167724609375);
            float _2072 = fma(_2052, _2070, -6.565555095672607421875);
            float _2074 = 1.0 / _2068;
            float _2076 = _2052 * _2072;
            float _2078 = _2042 * _2076;
            float _2080 = fma(_2078, _2074, _2042);
            float _2082 = _2080;
            _1968 = _2048;
            if (_2038)
            {
                float _2084 = -_2080;
                float _2086 = _2084 + 1.57079637050628662109375;
                _2082 = _2086;
            }
            float _2088 = _2082;
            int _2090 = as_type<int>(_2088);
            if (!_2040)
            {
                float _2092 = -_2088;
                float _2094 = _2092 + 3.1415927410125732421875;
                _2090 = as_type<int>(_2094);
            }
            int _2096 = _2090;
            if (!_2062)
            {
                int _2098 = _2050 | _2096;
                _1968 = as_type<float>(_2098);
            }
        }
    }
    float _2100 = _1968;
    float _2102 = _2100 + 1.57079637050628662109375;
    float _2104 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2106 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2110 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _2108;
    float _2112 = _1916 * _1928;
    float _2114 = _2102 * 0.15915493667125701904296875;
    float _2116 = _2106 * _2106;
    float _2118 = rsqrt(_1940);
    float _2120 = _1910 * _1934;
    float _2122 = fma(_2110, _2110, _2116);
    float _2124 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2126 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2128 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2130 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _2130;
    float _2134 = _2114 * 6.283185482025146484375;
    float _2136 = cos(_2134);
    float _2138 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2124);
    float _2140 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2126);
    float _2142 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    float _2144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2148 = fma(_2132, _2132, _2122);
    float _2150 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2138);
    float _2152 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2140);
    float _2154 = _2114 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    float _2158 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2142);
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2162 = _2160 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2164 = _2146 * _2146;
    float _2166 = _1770 * _2118;
    float _2168 = _1774 * _2118;
    float _2170 = _1772 * _2118;
    float _2172 = fma(_2162, _2162, _2164);
    float _2174 = sqrt(_2148);
    float _2176 = -_2136;
    float _2178 = _2176 + 1.0;
    float _2180 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2184 = _2182 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2186 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2188 = _2166 * _2178;
    float _2190 = _2170 * _2178;
    float _2192 = _2168 * _2168;
    float _2194 = _2168 * _2156;
    float _2196 = _2166 * _2156;
    float _2198 = _2170 * _2156;
    float _2200 = fma(_2184, _2184, _2172);
    float _2202 = -_2194;
    float _2204 = fma(_2170, _2188, _2202);
    float _2206 = fma(_2168, _2190, _2196);
    float _2208 = fma(_2166, _2188, _2136);
    float _2210 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2212 = _2186 * _2204;
    float _2214 = -_2198;
    float _2216 = fma(_2168, _2188, _2214);
    float _2218 = _2186 * _2206;
    float _2220 = fma(_2178, _2192, _2136);
    float _2222 = _2174 * 0.066666670143604278564453125;
    float _2224 = fma(_2180, _2208, _2212);
    float _2226 = precise::max(_2174, 15.0);
    float _2228 = fma(_2180, _2216, _2218);
    float _2230 = rsqrt(_2200);
    float _2232 = fma(_2168, _2188, _2198);
    float _2234 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _2236 = _2234 + 1.0;
    float _2238 = precise::max(_2222, 1.0);
    float _2240 = fma(_2210, _2232, _2224);
    float _2242 = precise::min(_2226, 30.0);
    float _2244 = fma(_2210, _2220, _2228);
    float _2246 = precise::min(_2238, 2.0);
    float _2248 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, 0.3499999940395355224609375, _2236);
    float _2250 = _1588 + _2240;
    float _2252 = fma(_2242, 0.066666670143604278564453125, -1.0);
    float _2254 = _1614 + _2244;
    float _2256 = _2246 * _2248;
    float _2258 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2260 = _2250 + _2258;
    float _2262 = _2252 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _2264 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2266 = _2254 + _2264;
    float _2268 = fma(_2170, _2190, _2136);
    float _2270 = fma(_2260, _2256, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _2272 = _2230 * _2262;
    float _2274 = fma(_2266, _2256, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _2276 = fma(_2170, _2188, _2194);
    float _2278 = _2186 * _2268;
    float _2280 = -_2272;
    float _2282 = fma(_2162, _2280, _2270);
    float _2284 = -_2272;
    float _2286 = fma(_2184, _2284, _2274);
    float _2288 = -_2196;
    float _2290 = fma(_2168, _2190, _2288);
    float _2292 = fma(_2180, _2276, _2278);
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2296 = _2282 + _2294;
    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2300 = _2286 + _2298;
    float _2302 = fma(_2210, _2290, _2292);
    float _2304 = _2296 * _2296;
    float _2306 = _2300 * _2300;
    float _2308 = _1574 + _2302;
    float _2310 = _2304 + _2306;
    float _2312 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2314 = _2308 + _2312;
    float _2316 = sqrt(_2310);
    float _2318 = fma(_2314, _2256, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _2320 = -_2272;
    float _2322 = fma(_2146, _2320, _2318);
    bool _2324 = _2316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2326 = _2180;
    float _2328 = _2146;
    float _2330 = _2292;
    float _2332 = _2168;
    if (!_2324)
    {
        _1578 = _2306;
    }
    float _2334 = _1578;
    float _2336 = _2334;
    if (!_2324)
    {
        _2326 = _2304;
    }
    float _2338 = _2326;
    float _2340 = _2338;
    if (!_2324)
    {
        _2328 = _2282;
    }
    float _2342 = _2328;
    float _2344 = _2342;
    if (!_2324)
    {
        _2330 = _2286;
    }
    float _2346 = _2330;
    float _2348 = _2346;
    if (!_2324)
    {
        _2332 = _2322;
    }
    float _2350 = _2332;
    bool _2352 = !_2324;
    float _2354 = _2350;
    if (!_2352)
    {
        float _2356 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2360 = _2316 + _2358;
        float _2362 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2364 = rsqrt(_2310);
        float _2366 = _2360 * _2356;
        float _2368 = _2366 * 0.15915493667125701904296875;
        float _2370 = _2368 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        float _2374 = _2368 * 6.283185482025146484375;
        float _2376 = cos(_2374);
        float _2378 = fma(_2372, _2362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2380 = _2364 * _2378;
        float _2382 = _2376 + (-1.0);
        float _2384 = fma(_2296, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2386 = fma(_2300, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2388 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2392 = _2384 + _2390;
        float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2396 = _2386 + _2394;
        float _2398 = fma(_2322, _2376, _2388);
        float _2400 = _2392 * _2392;
        float _2402 = _2396 * _2396;
        _2354 = _2398;
        _2340 = _2400;
        _2336 = _2402;
        _2344 = _2384;
        _2348 = _2386;
    }
    float _2404 = _2354;
    float _2406 = _2340;
    float _2408 = _2336;
    float _2410 = _2344;
    float _2412 = _2348;
    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2416 = _2404 + _2414;
    out.m_55.x = _958;
    out.m_55.y = _962;
    out.m_55.z = _966;
    out.m_55.w = _968;
    float _2418 = fma(_2416, _2416, _2406);
    out.m_63.x = _1662;
    out.m_63.y = _1670;
    out.m_63.z = _1666;
    out.m_63.w = _1680;
    float _2420 = _2418 + _2408;
    float _2422 = sqrt(_2420);
    bool _2424 = _2422 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2426 = isnan(_2422);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2432 = _2428 || _2430;
    float _2434 = _2418;
    if (!_2432)
    {
        _2434 = 1.0;
    }
    float _2436 = _2434;
    bool _2438 = !_2432;
    float _2440 = _2436;
    if (!_2438)
    {
        bool _2442 = _2422 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2444 = isnan(_2422);
        bool _2446 = _2442 || _2444;
        bool _2448 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2450 = _2446 || _2448;
        if (!_2450)
        {
            float _2452 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2454 = _2422 + _2452;
            float _2456 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2458 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2456;
            float _2460 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2464 = 1.0 / _2458;
            float _2466 = _2454 * _2464;
            float _2468 = fma(_2466, _2462, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2440 = _2468;
            _2470 = true;
        }
        else
        {
            bool _2472 = _2422 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2474 = isnan(_2422);
            bool _2476 = _2472 || _2474;
            bool _2478 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2480 = _2476 || _2478;
            if (!_2480)
            {
                float _2482 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2484 = _2422 + _2482;
                float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2488 = _2486 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2490 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2492 = _2490 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2494 = 1.0 / _2488;
                float _2496 = _2484 * _2494;
                float _2498 = fma(_2496, _2492, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2440 = _2498;
                _2470 = true;
            }
            else
            {
                _2440 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2470 = false;
    float _2500 = _2440;
    float _2502 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2504 = _2404 + _2502;
    float _2506 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2508 = _2410 + _2506;
    float _2510 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2512 = _2412 + _2510;
    float _2514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2516 = fma(_2504, _2500, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2518 = fma(_2508, _2500, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2520 = fma(_2512, _2500, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2522 = -_1686;
    float _2524 = fma(_2522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2516);
    float _2526 = -_1688;
    float _2528 = fma(_2526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2518);
    float _2530 = -_1694;
    float _2532 = fma(_2530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2520);
    float _2534 = precise::max(0.0, _2514);
    float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2538 = _2524 + _2536;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2542 = _2528 + _2540;
    float _2544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2546 = _2532 + _2544;
    float _2548 = _2538 * _2538;
    float _2550 = fma(_2542, _2542, _2548);
    float _2552 = fma(_2546, _2546, _2550);
    float _2554 = rsqrt(_2552);
    float _2556 = sqrt(_2552);
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2560 = _2542 * _2558;
    float _2562 = _2546 * _2558;
    float _2564 = -_2558;
    float _2566 = -_2534;
    float _2568 = fma(_2538, _2564, _2566);
    float _2570 = _2560 * _2560;
    float _2572 = _2562 * _2562;
    float _2574 = _2570 + _2572;
    float _2576 = sqrt(_2574);
    bool _2578 = _2576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2582 = _2576 + _2580;
    float _2584 = _962;
    float _2586 = _2538;
    float _2588 = _2546;
    float _2590 = _2582;
    float _2592 = _2508;
    float _2594 = _2560;
    if (_2578)
    {
        float _2596 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2584 = _2596;
    }
    float _2598 = _2584;
    if (_2578)
    {
        float _2600 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2586 = _2600;
    }
    float _2602 = _2586;
    float _2604 = _2602;
    if (_2578)
    {
        float _2606 = rsqrt(_2574);
        _2588 = _2606;
    }
    float _2608 = _2588;
    float _2610 = _2598;
    float _2612 = _2608;
    if (_2578)
    {
        float _2614 = _2582 * _2598;
        _2590 = _2614;
    }
    float _2616 = _2590;
    if (_2578)
    {
        float _2618 = _2616 * 0.15915493667125701904296875;
        _2610 = _2618;
    }
    float _2620 = _2610;
    float _2622 = _2616;
    float _2624 = _2620;
    if (_2578)
    {
        float _2626 = _2620 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        _2622 = _2628;
    }
    float _2630 = _2622;
    float _2632 = _958;
    if (_2578)
    {
        float _2634 = _2620 * 6.283185482025146484375;
        float _2636 = cos(_2634);
        _2632 = _2636;
    }
    float _2638 = _2632;
    float _2640 = _2630;
    if (_2578)
    {
        float _2642 = fma(_2630, _2602, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2604 = _2642;
    }
    float _2644 = _2604;
    float _2646 = _2644;
    if (_2578)
    {
        float _2648 = _2608 * _2644;
        _2592 = _2648;
    }
    float _2650 = _2592;
    if (!_2578)
    {
        _2646 = _2568;
    }
    float _2652 = _2646;
    float _2654 = _2652;
    if (!_2578)
    {
        _2612 = _2570;
    }
    float _2656 = _2612;
    float _2658 = _2656;
    float _2660 = _2638;
    if (_2578)
    {
        float _2662 = _2638 + (-1.0);
        _2640 = _2662;
    }
    float _2664 = _2640;
    float _2666 = _2664;
    if (_2578)
    {
        float _2668 = _2560 * _2650;
        _2594 = _2668;
    }
    float _2670 = _2594;
    if (_2578)
    {
        float _2672 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2624 = _2672;
    }
    float _2674 = _2624;
    if (!_2578)
    {
        _2666 = _2562;
    }
    float _2676 = _2666;
    float _2678 = _2676;
    if (_2578)
    {
        float _2680 = _2562 * _2650;
        _2678 = _2680;
    }
    float _2682 = _2678;
    if (_2578)
    {
        float _2684 = _2670 * _2670;
        _2658 = _2684;
    }
    float _2686 = _2658;
    if (_2578)
    {
        float _2688 = fma(_2568, _2638, _2674);
        _2654 = _2688;
    }
    float _2690 = _2654;
    if (!_2578)
    {
        _2660 = _2572;
    }
    float _2692 = _2660;
    float _2694 = _2692;
    if (_2578)
    {
        float _2696 = _2682 * _2682;
        _2694 = _2696;
    }
    float _2698 = _2694;
    float _2700 = fma(_2690, _2690, _2686);
    float _2702 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2704 = _2700 + _2698;
    float _2706 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2710 = fma(_2556, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2708);
    float _2712 = precise::clamp(_2710, 0.0, 1.0);
    float _2714 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2716 = rsqrt(_2704);
    float _2718 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2706);
    float _2720 = -_2712;
    float _2722 = _2720 + 1.0;
    float _2724 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2714);
    float _2726 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2718);
    float _2728 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2730 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2724);
    float _2732 = abs(_2722);
    float _2734 = log2(_2732);
    float _2736 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2738 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2728);
    float _2740 = _2730 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2742 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2744 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2746 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2738);
    float _2748 = _2716 * _2690;
    float _2750 = -_2744;
    float _2752 = fma(_2750, _2702, 1.0);
    float _2754 = _2746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2756 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2758 = _2716 * _2670;
    float _2760 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2742);
    float _2762 = _2716 * _2682;
    float _2764 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2756);
    float _2766 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2768 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2760);
    float _2770 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2772 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2764);
    float _2774 = -_2766;
    float _2776 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2774);
    float _2778 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2780 = log2(_2752);
    float _2782 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2784 = -_2762;
    float _2786 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2776);
    float _2788 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2772);
    float _2790 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2792 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2782);
    float _2794 = fma(_2786, -0.5, 0.5);
    float _2796 = fma(_2786, 0.5, 0.5);
    float _2798 = exp2(_2770);
    float _2800 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2790);
    float _2802 = _2748 + 1.0;
    float _2804 = fma(_2796, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2806 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2792);
    float _2808 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2800);
    float _2810 = fma(_2796, _2804, -0.212114393711090087890625);
    float _2812 = 1.0 / _2788;
    float _2814 = _2780 * 0.693147182464599609375;
    float _2816 = fma(_2796, _2810, 1.570728778839111328125);
    float _2818 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2820 = sqrt(_2794);
    float _2822 = -_2748;
    float _2824 = fma(_2798, _2802, _2822);
    float _2826 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2808);
    float _2828 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2806);
    float _2830 = fma(_2824, 0.5, 0.5);
    float _2832 = _2826 * _2812;
    float _2834 = _2828 * _2812;
    float _2836 = fma(_2832, 0.5, 0.5);
    float _2838 = fma(_2834, -0.5, 0.5);
    float _2840 = _2820 * 0.636619746685028076171875;
    float _2842 = -_2816;
    float _2844 = fma(_2840, _2842, 1.0);
    float3 _7649 = float3(_2836, _2838, _2818);
    float _2846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7649, float3(0.0), isnan(_7649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7649, float3(0.0), isnan(_7649)), level(0.0)).x;
    float3 _7660 = float3(_2836, _2838, _2818);
    float4 _2849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7660, float3(0.0), isnan(_7660)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7660, float3(0.0), isnan(_7660)), level(0.0)).xyzw;
    float _2851 = _2849.x;
    float _2853 = _2849.y;
    float _2855 = _2849.z;
    float _2857 = _2849.w;
    float2 _7677 = float2(_2844, _2830);
    float3 _2861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7677, float2(0.0), isnan(_7677)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7677, float2(0.0), isnan(_7677)), level(0.0)).xyz;
    float _2863 = _2861.x;
    float _2865 = _2861.y;
    float _2867 = _2861.z;
    float _2869 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2871 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2869);
    float _2873 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2875 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2871);
    float _2877 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2873);
    bool _2879 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2883 = _2879 || _2881;
    bool _2885 = isnan(0.5);
    bool _2887 = _2883 || _2885;
    float _2889 = _2875 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2891 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2877);
    float _2893 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2895 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2897 = 1.0 / _2889;
    float _2899 = _2891 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2901 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2895);
    float _2903 = _2899 + _2889;
    float _2905 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2901);
    float _2907 = exp2(_2893);
    float _2909 = _2895;
    if (_2887)
    {
        _2909 = 1.0;
    }
    float _2911 = _2909;
    float _2913 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2905);
    float _2915 = _2903 * _2897;
    float _2917 = _2915 * 0.5;
    float _2919 = _2911;
    if (!_2887)
    {
        float _2921 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2925 = fma(_2917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2923);
        float _2927 = _2921 * 0.15915493667125701904296875;
        float _2929 = _2927 * 6.283185482025146484375;
        float _2931 = cos(_2929);
        float _2933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2935 = _2933 * 0.15915493667125701904296875;
        float _2937 = _2927 * 6.283185482025146484375;
        float _2939 = sin(_2937);
        float _2941 = 1.0 / _2931;
        float _2943 = _2935 * 6.283185482025146484375;
        float _2945 = cos(_2943);
        float _2947 = _2939 * _2941;
        float _2949 = 1.0 / _2925;
        float _2951 = _2945 * _2947;
        float _2953 = _2935 * 6.283185482025146484375;
        float _2955 = sin(_2953);
        float _2957 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2959 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2957;
        float _2961 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2963 = _2949 * _2961;
        float _2965 = 1.0 / _2951;
        float _2967 = 1.0 / _2959;
        float _2969 = _2955 * _2965;
        float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2973 = fma(_2969, _2963, _2971);
        float _2975 = _2973 * _2967;
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        float _2979 = -_2977;
        float _2981 = _2979 + 1.0;
        _2919 = _2981;
    }
    float _2983 = _2919;
    float _2985 = _2788 * 0.5;
    float _2987 = -_2907;
    float _2989 = _2987 + 1.0;
    bool _2991 = _2983 > 0.0;
    bool _2993 = isnan(_2983);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan(0.0);
    bool _2999 = _2995 || _2997;
    float _3001 = _2983 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3003 = fma(_2828, -0.5, _2985);
    float _3005 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3007 = _2913 + _2788;
    float _3009 = _2826 + _2788;
    out.gl_Position.x = _2826;
    out.gl_Position.y = _2828;
    out.gl_Position.z = _2913;
    out.gl_Position.w = _2788;
    float _3011 = _3005 * _2846;
    float _3013 = -_3005;
    float _3015 = _3013 + 1.0;
    float _3017 = _3007 * 0.5;
    float _3019 = _2857 * _3011;
    float _3021 = _2867 * _3011;
    float _3023 = _3009 * 0.5;
    float _3025 = _3001 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3027 = fma(_2863, _3019, _2851);
    float _3029 = fma(_2865, _3019, _2853);
    float _3031 = _2857 * _3015;
    float _3033 = fma(_2857, _3021, _2855);
    out.m_67.x = _3023;
    out.m_67.y = _3003;
    out.m_67.z = _3017;
    out.m_67.w = _2788;
    out.m_47.x = _3025;
    out.m_69.x = _3027;
    out.m_69.y = _3029;
    out.m_69.z = _3033;
    out.m_69.w = _3031;
    if (_2999)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3035 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3035;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2470 = false;
    bool _1376 = false;
    bool _990 = false;
    bool _848 = false;
    bool _452 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3092 = as_type<float>(_104);
        out.gl_Position.z = _3092;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3161 = as_type<float>(_140);
        out.gl_Position.z = _3161;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _292 + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_308;
    float _348 = _346 + 1.0;
    float _350 = 1.0 / _328;
    float _352 = _344 * _348;
    float _354 = -_344;
    float _356 = _354 + 1.0;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = 1.0 / _332;
    float _366 = _324 * _356;
    float _368 = -_324;
    float _370 = _368 + 1.0;
    float _372 = _296 * _350;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = fma(_360, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = fma(_376, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = fma(_380, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = _312 * _364;
    float _390 = _382 * _366;
    float _392 = _384 * _366;
    float _394 = _386 * _366;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _390);
    float _410 = fma(_398, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = fma(_402, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _414 = fma(_406, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _416 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _392);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _420 = fma(_410, _352, _408);
    float _422 = fma(_412, _352, _416);
    float _424 = fma(_414, _352, _418);
    float _426 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _420);
    float _428 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _422);
    float _430 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _424);
    bool _432 = !_362;
    float _450;
    if (!_432)
    {
        float _434 = in.m_53.x;
        float _436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _438 = _434 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _442 = _440 * _436;
        float _444 = floor(_442);
        float _446 = -_444;
        float _448 = _442 + _446;
        _450 = _448;
        _452 = true;
    }
    else
    {
        float _454 = float(_88);
        float _456 = 1.0 / _454;
        float _458 = _122 * _456;
        _450 = _458;
    }
    _452 = false;
    float _460 = _450;
    float _462 = in.m_51.x;
    float _464 = in.m_51.y;
    float _466 = in.m_51.z;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _470 = _460 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _488 = 1.0 / _474;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _498 = 1.0 / _486;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _502 = _460 + _500;
    bool _504 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _506 = isnan(_460);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    bool _516 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _518 = isnan(_460);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _478;
    float _530 = _502 * _488;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _534 = _460 + _532;
    float _536 = _428 * _464;
    bool _538 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _540 = isnan(_460);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _430 * _466;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _554 = _460 + _552;
    float _556 = 1.0 / _496;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _560 = _460 + _558;
    float _562 = _534 * _498;
    bool _564 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _566 = isnan(_460);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -_548;
    float _578 = _576 + 1.0;
    bool _580 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _582 = 1.0 / _492;
    float _584 = _560 * _528;
    bool _586 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _588 = isnan(_460);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _598;
    float _602 = -_574;
    float _604 = _602 + 1.0;
    float _606 = _574 * _578;
    float _608 = fma(_600, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _610 = 1.0 / _482;
    float _612 = _470 * _556;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _620 = _460 + _618;
    float _622 = _596 * _604;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _628 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _630 = isnan(_460);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = _554 * _582;
    float _642 = fma(_616, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _644 = -_596;
    float _646 = _644 + 1.0;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _656 = fma(_626, _584, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _658 = _514 * _646;
    float _660 = fma(_650, _584, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _662 = _620 * _610;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _664;
    float _668 = -_514;
    float _670 = _668 + 1.0;
    bool _672 = _460 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _674 = isnan(_460);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = fma(_654, _584, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _686 = fma(_666, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _688 = _526 * _670;
    float _690 = -_526;
    float _692 = _690 + 1.0;
    float _694 = -_682;
    float _696 = _694 + 1.0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _702;
    float _706 = _682 * _692;
    float _708 = _638 * _696;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _710;
    float _714 = fma(_700, _640, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _716 = fma(_704, _640, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _718 = _608 * _708;
    float _720 = _642 * _708;
    float _722 = _686 * _708;
    float _724 = -_638;
    float _726 = _724 + 1.0;
    float _728 = fma(_712, _640, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[107].x, _718);
    float _744 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[107].y, _720);
    float _746 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[107].z, _722);
    float _748 = fma(_732, _612, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _750 = fma(_736, _612, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _752 = fma(_740, _612, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _754 = fma(_660, _706, _742);
    float _756 = fma(_656, _706, _744);
    float _758 = fma(_684, _706, _746);
    float _760 = fma(_728, _688, _754);
    float _762 = fma(_714, _688, _756);
    float _764 = fma(_716, _688, _758);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _770;
    float _774 = fma(_748, _658, _760);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _776;
    float _780 = fma(_750, _658, _762);
    float _782 = fma(_752, _658, _764);
    float _784 = fma(_768, _662, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _786 = fma(_772, _662, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _792 = fma(_778, _662, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _802 = fma(_784, _622, _774);
    float _804 = fma(_790, _562, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _806 = fma(_796, _562, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _808 = fma(_800, _562, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _810 = fma(_786, _622, _780);
    float _812 = fma(_792, _622, _782);
    float _814 = fma(_804, _606, _802);
    float _816 = fma(_806, _606, _810);
    float _818 = fma(_808, _606, _812);
    float _820 = _426 * _462;
    float _822 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[113].x, _814);
    float _824 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[113].y, _816);
    float _826 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[113].z, _818);
    bool _828 = !_580;
    float _846;
    if (!_828)
    {
        float _830 = in.m_53.x;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _834 = _830 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _838 = _836 * _832;
        float _840 = floor(_838);
        float _842 = -_840;
        float _844 = _838 + _842;
        _846 = _844;
        _848 = true;
    }
    else
    {
        float _850 = float(_88);
        float _852 = 1.0 / _850;
        float _854 = _122 * _852;
        _846 = _854;
    }
    _848 = false;
    float _856 = _846;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _860 = _856 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _868 = isnan(_856);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _882 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _884 = isnan(_856);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _894;
    bool _898 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _900 = isnan(_856);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = 1.0 / _864;
    float _912 = -_876;
    float _914 = _912 + 1.0;
    bool _916 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _918 = 1.0 / _880;
    float _920 = _896 * _910;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _926 = -_908;
    float _928 = _926 + 1.0;
    float _930 = fma(_920, _860, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _932 = _892 * _914;
    float _934 = -_892;
    float _936 = _934 + 1.0;
    float _938 = _876 * _928;
    float _940 = _924 * _918;
    float _942 = _930 * _932;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _946 = _856 + _944;
    float _948 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _826 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _954 = fma(_940, _946, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _956 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = fma(_954, _938, _952);
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[117].x, _960);
    float _966 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _964 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _958;
    out.m_55.y = _962;
    out.m_55.z = _966;
    out.m_55.w = _968;
    bool _970 = !_916;
    float _988;
    if (!_970)
    {
        float _972 = in.m_53.x;
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _976 = _972 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _980 = _978 * _974;
        float _982 = floor(_980);
        float _984 = -_982;
        float _986 = _980 + _984;
        _988 = _986;
        _990 = true;
    }
    else
    {
        float _992 = float(_88);
        float _994 = 1.0 / _992;
        float _996 = _122 * _994;
        _988 = _996;
    }
    _990 = false;
    float _998 = _988;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = _998 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1020 = 1.0 / _1006;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1030 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1032 = isnan(_998);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = 1.0 / _1024;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1046 = _998 + _1044;
    float _1048 = 1.0 / _1018;
    float _1050 = _1046 * _1020;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1054 = _998 + _1052;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1058 = _998 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1060;
    bool _1064 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1066 = 1.0 / _1010;
    float _1068 = _1054 * _1042;
    bool _1070 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1072 = isnan(_998);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1082;
    float _1086 = fma(_1084, _1050, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1088 = 1.0 / _1014;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1092 = _998 + _1090;
    float _1094 = _1058 * _1048;
    float _1096 = 1.0 / _1028;
    float _1098 = _1092 * _1066;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1102 = _998 + _1100;
    bool _1104 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1106 = isnan(_998);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = -_1080;
    float _1118 = _1116 + 1.0;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1120;
    float _1124 = _1002 * _1088;
    bool _1126 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1128 = isnan(_998);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -_1114;
    float _1140 = _1138 + 1.0;
    float _1142 = _1114 * _1118;
    float _1144 = fma(_1122, _1050, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1146 = _1136 * _1140;
    float _1148 = -_1136;
    float _1150 = _1148 + 1.0;
    float _1152 = _1102 * _1096;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1162 = -_1040;
    float _1164 = _1162 + 1.0;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1170 = fma(_1156, _1050, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1172 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1174 = isnan(_998);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1188 = _1040 * _1150;
    bool _1190 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1192 = isnan(_998);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = fma(_1168, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1204 = _998 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1206 = isnan(_998);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1182 * _1164;
    float _1218 = -_1182;
    float _1220 = _1218 + 1.0;
    float _1222 = fma(_1160, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1224 = fma(_1186, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1226 = -_1214;
    float _1228 = _1226 + 1.0;
    float _1230 = _1214 * _1220;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1236;
    float _1240 = _1200 * _1228;
    float _1242 = -_1200;
    float _1244 = _1242 + 1.0;
    float _1246 = fma(_1234, _1124, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1248 = fma(_1238, _1124, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1250 = fma(_1062, _1124, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1252 = _1144 * _1240;
    float _1254 = _1170 * _1240;
    float _1256 = _1086 * _1240;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1252);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1254);
    float _1266 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1256);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1276 = fma(_1222, _1230, _1264);
    float _1278 = fma(_1224, _1230, _1266);
    float _1280 = fma(_1202, _1230, _1262);
    float _1282 = fma(_1260, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1284 = fma(_1270, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1286 = fma(_1274, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1288;
    float _1292 = fma(_1246, _1216, _1280);
    float _1294 = fma(_1248, _1216, _1276);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1296;
    float _1300 = fma(_1250, _1216, _1278);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1302;
    float _1306 = fma(_1290, _1068, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1308 = fma(_1298, _1068, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1310 = fma(_1282, _1188, _1292);
    float _1312 = fma(_1284, _1188, _1294);
    float _1314 = fma(_1286, _1188, _1300);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1324 = fma(_1304, _1068, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1330 = fma(_1308, _1146, _1310);
    float _1332 = fma(_1318, _1152, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1334 = fma(_1322, _1152, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1336 = fma(_1306, _1146, _1312);
    float _1338 = fma(_1328, _1152, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1340 = fma(_1324, _1146, _1314);
    float _1342 = fma(_1332, _1142, _1330);
    float _1344 = fma(_1334, _1142, _1336);
    float _1346 = fma(_1338, _1142, _1340);
    float _1348 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1342);
    float _1350 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1344);
    float _1352 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1346);
    bool _1354 = !_1064;
    float _1356 = _1284;
    float _1374;
    if (!_1354)
    {
        float _1358 = in.m_53.x;
        float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1362 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1366 = _1364 * _1360;
        float _1368 = floor(_1366);
        float _1370 = -_1368;
        float _1372 = _1366 + _1370;
        _1374 = _1372;
        _1376 = true;
    }
    else
    {
        float _1378 = float(_88);
        float _1380 = 1.0 / _1378;
        float _1382 = _122 * _1380;
        _1374 = _1382;
    }
    _1376 = false;
    float _1384 = _1374;
    float _1386 = in.m_53.w;
    float _1388 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1390 = in.m_53.x;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1394 = _1392 != 0;
    float _1396 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1400 = _1398 != 0;
    float _1402 = in.m_53.y;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1406 = _1404 != 0;
    float _1408 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1396);
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1412 = _1410 != 0;
    float _1414 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1418 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1388);
    float _1420 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1414);
    bool _1422 = _1412;
    if (_1394)
    {
        float _1424 = in.m_53.z;
        _1356 = _1424;
    }
    float _1426 = _1356;
    float _1428 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1408);
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1434 = in.m_57.x;
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1438 = _1386 > 0.5;
    float _1440 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1442 = in.m_57.y;
    float _1444 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1448 = false;
    bool _1450 = _1438;
    if (_1400)
    {
        bool _1452 = _1390 > 0.5;
        _1448 = _1452;
    }
    bool _1454 = _1448;
    float _1456 = -_1416;
    float _1458 = fma(_1444, 2.0, _1456);
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1462 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1464 = 1.0 / _1432;
    bool _1466 = _1402 > 0.5;
    float _1468 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1418);
    float _1470 = fma(_1462, -2.0, _1460);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1474 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1446);
    float _1476 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1478 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1470);
    float _1480 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1472);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1482;
    float _1486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1488 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1420);
    bool _1490 = _1384 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1492 = isnan(_1384);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1504 = _1384 + _1502;
    float _1506 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1474);
    bool _1508 = _1384 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1510 = isnan(_1384);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = -_1442;
    float _1522 = _1520 + 1.0;
    float _1524 = _1484 * _1464;
    float _1526 = -_1500;
    float _1528 = _1526 + 1.0;
    float _1530 = -_122;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1458);
    float _1534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1536 = _1438 ? as_type<int>(_1522) : as_type<int>(_1442);
    float _1538 = fma(_1524, _1504, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1540 = _1442;
    int _1542 = as_type<int>(_1528);
    float _1544 = _1524;
    if (_1394)
    {
        bool _1546 = _1426 > 0.5;
        _1450 = _1546;
    }
    bool _1548 = _1450;
    float _1550 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1480);
    float _1552 = _1406 ? as_type<float>(_1536) : _1442;
    float _1554 = _1518 * _1528;
    float _1556 = _1554;
    float _1558 = _1552;
    if (_1412)
    {
        float _1560 = _1466 ? _1522 : _1442;
        _1540 = _1560;
    }
    float _1562 = _1540;
    float _1564 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1566 = as_type<int>(_1486);
    if (_1394)
    {
        float _1568 = -_1434;
        float _1570 = _1568 + 1.0;
        _1566 = as_type<int>(_1570);
    }
    int _1572 = _1566;
    float _1574 = _1468 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1576 = _1538 * _1554;
    float _1578 = _1574;
    if (_1400)
    {
        float _1580 = -_1434;
        float _1582 = _1580 + 1.0;
        _1542 = as_type<int>(_1582);
    }
    int _1584 = _1542;
    if (!_1394)
    {
        _1556 = _1434;
    }
    float _1586 = _1556;
    float _1588 = _1488 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1590 = _1586;
    if (_1394)
    {
        float _1592 = _1548 ? as_type<float>(_1572) : _1434;
        _1590 = _1592;
    }
    float _1594 = _1590;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1598 = _1574 + _1596;
    if (!_1400)
    {
        _1544 = _1434;
    }
    float _1600 = _1544;
    float _1602 = fma(_1564, _1562, -0.5);
    float _1604 = _1600;
    if (_1400)
    {
        float _1606 = _1454 ? as_type<float>(_1584) : _1434;
        _1604 = _1606;
    }
    float _1608 = _1604;
    float _1610 = -_1518;
    float _1612 = _1610 + 1.0;
    float _1614 = _1428 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1618 = _1588 + _1616;
    float _1620 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1622 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1624 = fma(_1612, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1576);
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1614 + _1626;
    float _1630 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1620);
    float _1632 = fma(_1622, _1608, -0.5);
    float _1634 = -_1478;
    float _1636 = fma(_1550, _1602, _1634);
    float _1638 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1624);
    float _1640 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1630);
    float _1642 = fma(_1506, _1632, _1532);
    float _1644 = _1598 * _1598;
    float _1646 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1650 = _1640 >= 0.0;
    float _1652 = fma(_1618, _1618, _1644);
    float _1654 = _1646 * _1534;
    float _1656 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1658 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1660 = fma(_1628, _1628, _1652);
    float _1662 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = _1636 + 0.5;
    float _1666 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = rsqrt(_1660);
    float _1670 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1672 = as_type<int>(_1636);
    if (_1650)
    {
        _1558 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1674 = _1558;
    float _1676 = _1656 * _1648;
    float _1678 = _1642 + 0.5;
    float _1680 = _1638 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1650)
    {
        float _1682 = _1674 * 5.0;
        _1672 = as_type<int>(_1682);
    }
    int _1684 = _1672;
    if (_1650)
    {
        out.m_47.x = 0.0;
    }
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1686 = _1598 * _1668;
    out.m_61.x = _1678;
    out.m_61.y = _1664;
    out.m_61.z = _1654;
    out.m_61.w = _1676;
    float _1688 = _1618 * _1668;
    if (_1650)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5735 = as_type<float>(_1684);
        out.gl_Position.z = _5735;
    }
    out.m_63.x = _1662;
    out.m_63.y = _1670;
    out.m_63.z = _1666;
    out.m_63.w = _1680;
    if (_1650)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1690 = -_1686;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1574);
    float _1694 = _1628 * _1668;
    float _1696 = -_1688;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1588);
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1702 = _1692 + _1700;
    float _1704 = -_1694;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1710 = _1698 + _1708;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1706 + _1714;
    float _1718 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1712);
    float _1720 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1718);
    bool _1722 = _1720 >= 0.0;
    float _1724 = _1716;
    if (_1722)
    {
        _1724 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1726 = _1724;
    int _1728 = as_type<int>(_1726);
    if (_1722)
    {
        out.m_47.x = 0.0;
    }
    if (_1722)
    {
        float _1730 = _1726 * 5.0;
        _1728 = as_type<int>(_1730);
    }
    int _1732 = _1728;
    if (_1722)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5834 = as_type<float>(_1732);
        out.gl_Position.z = _5834;
    }
    if (_1722)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1734 = -_1574;
    float _1736 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1738 = -_1588;
    float _1740 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1736 * _1736;
    float _1744 = -_1614;
    float _1746 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1750 = -_1688;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1618);
    float _1754 = fma(_1740, _1740, _1742);
    float _1756 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1748);
    float _1758 = -_1694;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1628);
    float _1762 = fma(_1746, _1746, _1754);
    float _1764 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1756);
    float _1766 = rsqrt(_1762);
    float _1768 = rsqrt(_1764);
    float _1770 = _1740 * _1766;
    float _1772 = _1736 * _1766;
    float _1774 = _1746 * _1766;
    float _1776 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1778 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1780 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1782 = _1776 * _1770;
    float _1784 = _1778 * _1774;
    float _1786 = _1780 * _1772;
    float _1788 = -_1782;
    float _1790 = fma(_1778, _1772, _1788);
    float _1792 = -_1784;
    float _1794 = fma(_1780, _1770, _1792);
    float _1796 = -_1786;
    float _1798 = fma(_1776, _1774, _1796);
    float _1800 = -_1574;
    float _1802 = _1800 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1804 = _1770 * _1790;
    float _1806 = _1774 * _1794;
    float _1808 = -_1588;
    float _1810 = _1808 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1812 = _1772 * _1798;
    float _1814 = -_1804;
    float _1816 = fma(_1774, _1798, _1814);
    float _1818 = -_1806;
    float _1820 = fma(_1772, _1790, _1818);
    float _1822 = -_1812;
    float _1824 = fma(_1770, _1794, _1822);
    float _1826 = _1802 * _1816;
    float _1828 = _1794 * _1802;
    float _1830 = fma(_1810, _1820, _1826);
    float _1832 = -_1614;
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1836 = fma(_1798, _1810, _1828);
    float _1838 = fma(_1834, _1824, _1830);
    float _1840 = fma(_1790, _1834, _1836);
    float _1842 = -_1686;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1598);
    float _1846 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1848 = _1838 * _1838;
    float _1850 = _1844 * _1844;
    float _1852 = fma(_1840, _1840, _1848);
    float _1854 = fma(_1752, _1752, _1850);
    float _1856 = rsqrt(_1852);
    float _1858 = _1840 * _1856;
    float _1860 = _1838 * _1856;
    float _1862 = fma(_1760, _1760, _1854);
    float _1864 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1866 = abs(_1858);
    float _1868 = abs(_1860);
    float _1870 = precise::max(_1866, _1868);
    float _1872 = sqrt(_1862);
    bool _1874 = _1870 >= 16.0;
    float _1876 = in.m_65.x;
    float _1878 = in.m_65.y;
    float _1880 = in.m_65.z;
    float _1882 = _1860;
    float _1884 = _1858;
    if (_1874)
    {
        float _1886 = _1860 * 0.0625;
        _1882 = _1886;
    }
    float _1888 = _1882;
    if (_1874)
    {
        float _1890 = _1858 * 0.0625;
        _1884 = _1890;
    }
    float _1892 = _1884;
    float _1894 = _1668 * _1872;
    float _1896 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1898 = abs(_1888);
    bool _1900 = _1898 != 0.0;
    bool _1902 = isnan(_1898);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan(0.0);
    bool _1908 = _1904 || _1906;
    float _1910 = _1894 * _1896;
    float _1912 = abs(_1892);
    bool _1914 = _1912 == 0.0;
    float _1916 = _1894 * _1864;
    float _1918 = abs(_1892);
    bool _1920 = _1918 == 0.0;
    bool _1922 = !_1908;
    bool _1924 = _1920 && _1922;
    float _1926 = _1894 * _1846;
    float _1928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1878);
    float _1930 = _1772 * _1772;
    float _1932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1876);
    float _1934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1880);
    float _1936 = fma(_1770, _1770, _1930);
    float _1938 = _1926 * _1932;
    float _1940 = fma(_1774, _1774, _1936);
    int _1942 = as_type<int>(_1880);
    if (_1924)
    {
        bool _1944 = as_type<int>(_1892) >= 0;
        _1422 = _1944;
    }
    bool _1946 = _1422;
    int _1948 = _1946 ? (-1) : 0;
    if (_1924)
    {
        int _1950 = _1946 ? 0 : 1078530011;
        _1942 = _1950;
    }
    int _1952 = _1942;
    int _1954 = _1952;
    if (_1924)
    {
        int _1956 = int(0x80000000) & as_type<int>(_1888);
        int _1958 = _1952 | _1956;
        _1954 = _1958;
    }
    int _1960 = _1954;
    bool _1962 = !_1908;
    bool _1964 = _1962 && _1914;
    int _1966 = _1960;
    float _1968 = as_type<float>(_1960);
    if (!_1964)
    {
        float _1970 = abs(_1888);
        bool _1972 = _1970 != as_type<float>(0x7f800000u /* inf */);
        bool _1974 = isnan(_1970);
        bool _1976 = _1972 || _1974;
        bool _1978 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1980 = _1976 || _1978;
        float _1982 = abs(_1892);
        bool _1984 = _1982 == as_type<float>(0x7f800000u /* inf */);
        float _1986 = abs(_1892);
        bool _1988 = _1986 == as_type<float>(0x7f800000u /* inf */);
        bool _1990 = !_1980;
        bool _1992 = _1988 && _1990;
        if (_1992)
        {
            bool _1994 = as_type<int>(_1892) >= 0;
            _1948 = _1994 ? (-1) : 0;
        }
        int _1996 = _1948;
        if (_1992)
        {
            _1966 = 1075235812;
        }
        int _1998 = _1966;
        int _2000 = _1998;
        if (_1992)
        {
            int _2002 = ~_1996;
            int _2004 = (_2002 != 0) ? _1998 : 1061752795;
            _2000 = _2004;
        }
        int _2006 = _2000;
        float _2008 = as_type<float>(_2006);
        if (_1992)
        {
            int _2010 = int(0x80000000) & as_type<int>(_1888);
            int _2012 = _2006 | _2010;
            _2008 = as_type<float>(_2012);
        }
        float _2014 = _2008;
        bool _2016 = !_1980;
        bool _2018 = _2016 && _1984;
        _1968 = _2014;
        if (!_2018)
        {
            float _2020 = abs(_1888);
            float _2022 = abs(_1892);
            float _2024 = precise::max(_2020, _2022);
            float _2026 = abs(_1888);
            float _2028 = abs(_1892);
            float _2030 = precise::min(_2026, _2028);
            float _2032 = 1.0 / _2024;
            float _2034 = abs(_1888);
            float _2036 = abs(_1892);
            bool _2038 = _2034 > _2036;
            bool _2040 = as_type<int>(_1892) >= 0;
            float _2042 = _2030 * _2032;
            float _2044 = abs(_1888);
            float _2046 = abs(_1892);
            float _2048 = _2044 + _2046;
            int _2050 = as_type<int>(_1888) & int(0x80000000);
            float _2052 = _2042 * _2042;
            bool _2054 = _2048 > as_type<float>(0x7f800000u /* inf */);
            bool _2056 = isnan(_2048);
            bool _2058 = _2054 || _2056;
            bool _2060 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2062 = _2058 || _2060;
            float _2064 = _2052 + 11.33538818359375;
            float _2066 = fma(_2052, _2064, 28.84246826171875);
            float _2068 = fma(_2052, _2066, 19.6966705322265625);
            float _2070 = fma(_2052, -0.82336294651031494140625, -5.674867153167724609375);
            float _2072 = fma(_2052, _2070, -6.565555095672607421875);
            float _2074 = 1.0 / _2068;
            float _2076 = _2052 * _2072;
            float _2078 = _2042 * _2076;
            float _2080 = fma(_2078, _2074, _2042);
            float _2082 = _2080;
            _1968 = _2048;
            if (_2038)
            {
                float _2084 = -_2080;
                float _2086 = _2084 + 1.57079637050628662109375;
                _2082 = _2086;
            }
            float _2088 = _2082;
            int _2090 = as_type<int>(_2088);
            if (!_2040)
            {
                float _2092 = -_2088;
                float _2094 = _2092 + 3.1415927410125732421875;
                _2090 = as_type<int>(_2094);
            }
            int _2096 = _2090;
            if (!_2062)
            {
                int _2098 = _2050 | _2096;
                _1968 = as_type<float>(_2098);
            }
        }
    }
    float _2100 = _1968;
    float _2102 = _2100 + 1.57079637050628662109375;
    float _2104 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2106 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2110 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _2108;
    float _2112 = _1916 * _1928;
    float _2114 = _2102 * 0.15915493667125701904296875;
    float _2116 = _2106 * _2106;
    float _2118 = rsqrt(_1940);
    float _2120 = _1910 * _1934;
    float _2122 = fma(_2110, _2110, _2116);
    float _2124 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2126 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2128 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2130 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _2130;
    float _2134 = _2114 * 6.283185482025146484375;
    float _2136 = cos(_2134);
    float _2138 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2124);
    float _2140 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2126);
    float _2142 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    float _2144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2148 = fma(_2132, _2132, _2122);
    float _2150 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2138);
    float _2152 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2140);
    float _2154 = _2114 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    float _2158 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2142);
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2162 = _2160 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2164 = _2146 * _2146;
    float _2166 = _1770 * _2118;
    float _2168 = _1774 * _2118;
    float _2170 = _1772 * _2118;
    float _2172 = fma(_2162, _2162, _2164);
    float _2174 = sqrt(_2148);
    float _2176 = -_2136;
    float _2178 = _2176 + 1.0;
    float _2180 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2184 = _2182 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2186 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2188 = _2166 * _2178;
    float _2190 = _2170 * _2178;
    float _2192 = _2168 * _2168;
    float _2194 = _2168 * _2156;
    float _2196 = _2166 * _2156;
    float _2198 = _2170 * _2156;
    float _2200 = fma(_2184, _2184, _2172);
    float _2202 = -_2194;
    float _2204 = fma(_2170, _2188, _2202);
    float _2206 = fma(_2168, _2190, _2196);
    float _2208 = fma(_2166, _2188, _2136);
    float _2210 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2212 = _2186 * _2204;
    float _2214 = -_2198;
    float _2216 = fma(_2168, _2188, _2214);
    float _2218 = _2186 * _2206;
    float _2220 = fma(_2178, _2192, _2136);
    float _2222 = _2174 * 0.066666670143604278564453125;
    float _2224 = fma(_2180, _2208, _2212);
    float _2226 = precise::max(_2174, 15.0);
    float _2228 = fma(_2180, _2216, _2218);
    float _2230 = rsqrt(_2200);
    float _2232 = fma(_2168, _2188, _2198);
    float _2234 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _2236 = _2234 + 1.0;
    float _2238 = precise::max(_2222, 1.0);
    float _2240 = fma(_2210, _2232, _2224);
    float _2242 = precise::min(_2226, 30.0);
    float _2244 = fma(_2210, _2220, _2228);
    float _2246 = precise::min(_2238, 2.0);
    float _2248 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, 0.3499999940395355224609375, _2236);
    float _2250 = _1588 + _2240;
    float _2252 = fma(_2242, 0.066666670143604278564453125, -1.0);
    float _2254 = _1614 + _2244;
    float _2256 = _2246 * _2248;
    float _2258 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2260 = _2250 + _2258;
    float _2262 = _2252 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _2264 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2266 = _2254 + _2264;
    float _2268 = fma(_2170, _2190, _2136);
    float _2270 = fma(_2260, _2256, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _2272 = _2230 * _2262;
    float _2274 = fma(_2266, _2256, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _2276 = fma(_2170, _2188, _2194);
    float _2278 = _2186 * _2268;
    float _2280 = -_2272;
    float _2282 = fma(_2162, _2280, _2270);
    float _2284 = -_2272;
    float _2286 = fma(_2184, _2284, _2274);
    float _2288 = -_2196;
    float _2290 = fma(_2168, _2190, _2288);
    float _2292 = fma(_2180, _2276, _2278);
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2296 = _2282 + _2294;
    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2300 = _2286 + _2298;
    float _2302 = fma(_2210, _2290, _2292);
    float _2304 = _2296 * _2296;
    float _2306 = _2300 * _2300;
    float _2308 = _1574 + _2302;
    float _2310 = _2304 + _2306;
    float _2312 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2314 = _2308 + _2312;
    float _2316 = sqrt(_2310);
    float _2318 = fma(_2314, _2256, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _2320 = -_2272;
    float _2322 = fma(_2146, _2320, _2318);
    bool _2324 = _2316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2326 = _2180;
    float _2328 = _2146;
    float _2330 = _2292;
    float _2332 = _2168;
    if (!_2324)
    {
        _1578 = _2306;
    }
    float _2334 = _1578;
    float _2336 = _2334;
    if (!_2324)
    {
        _2326 = _2304;
    }
    float _2338 = _2326;
    float _2340 = _2338;
    if (!_2324)
    {
        _2328 = _2282;
    }
    float _2342 = _2328;
    float _2344 = _2342;
    if (!_2324)
    {
        _2330 = _2286;
    }
    float _2346 = _2330;
    float _2348 = _2346;
    if (!_2324)
    {
        _2332 = _2322;
    }
    float _2350 = _2332;
    bool _2352 = !_2324;
    float _2354 = _2350;
    if (!_2352)
    {
        float _2356 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2360 = _2316 + _2358;
        float _2362 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2364 = rsqrt(_2310);
        float _2366 = _2360 * _2356;
        float _2368 = _2366 * 0.15915493667125701904296875;
        float _2370 = _2368 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        float _2374 = _2368 * 6.283185482025146484375;
        float _2376 = cos(_2374);
        float _2378 = fma(_2372, _2362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2380 = _2364 * _2378;
        float _2382 = _2376 + (-1.0);
        float _2384 = fma(_2296, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2386 = fma(_2300, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2388 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2392 = _2384 + _2390;
        float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2396 = _2386 + _2394;
        float _2398 = fma(_2322, _2376, _2388);
        float _2400 = _2392 * _2392;
        float _2402 = _2396 * _2396;
        _2354 = _2398;
        _2340 = _2400;
        _2336 = _2402;
        _2344 = _2384;
        _2348 = _2386;
    }
    float _2404 = _2354;
    float _2406 = _2340;
    float _2408 = _2336;
    float _2410 = _2344;
    float _2412 = _2348;
    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2416 = _2404 + _2414;
    out.m_55.x = _958;
    out.m_55.y = _962;
    out.m_55.z = _966;
    out.m_55.w = _968;
    float _2418 = fma(_2416, _2416, _2406);
    out.m_63.x = _1662;
    out.m_63.y = _1670;
    out.m_63.z = _1666;
    out.m_63.w = _1680;
    float _2420 = _2418 + _2408;
    float _2422 = sqrt(_2420);
    bool _2424 = _2422 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2426 = isnan(_2422);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2432 = _2428 || _2430;
    float _2434 = _2418;
    if (!_2432)
    {
        _2434 = 1.0;
    }
    float _2436 = _2434;
    bool _2438 = !_2432;
    float _2440 = _2436;
    if (!_2438)
    {
        bool _2442 = _2422 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2444 = isnan(_2422);
        bool _2446 = _2442 || _2444;
        bool _2448 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2450 = _2446 || _2448;
        if (!_2450)
        {
            float _2452 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2454 = _2422 + _2452;
            float _2456 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2458 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2456;
            float _2460 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2464 = 1.0 / _2458;
            float _2466 = _2454 * _2464;
            float _2468 = fma(_2466, _2462, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2440 = _2468;
            _2470 = true;
        }
        else
        {
            bool _2472 = _2422 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2474 = isnan(_2422);
            bool _2476 = _2472 || _2474;
            bool _2478 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2480 = _2476 || _2478;
            if (!_2480)
            {
                float _2482 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2484 = _2422 + _2482;
                float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2488 = _2486 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2490 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2492 = _2490 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2494 = 1.0 / _2488;
                float _2496 = _2484 * _2494;
                float _2498 = fma(_2496, _2492, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2440 = _2498;
                _2470 = true;
            }
            else
            {
                _2440 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2470 = false;
    float _2500 = _2440;
    float _2502 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2504 = _2404 + _2502;
    float _2506 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2508 = _2410 + _2506;
    float _2510 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2512 = _2412 + _2510;
    float _2514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2516 = fma(_2504, _2500, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2518 = fma(_2508, _2500, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2520 = fma(_2512, _2500, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2522 = -_1686;
    float _2524 = fma(_2522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2516);
    float _2526 = -_1688;
    float _2528 = fma(_2526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2518);
    float _2530 = -_1694;
    float _2532 = fma(_2530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2520);
    float _2534 = precise::max(0.0, _2514);
    float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2538 = _2524 + _2536;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2542 = _2528 + _2540;
    float _2544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2546 = _2532 + _2544;
    float _2548 = _2538 * _2538;
    float _2550 = fma(_2542, _2542, _2548);
    float _2552 = fma(_2546, _2546, _2550);
    float _2554 = rsqrt(_2552);
    float _2556 = sqrt(_2552);
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2560 = _2542 * _2558;
    float _2562 = _2546 * _2558;
    float _2564 = -_2558;
    float _2566 = -_2534;
    float _2568 = fma(_2538, _2564, _2566);
    float _2570 = _2560 * _2560;
    float _2572 = _2562 * _2562;
    float _2574 = _2570 + _2572;
    float _2576 = sqrt(_2574);
    bool _2578 = _2576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2582 = _2576 + _2580;
    float _2584 = _962;
    float _2586 = _2538;
    float _2588 = _2546;
    float _2590 = _2582;
    float _2592 = _2508;
    float _2594 = _2560;
    if (_2578)
    {
        float _2596 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2584 = _2596;
    }
    float _2598 = _2584;
    if (_2578)
    {
        float _2600 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2586 = _2600;
    }
    float _2602 = _2586;
    float _2604 = _2602;
    if (_2578)
    {
        float _2606 = rsqrt(_2574);
        _2588 = _2606;
    }
    float _2608 = _2588;
    float _2610 = _2598;
    float _2612 = _2608;
    if (_2578)
    {
        float _2614 = _2582 * _2598;
        _2590 = _2614;
    }
    float _2616 = _2590;
    if (_2578)
    {
        float _2618 = _2616 * 0.15915493667125701904296875;
        _2610 = _2618;
    }
    float _2620 = _2610;
    float _2622 = _2616;
    float _2624 = _2620;
    if (_2578)
    {
        float _2626 = _2620 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        _2622 = _2628;
    }
    float _2630 = _2622;
    float _2632 = _958;
    if (_2578)
    {
        float _2634 = _2620 * 6.283185482025146484375;
        float _2636 = cos(_2634);
        _2632 = _2636;
    }
    float _2638 = _2632;
    float _2640 = _2630;
    if (_2578)
    {
        float _2642 = fma(_2630, _2602, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2604 = _2642;
    }
    float _2644 = _2604;
    float _2646 = _2644;
    if (_2578)
    {
        float _2648 = _2608 * _2644;
        _2592 = _2648;
    }
    float _2650 = _2592;
    if (!_2578)
    {
        _2646 = _2568;
    }
    float _2652 = _2646;
    float _2654 = _2652;
    if (!_2578)
    {
        _2612 = _2570;
    }
    float _2656 = _2612;
    float _2658 = _2656;
    float _2660 = _2638;
    if (_2578)
    {
        float _2662 = _2638 + (-1.0);
        _2640 = _2662;
    }
    float _2664 = _2640;
    float _2666 = _2664;
    if (_2578)
    {
        float _2668 = _2560 * _2650;
        _2594 = _2668;
    }
    float _2670 = _2594;
    if (_2578)
    {
        float _2672 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2624 = _2672;
    }
    float _2674 = _2624;
    if (!_2578)
    {
        _2666 = _2562;
    }
    float _2676 = _2666;
    float _2678 = _2676;
    if (_2578)
    {
        float _2680 = _2562 * _2650;
        _2678 = _2680;
    }
    float _2682 = _2678;
    if (_2578)
    {
        float _2684 = _2670 * _2670;
        _2658 = _2684;
    }
    float _2686 = _2658;
    if (_2578)
    {
        float _2688 = fma(_2568, _2638, _2674);
        _2654 = _2688;
    }
    float _2690 = _2654;
    if (!_2578)
    {
        _2660 = _2572;
    }
    float _2692 = _2660;
    float _2694 = _2692;
    if (_2578)
    {
        float _2696 = _2682 * _2682;
        _2694 = _2696;
    }
    float _2698 = _2694;
    float _2700 = fma(_2690, _2690, _2686);
    float _2702 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2704 = _2700 + _2698;
    float _2706 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2710 = fma(_2556, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2708);
    float _2712 = precise::clamp(_2710, 0.0, 1.0);
    float _2714 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2716 = rsqrt(_2704);
    float _2718 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2706);
    float _2720 = -_2712;
    float _2722 = _2720 + 1.0;
    float _2724 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2714);
    float _2726 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2718);
    float _2728 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2730 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2724);
    float _2732 = abs(_2722);
    float _2734 = log2(_2732);
    float _2736 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2738 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2728);
    float _2740 = _2730 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2742 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2744 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2746 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2738);
    float _2748 = _2716 * _2690;
    float _2750 = -_2744;
    float _2752 = fma(_2750, _2702, 1.0);
    float _2754 = _2746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2756 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2758 = _2716 * _2670;
    float _2760 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2742);
    float _2762 = _2716 * _2682;
    float _2764 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2756);
    float _2766 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2768 = fma(_2532, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2760);
    float _2770 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2772 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2764);
    float _2774 = -_2766;
    float _2776 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2774);
    float _2778 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2780 = log2(_2752);
    float _2782 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2784 = -_2762;
    float _2786 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2776);
    float _2788 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2772);
    float _2790 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2792 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2782);
    float _2794 = fma(_2786, -0.5, 0.5);
    float _2796 = fma(_2786, 0.5, 0.5);
    float _2798 = exp2(_2770);
    float _2800 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2790);
    float _2802 = _2748 + 1.0;
    float _2804 = fma(_2796, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2806 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2792);
    float _2808 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2800);
    float _2810 = fma(_2796, _2804, -0.212114393711090087890625);
    float _2812 = 1.0 / _2788;
    float _2814 = _2780 * 0.693147182464599609375;
    float _2816 = fma(_2796, _2810, 1.570728778839111328125);
    float _2818 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2820 = sqrt(_2794);
    float _2822 = -_2748;
    float _2824 = fma(_2798, _2802, _2822);
    float _2826 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2808);
    float _2828 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2806);
    float _2830 = fma(_2824, 0.5, 0.5);
    float _2832 = _2826 * _2812;
    float _2834 = _2828 * _2812;
    float _2836 = fma(_2832, 0.5, 0.5);
    float _2838 = fma(_2834, -0.5, 0.5);
    float _2840 = _2820 * 0.636619746685028076171875;
    float _2842 = -_2816;
    float _2844 = fma(_2840, _2842, 1.0);
    float3 _7649 = float3(_2836, _2838, _2818);
    float _2846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7649, float3(0.0), isnan(_7649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7649, float3(0.0), isnan(_7649)), level(0.0)).x;
    float3 _7660 = float3(_2836, _2838, _2818);
    float4 _2849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7660, float3(0.0), isnan(_7660)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7660, float3(0.0), isnan(_7660)), level(0.0)).xyzw;
    float _2851 = _2849.x;
    float _2853 = _2849.y;
    float _2855 = _2849.z;
    float _2857 = _2849.w;
    float2 _7677 = float2(_2844, _2830);
    float3 _2861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7677, float2(0.0), isnan(_7677)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7677, float2(0.0), isnan(_7677)), level(0.0)).xyz;
    float _2863 = _2861.x;
    float _2865 = _2861.y;
    float _2867 = _2861.z;
    float _2869 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2871 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2869);
    float _2873 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2875 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2871);
    float _2877 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2873);
    bool _2879 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2883 = _2879 || _2881;
    bool _2885 = isnan(0.5);
    bool _2887 = _2883 || _2885;
    float _2889 = _2875 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2891 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2877);
    float _2893 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2895 = _2740 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2897 = 1.0 / _2889;
    float _2899 = _2891 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2901 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2895);
    float _2903 = _2899 + _2889;
    float _2905 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2901);
    float _2907 = exp2(_2893);
    float _2909 = _2895;
    if (_2887)
    {
        _2909 = 1.0;
    }
    float _2911 = _2909;
    float _2913 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2905);
    float _2915 = _2903 * _2897;
    float _2917 = _2915 * 0.5;
    float _2919 = _2911;
    if (!_2887)
    {
        float _2921 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2925 = fma(_2917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2923);
        float _2927 = _2921 * 0.15915493667125701904296875;
        float _2929 = _2927 * 6.283185482025146484375;
        float _2931 = cos(_2929);
        float _2933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2935 = _2933 * 0.15915493667125701904296875;
        float _2937 = _2927 * 6.283185482025146484375;
        float _2939 = sin(_2937);
        float _2941 = 1.0 / _2931;
        float _2943 = _2935 * 6.283185482025146484375;
        float _2945 = cos(_2943);
        float _2947 = _2939 * _2941;
        float _2949 = 1.0 / _2925;
        float _2951 = _2945 * _2947;
        float _2953 = _2935 * 6.283185482025146484375;
        float _2955 = sin(_2953);
        float _2957 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2959 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2957;
        float _2961 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2963 = _2949 * _2961;
        float _2965 = 1.0 / _2951;
        float _2967 = 1.0 / _2959;
        float _2969 = _2955 * _2965;
        float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2973 = fma(_2969, _2963, _2971);
        float _2975 = _2973 * _2967;
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        float _2979 = -_2977;
        float _2981 = _2979 + 1.0;
        _2919 = _2981;
    }
    float _2983 = _2919;
    float _2985 = _2788 * 0.5;
    float _2987 = -_2907;
    float _2989 = _2987 + 1.0;
    bool _2991 = _2983 > 0.0;
    bool _2993 = isnan(_2983);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan(0.0);
    bool _2999 = _2995 || _2997;
    float _3001 = _2983 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3003 = fma(_2828, -0.5, _2985);
    float _3005 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3007 = _2913 + _2788;
    float _3009 = _2826 + _2788;
    out.gl_Position.x = _2826;
    out.gl_Position.y = _2828;
    out.gl_Position.z = _2913;
    out.gl_Position.w = _2788;
    float _3011 = _3005 * _2846;
    float _3013 = -_3005;
    float _3015 = _3013 + 1.0;
    float _3017 = _3007 * 0.5;
    float _3019 = _2857 * _3011;
    float _3021 = _2867 * _3011;
    float _3023 = _3009 * 0.5;
    float _3025 = _3001 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3027 = fma(_2863, _3019, _2851);
    float _3029 = fma(_2865, _3019, _2853);
    float _3031 = _2857 * _3015;
    float _3033 = fma(_2857, _3021, _2855);
    out.m_67.x = _3023;
    out.m_67.y = _3003;
    out.m_67.z = _3017;
    out.m_67.w = _2788;
    out.m_47.x = _3025;
    out.m_69.x = _3027;
    out.m_69.y = _3029;
    out.m_69.z = _3033;
    out.m_69.w = _3031;
    if (_2999)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3035 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3035;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

