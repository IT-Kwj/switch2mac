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
    texture2d<float> vp_t_tcb_10 [[id(5)]];
    sampler vp_t_tcb_10Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_10Smplr_w [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_71 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1008 = false;
    bool _864 = false;
    bool _476 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    float _106 = _104;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3942 = as_type<float>(_112);
        out.gl_Position.z = _3942;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_94);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4012 = as_type<float>(_150);
        out.gl_Position.z = _4012;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_51.w;
    float _154 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _168, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _174);
    float _270 = fma(_264, _152, _172);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    int _276 = as_type<int>(_272);
    float _294;
    if (!_274)
    {
        float _278 = in.m_53.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_94);
        float _300 = 1.0 / _298;
        float _302 = _130 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _340;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _376 = 1.0 / _344;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = in.m_51.x;
    float _386 = in.m_51.y;
    float _388 = in.m_51.z;
    float _390 = _308 * _362;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = fma(_372, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _402 = fma(_394, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = _324 * _376;
    float _408 = _400 * _378;
    float _410 = _402 * _378;
    float _412 = _404 * _378;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _428 = fma(_416, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_420, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _434 = fma(_424, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _436 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _412);
    float _438 = fma(_428, _364, _426);
    float _440 = fma(_430, _364, _432);
    float _442 = fma(_434, _364, _436);
    float _444 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _438);
    float _446 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _440);
    float _448 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _442);
    float _450 = _444 * _384;
    float _452 = _446 * _386;
    float _454 = _448 * _388;
    bool _456 = !_374;
    float _474;
    if (!_456)
    {
        float _458 = in.m_53.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_94);
        float _480 = 1.0 / _478;
        float _482 = _130 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _502 = 1.0 / _488;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _512 = 1.0 / _492;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _516 = _484 + _514;
    bool _518 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _520 = isnan(_484);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = 1.0 / _496;
    float _532 = _516 * _502;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _484 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _540 = _484 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _544 = _484 + _542;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _548 = 1.0 / _506;
    float _550 = _536 * _512;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _554 = _484 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _558 = _484 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _560;
    float _564 = 1.0 / _500;
    float _566 = _540 * _530;
    bool _568 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _570 = isnan(_484);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = fma(_562, _532, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _582 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _584 = isnan(_484);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _510;
    float _596 = _554 * _548;
    float _598 = -_578;
    float _600 = _598 + 1.0;
    float _602 = -_592;
    float _604 = _602 + 1.0;
    float _606 = _592 * _600;
    float _608 = _544 * _564;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _614;
    float _618 = fma(_612, _532, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _620 = fma(_616, _532, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _622 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _624 = isnan(_484);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _558 * _594;
    bool _636 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _638 = isnan(_484);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_646;
    float _650 = _648 + 1.0;
    float _652 = _646 * _604;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _658 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _660 = isnan(_484);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _632 * _650;
    bool _672 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _674 = isnan(_484);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_632;
    float _686 = _684 + 1.0;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _696 = fma(_656, _550, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _698 = _528 * _686;
    float _700 = -_682;
    float _702 = _700 + 1.0;
    float _704 = -_528;
    float _706 = _704 + 1.0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _708;
    float _712 = fma(_690, _550, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _714 = _668 * _702;
    float _716 = _682 * _706;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _722;
    float _726 = fma(_694, _550, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _728 = _618 * _714;
    float _730 = _580 * _714;
    float _732 = -_668;
    float _734 = _732 + 1.0;
    float _736 = fma(_720, _566, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _738 = fma(_724, _566, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _740 = fma(_710, _566, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _742 = _620 * _714;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _756 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].z, _730);
    float _758 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].x, _728);
    float _760 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].y, _742);
    float _762 = fma(_746, _608, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _764 = fma(_750, _608, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _766 = fma(_754, _608, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _768 = fma(_726, _716, _756);
    float _770 = fma(_712, _716, _758);
    float _772 = fma(_696, _716, _760);
    float _774 = fma(_736, _698, _770);
    float _776 = fma(_740, _698, _768);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _782;
    float _786 = fma(_738, _698, _772);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _788;
    float _792 = fma(_762, _670, _774);
    float _794 = fma(_766, _670, _776);
    float _796 = fma(_780, _596, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _798 = fma(_784, _596, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _808 = fma(_790, _596, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _810 = fma(_764, _670, _786);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _816 = fma(_802, _634, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _818 = fma(_806, _634, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _820 = fma(_796, _652, _792);
    float _822 = fma(_814, _634, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _824 = fma(_798, _652, _810);
    float _826 = fma(_808, _652, _794);
    float _828 = fma(_816, _606, _820);
    float _830 = fma(_818, _606, _824);
    float _832 = fma(_822, _606, _826);
    float _834 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[113].x, _828);
    float _836 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[113].y, _830);
    float _838 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[113].z, _832);
    bool _840 = !_546;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _862;
    if (!_840)
    {
        float _846 = in.m_53.x;
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _850 = _846 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _854 = _852 * _848;
        float _856 = floor(_854);
        float _858 = -_856;
        float _860 = _854 + _858;
        _862 = _860;
        _864 = true;
    }
    else
    {
        float _866 = float(_94);
        float _868 = 1.0 / _866;
        float _870 = _130 * _868;
        _862 = _870;
    }
    _864 = false;
    float _872 = _862;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _876 = _872 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _882 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_872);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _898 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _900 = isnan(_872);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _910;
    bool _914 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _916 = isnan(_872);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = 1.0 / _880;
    float _928 = -_892;
    float _930 = _928 + 1.0;
    bool _932 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _934 = 1.0 / _896;
    float _936 = _912 * _926;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _942 = -_924;
    float _944 = _942 + 1.0;
    float _946 = fma(_936, _876, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _948 = _908 * _930;
    float _950 = -_908;
    float _952 = _950 + 1.0;
    float _954 = _892 * _944;
    float _956 = _940 * _934;
    float _958 = _946 * _948;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _962 = _872 + _960;
    float _964 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _966 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[115].x, _958);
    float _968 = fma(_956, _962, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _970 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _972 = fma(_968, _954, _966);
    float _974 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _976 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[117].x, _972);
    float _982 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _980 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _976;
    out.m_55.y = _982;
    out.m_55.z = _978;
    out.m_55.w = _984;
    bool _986 = !_932;
    int _988 = as_type<int>(_958);
    float _1006;
    if (!_986)
    {
        float _990 = in.m_53.x;
        float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _994 = _990 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _998 = _996 * _992;
        float _1000 = floor(_998);
        float _1002 = -_1000;
        float _1004 = _998 + _1002;
        _1006 = _1004;
        _1008 = true;
    }
    else
    {
        float _1010 = float(_94);
        float _1012 = 1.0 / _1010;
        float _1014 = _130 * _1012;
        _1006 = _1014;
        _102 = _1010;
    }
    _1008 = false;
    float _1016 = _1006;
    float _1018 = _102;
    float _1020 = in.m_57.x;
    float _1022 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1026 = _1024 != 0;
    float _1028 = in.m_53.w;
    float _1030 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1032 = in.m_57.y;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1036 = _1034 != 0;
    float _1038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1040 = in.m_53.z;
    float _1042 = _924;
    float _1044 = _1018;
    int _1046 = as_type<int>(_1030);
    if (_1026)
    {
        float _1048 = in.m_53.x;
        _1042 = _1048;
    }
    float _1050 = _1042;
    float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1054 = in.m_53.y;
    if (_1026)
    {
        float _1056 = -_1020;
        float _1058 = _1056 + 1.0;
        _988 = as_type<int>(_1058);
    }
    int _1060 = _988;
    if (!_1026)
    {
        _1044 = _1020;
    }
    float _1062 = _1044;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1066 = _1028 > 0.5;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1070 = _1040 > 0.5;
    bool _1072 = false;
    float _1074 = _1062;
    if (_1026)
    {
        bool _1076 = _1050 > 0.5;
        _1072 = _1076;
    }
    bool _1078 = _1072;
    if (_1026)
    {
        float _1080 = _1078 ? as_type<float>(_1060) : _1020;
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = -_1032;
    float _1086 = _1084 + 1.0;
    bool _1088 = _1054 > 0.5;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1092 = _1090 != 0;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1096 = _1094 != 0;
    int _1098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1100 = _1098 != 0;
    int _1102 = _1066 ? as_type<int>(_1086) : as_type<int>(_1032);
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1106 = _1104 != 0;
    float _1108 = _1096 ? as_type<float>(_1102) : _1032;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1110;
    int _1114 = _1070 ? as_type<int>(_1086) : as_type<int>(_1032);
    float _1116 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1118 = _1088 ? as_type<int>(_1086) : as_type<int>(_1032);
    float _1120 = 1.0 / _1112;
    float _1122 = _1036 ? as_type<float>(_1114) : _1032;
    float _1124 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1022);
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1132 = _1130 != 0;
    float _1134 = _1092 ? as_type<float>(_1118) : _1032;
    float _1136 = _1040 * 2.0;
    float _1138 = _1100 ? as_type<float>(_1114) : _1032;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1144 = _1142 != 0;
    float _1146 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1116);
    float _1148 = _1054 * 2.0;
    float _1150 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1030);
    float _1152 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1154 = _1150;
    if (_1106)
    {
        float _1156 = -_1020;
        float _1158 = _1156 + 1.0;
        _1046 = as_type<int>(_1158);
    }
    int _1160 = _1046;
    if (!_1106)
    {
        _842 = _1020;
    }
    float _1162 = _842;
    float _1164 = floor(_1136);
    float _1166 = fma(_1152, -2.0, _1140);
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1170 = _1016 + _1168;
    float _1172 = _1162;
    if (_1106)
    {
        float _1174 = _1070 ? as_type<float>(_1160) : _1020;
        _1172 = _1174;
    }
    float _1176 = _1172;
    float _1178 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1146);
    float _1180 = _1170 * _1120;
    int _1182 = as_type<int>(_1120);
    if (_1132)
    {
        float _1184 = -_1020;
        float _1186 = _1184 + 1.0;
        _1182 = as_type<int>(_1186);
    }
    int _1188 = _1182;
    float _1190 = floor(_1148);
    float _1192 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1150);
    float _1194 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1124);
    if (!_1132)
    {
        _1154 = _1020;
    }
    float _1196 = _1154;
    float _1198 = _1196;
    if (_1128)
    {
        float _1200 = -_1020;
        float _1202 = _1200 + 1.0;
        _276 = as_type<int>(_1202);
    }
    int _1204 = _276;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1208 = 1.0 + _1206;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_1132)
    {
        float _1212 = _1088 ? as_type<float>(_1188) : _1020;
        _1198 = _1212;
    }
    float _1214 = _1198;
    if (!_1128)
    {
        _844 = _1020;
    }
    float _1216 = _844;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1218;
    float _1222 = _1216;
    if (_1128)
    {
        float _1224 = _1088 ? as_type<float>(_1204) : _1020;
        _1222 = _1224;
    }
    float _1226 = _1222;
    bool _1228 = _1164 > 0.0;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _1232 = _1190 > 0.0;
    bool _1234 = _1190 >= 0.0;
    bool _1236 = isnan(_1190);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.0);
    bool _1242 = _1238 || _1240;
    float _1244 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1246 = _1164 >= 0.0;
    bool _1248 = isnan(_1164);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(0.0);
    bool _1254 = _1250 || _1252;
    float _1256 = fma(_1220, _1180, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1258 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1260 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1262 = _1220;
    if (_1144)
    {
        float _1264 = in.m_53.x;
        _1262 = _1264;
    }
    float _1266 = _1262;
    float _1268 = fma(_1134, _1244, -0.5);
    float _1270 = fma(_1108, _1258, -0.5);
    float _1272 = fma(_1138, _1260, -0.5);
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1276 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1278 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1280 = isnan(_1016);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1292;
    bool _1296 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1298 = isnan(_1016);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = -_1288;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_1122, _1276, -0.5);
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1314;
    float _1318 = fma(_1294, _1180, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1320 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1290);
    float _1322 = _1306 * _1310;
    float _1324 = fma(_1316, _1180, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1326 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1166);
    float _1328 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1320);
    float _1330 = _1256 * _1322;
    float _1332 = _1318 * _1322;
    float _1334 = -_1306;
    float _1336 = _1334 + 1.0;
    float _1338 = _1324 * _1322;
    float _1340 = -_1326;
    float _1342 = fma(_1328, _1268, _1340);
    float _1344 = _1328;
    int _1346 = as_type<int>(_1324);
    int _1348 = as_type<int>(_1332);
    float _1350 = _1338;
    if (_1144)
    {
        _1344 = _1054;
    }
    float _1352 = _1344;
    float _1354 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1332);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1338);
    float _1358 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1330);
    float _1360 = _1352;
    if (_1144)
    {
        _1346 = 0;
    }
    int _1362 = _1346;
    int _1364 = _1362;
    if (_1144)
    {
        _1348 = 0;
    }
    int _1366 = _1348;
    int _1368 = _1254 ? 0 : 1;
    int _1370 = _1242 ? 0 : 1;
    int _1372 = _1366;
    float _1374 = _1266;
    if (_1144)
    {
        _1350 = _1266;
    }
    float _1376 = _1350;
    float _1378 = _1376;
    if (!_1144)
    {
        float _1380 = in.m_53.x;
        float _1382 = _1054 * 3.1415927410125732421875;
        float _1384 = _1382 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1380 * 3.1415927410125732421875;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = _1392 * 6.283185482025146484375;
        float _1396 = sin(_1394);
        _1364 = 1;
        _1372 = 2;
        _1374 = _1380;
        _1378 = _1396;
        _1360 = _1388;
    }
    int _1398 = _1364;
    int _1400 = _1372;
    float _1402 = _1374;
    float _1404 = _1378;
    float _1406 = _1360;
    int _1408 = ~_1370;
    int _1410 = _1408 + 1;
    int _1412 = _1410 + 1;
    float _1414 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1416 = _1412;
    if (!_1232)
    {
        int _1418 = ~_1370;
        int _1420 = _1418 + 1;
        _1416 = _1420;
    }
    int _1422 = _1416;
    float _1424 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1428 = _1398 != 1;
    float _1430 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1358);
    bool _1432 = _1400 != 2;
    float _1434 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1356);
    float _1436 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1438 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1440 = ~_1368;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    float _1446 = fma(_1436, _1176, -0.5);
    int _1448 = _1444;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (!_1228)
    {
        int _1452 = ~_1368;
        int _1454 = _1452 + 1;
        _1448 = _1454;
    }
    int _1456 = _1448;
    float _1458 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1470 = _1468 != 0;
    float _1472 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1354);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1476 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1478 = fma(_1438, _1226, -0.5);
    float _1480 = fma(_1458, _1082, -0.5);
    float _1482 = -_1474;
    float _1484 = fma(_1476, 2.0, _1482);
    float _1486 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1490 = fma(_1486, _1214, -0.5);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1494 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1488);
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1498 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1502 = _1054 + _1402;
    float _1504 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1492);
    float _1506 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1508 = -_1496;
    float _1510 = fma(_1498, 2.0, _1508);
    float _1512 = _1502 + (-1.0);
    float _1514 = fma(_1506, -2.0, _1500);
    float _1516 = _1402 * 2.0;
    float _1518 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1522 = _1414 + _1520;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1526 = _1192 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1424 + _1528;
    float _1532 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1534 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1524);
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = _1526 + _1536;
    float _1540 = 0.0;
    float _1542 = _1532;
    float _1544 = _1516;
    float _1546 = _1490;
    if (!_1428)
    {
        _1540 = _1054;
    }
    float _1548 = _1540;
    float _1550 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1532);
    float _1552 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1534);
    float _1554 = -_130;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1484);
    float _1558 = floor(_1516);
    float _1560 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1550);
    float _1562 = _1550;
    float _1564 = _1548;
    if (!_1428)
    {
        _1562 = _1040;
    }
    float _1566 = _1562;
    float _1568 = fma(_1552, _1480, _1556);
    float _1570 = 0.0;
    float _1572 = _1566;
    if (!_1428)
    {
        _1570 = _1040;
    }
    float _1574 = _1570;
    float _1576 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1578 = _1574;
    if (!_1428)
    {
        _1450 = _1548;
    }
    float _1580 = _1450;
    float _1582 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1494);
    float _1584 = _1580;
    if (_1428)
    {
        _1572 = _1054;
    }
    float _1586 = _1572;
    float _1588 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1428)
    {
        _1578 = _1054;
    }
    float _1590 = _1578;
    float _1592 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1504);
    if (_1428)
    {
        _1584 = _1402;
    }
    float _1594 = _1584;
    if (_1428)
    {
        _1564 = _1402;
    }
    float _1596 = _1564;
    if (_1432)
    {
        _1542 = _1402;
    }
    float _1598 = _1542;
    float _1600 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1602 = _1598;
    if (_1432)
    {
        _1544 = _1054;
    }
    float _1604 = _1544;
    bool _1606 = _1558 > 0.0;
    bool _1608 = _1558 >= 0.0;
    bool _1610 = isnan(_1558);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan(0.0);
    bool _1616 = _1612 || _1614;
    float _1618 = _1430 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1620 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1622 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = _1604;
    if (!_1432)
    {
        _1602 = _1040;
    }
    float _1626 = _1602;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1432)
    {
        _1624 = _1402;
    }
    float _1630 = _1624;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1634 = _1560 >= 0.0;
    float _1636 = -_130;
    float _1638 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1510);
    float _1640 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1644 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1514);
    float _1646 = fma(_1582, _1490, _1638);
    out.m_61.x = _1622;
    out.m_61.y = _1588;
    out.m_61.z = _1640;
    out.m_61.w = _1632;
    float _1648 = -_1628;
    float _1650 = fma(_1642, 2.0, _1648);
    float _1652 = -_1644;
    float _1654 = fma(_1592, _1312, _1652);
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1634)
    {
        _1546 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1658 = _1546;
    float _1660 = _1646 + 0.5;
    float _1662 = _1654 + 0.5;
    int _1664 = as_type<int>(_1658);
    if (_1634)
    {
        out.m_47.x = 0.0;
    }
    if (_1634)
    {
        float _1666 = _1658 * 5.0;
        _1664 = as_type<int>(_1666);
    }
    int _1668 = _1664;
    out.m_63.x = _1660;
    out.m_63.y = _1662;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1672 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1656);
    float _1674 = -_130;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1650);
    if (_1634)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6537 = as_type<float>(_1668);
        out.gl_Position.z = _6537;
    }
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1680 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1670);
    float _1682 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1672);
    float _1684 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1678);
    float _1686 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1680);
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1690 = fma(_1682, _1478, _1676);
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1694 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1696 = -_1688;
    float _1698 = fma(_1600, 2.0, _1696);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1702 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1704 = fma(_1694, -2.0, _1692);
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1708 = -_130;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1698);
    float _1712 = fma(_1702, -2.0, _1700);
    float _1714 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1684);
    float _1716 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1706);
    float _1718 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1704);
    float _1720 = fma(_1686, _1446, _1710);
    float _1722 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1712);
    float _1724 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1726 = log2(_1724);
    float _1728 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1716);
    float _1730 = -_1718;
    float _1732 = fma(_1714, _1270, _1730);
    float _1734 = _1522 * _1522;
    bool _1736 = !_1462;
    int _1738 = _1736 ? 0 : 1;
    float _1740 = -_1722;
    float _1742 = fma(_1728, _1272, _1740);
    float _1744 = _1342 + 0.5;
    float _1746 = fma(_1530, _1530, _1734);
    int _1748 = abs(_1738);
    float _1750 = _1690 + 0.5;
    float _1752 = in.m_65.x;
    float _1754 = in.m_65.y;
    float _1756 = in.m_65.z;
    float _1758 = fma(_1538, _1538, _1746);
    float _1760 = _1568 + 0.5;
    float _1762 = _1720 + 0.5;
    float _1764 = _1732 + 0.5;
    float _1766 = _1742 + 0.5;
    float _1768 = _1726 * _130;
    float _1770 = rsqrt(_1758);
    int _1772 = _1616 ? 0 : 1;
    out.m_67.x = _1760;
    out.m_67.y = _1744;
    out.m_67.z = _1762;
    out.m_67.w = _1764;
    float _1774 = float(_1456);
    float _1776 = float(_1748);
    out.m_69.x = _1750;
    out.m_69.y = _1766;
    int _1778 = ~_1772;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    float _1784 = exp2(_1768);
    int _1786 = _1782;
    if (!_1606)
    {
        int _1788 = ~_1772;
        int _1790 = _1788 + 1;
        _1786 = _1790;
    }
    int _1792 = _1786;
    float _1794 = _1776 * _1774;
    bool _1796 = !_1466;
    int _1798 = _1796 ? 0 : 1;
    bool _1800 = !_1470;
    int _1802 = _1800 ? 0 : 1;
    float _1804 = _1522 * _1770;
    float _1806 = _1530 * _1770;
    if (_1634)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1808 = -_1804;
    float _1810 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1414);
    float _1812 = _1794 * (-2.0);
    float _1814 = _1402 + (-0.5);
    float _1816 = -_1806;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1822 = _1810 + _1820;
    float _1824 = fma(_1812, _1752, _1752);
    float _1826 = fma(_1518, _1812, _1518);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1830 = _1818 + _1828;
    float _1832 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1834 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1824);
    float _1836 = _1538 * _1770;
    int _1838 = abs(_1802);
    float _1840 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1832);
    int _1842 = abs(_1798);
    float _1844 = -_1836;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1526);
    float _1848 = float(_1422);
    float _1850 = 1.0 / _1208;
    bool _1852 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1854 = isnan(1.0);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1860 = _1856 || _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1864 = _1846 + _1862;
    float _1866 = float(_1838);
    float _1868 = -_1784;
    float _1870 = _1868 + 1.0;
    float _1872 = float(_1792);
    float _1874 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1840);
    bool _1876 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1878 = isnan(0.0);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1884 = _1880 || _1882;
    float _1886 = _1866 * _1848;
    float _1888 = float(_1842);
    float _1890 = _1040 + _1402;
    float _1892 = _1054 + _1040;
    float _1894 = _1884 ? _1870 : 0.0;
    float _1896 = _1886 * (-2.0);
    float _1898 = _1888 * _1872;
    float _1900 = _1890 + (-1.0);
    bool _1902 = _1874 >= 0.0;
    float _1904 = _1892 + (-1.0);
    float _1906 = _1898 * (-2.0);
    float _1908 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1910 = _1040 + (-0.5);
    float _1912 = fma(_1896, _1756, _1756);
    float _1914 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1916 = fma(_1906, _1754, _1754);
    float _1918 = _1054 + (-0.5);
    if (_1860)
    {
        float _1920 = _1894 * _1850;
        _132 = _1920;
    }
    float _1922 = _132;
    float _1924 = fma(_1908, _1896, _1908);
    float _1926 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1912);
    float _1928 = fma(_1914, _1906, _1914);
    float _1930 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1916);
    float _1932 = fma(_1826, _1922, _1834);
    float _1934 = fma(_1924, _1922, _1926);
    float _1936 = _1934;
    if (_1902)
    {
        out.m_47.x = 0.0;
    }
    float _1938 = fma(_1928, _1922, _1930);
    float _1940 = _1932 * 0.15915493667125701904296875;
    float _1942 = _1934 * 0.15915493667125701904296875;
    if (_1902)
    {
        _1936 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1944 = _1936;
    float _1946 = _1938 * 0.15915493667125701904296875;
    float _1948 = _1940 * 6.283185482025146484375;
    float _1950 = sin(_1948);
    int _1952 = as_type<int>(_1944);
    if (_1902)
    {
        float _1954 = _1944 * 5.0;
        _1952 = as_type<int>(_1954);
    }
    int _1956 = _1952;
    float _1958 = _1940 * 6.283185482025146484375;
    float _1960 = cos(_1958);
    if (_1902)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7005 = as_type<float>(_1956);
        out.gl_Position.z = _7005;
    }
    float _1962 = _1942 * 6.283185482025146484375;
    float _1964 = sin(_1962);
    float _1966 = _1946 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    if (_1902)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1970 = -_1414;
    float _1972 = _1970 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1974 = -_1424;
    float _1976 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1978 = -_1804;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _1982 = -_1526;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1986 = _1972 * _1972;
    float _1988 = -_1806;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1530);
    float _1992 = _1980 * _1980;
    float _1994 = -_1836;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1998 = fma(_1976, _1976, _1986);
    float _2000 = _1946 * 6.283185482025146484375;
    float _2002 = cos(_2000);
    float _2004 = fma(_1990, _1990, _1992);
    float _2006 = _1950 * _1968;
    float _2008 = fma(_1984, _1984, _1998);
    float _2010 = in.m_71.x;
    float _2012 = in.m_71.y;
    float _2014 = in.m_71.z;
    float _2016 = fma(_1996, _1996, _2004);
    float _2018 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2020 = _1942 * 6.283185482025146484375;
    float _2022 = cos(_2020);
    float _2024 = rsqrt(_2008);
    float _2026 = _1960 * _2002;
    float _2028 = fma(_1964, _2026, _2006);
    float _2030 = fma(_1964, _2006, _2026);
    float _2032 = sqrt(_2016);
    float _2034 = _1976 * _2024;
    float _2036 = _1984 * _2024;
    float _2038 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2042 = _2034 * _2040;
    float _2044 = _1770 * _2032;
    float _2046 = _1972 * _2024;
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2050 = _2036 * _2048;
    float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2054 = -_2042;
    float _2056 = fma(_2036, _2052, _2054);
    float _2058 = _2044 * _2038;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2062 = _2046 * _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2066 = -_2050;
    float _2068 = fma(_2046, _2064, _2066);
    float _2070 = _2056 * _2056;
    float _2072 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2076 = -_2062;
    float _2078 = fma(_2034, _2074, _2076);
    float _2080 = _1960 * _1968;
    float _2082 = fma(_2068, _2068, _2070);
    float _2084 = _1968 * _2022;
    float _2086 = fma(_2078, _2078, _2082);
    float _2088 = _2044 * _2018;
    float _2090 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2012);
    float _2092 = _2044 * _2072;
    float _2094 = _1950 * _2002;
    float _2096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2014);
    float _2098 = rsqrt(_2086);
    float _2100 = _2088 * _2090;
    float _2102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2010);
    float _2104 = -_2080;
    float _2106 = fma(_1964, _2094, _2104);
    float _2108 = -_2094;
    float _2110 = fma(_1964, _2080, _2108);
    float _2112 = -_2100;
    float _2114 = _1964 * _2112;
    float _2116 = _2092 * _2102;
    float _2118 = _2022 * _2100;
    float _2120 = _2058 * _2096;
    float _2122 = _2002 * _2022;
    float _2124 = _1960 * _2118;
    float _2126 = _1950 * _2118;
    float _2128 = fma(_2122, _2116, _2114);
    float _2130 = fma(_2028, _2116, _2124);
    float _2132 = _2068 * _2098;
    float _2134 = _2056 * _2098;
    float _2136 = fma(_2106, _2116, _2126);
    float _2138 = fma(_2110, _2120, _2130);
    float _2140 = _2046 * _2132;
    float _2142 = _2078 * _2098;
    float _2144 = _2036 * _2134;
    float _2146 = fma(_2084, _2120, _2128);
    float _2148 = -_2140;
    float _2150 = fma(_2034, _2134, _2148);
    float _2152 = fma(_2030, _2120, _2136);
    float _2154 = -_2144;
    float _2156 = fma(_2046, _2142, _2154);
    float _2158 = _2150 * _2138;
    float _2160 = _2156 * _2138;
    float _2162 = fma(_2142, _2146, _2158);
    float _2164 = fma(_2132, _2146, _2160);
    float _2166 = fma(_2036, _2152, _2162);
    float _2168 = fma(_2034, _2152, _2164);
    float _2170 = _2034 * _2142;
    float _2172 = _1526 + _2166;
    float _2174 = _1424 + _2168;
    float _2176 = -_2170;
    float _2178 = fma(_2036, _2132, _2176);
    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2182 = _2172 + _2180;
    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2186 = _2174 + _2184;
    float _2188 = _2178 * _2138;
    float _2190 = _2182 * _2182;
    float _2192 = fma(_2134, _2146, _2188);
    float _2194 = fma(_2186, _2186, _2190);
    float _2196 = fma(_2046, _2152, _2192);
    float _2198 = sqrt(_2194);
    float _2200 = _1414 + _2196;
    bool _2202 = _2198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2204 = _2142;
    float _2206 = _2138;
    float _2208 = _2190;
    float _2210 = _2194;
    float _2212 = _2188;
    if (!_2202)
    {
        _2204 = _2174;
    }
    float _2214 = _2204;
    float _2216 = _2214;
    if (!_2202)
    {
        _2206 = _2172;
    }
    float _2218 = _2206;
    float _2220 = _2218;
    if (!_2202)
    {
        _2208 = _2200;
    }
    float _2222 = _2208;
    bool _2224 = !_2202;
    float _2226 = _2222;
    if (!_2224)
    {
        float _2228 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2232 = _2198 + _2230;
        float _2234 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2236 = rsqrt(_2194);
        float _2238 = _2232 * _2228;
        float _2240 = _2238 * 0.15915493667125701904296875;
        float _2242 = _2240 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = _2240 * 6.283185482025146484375;
        float _2248 = cos(_2246);
        float _2250 = fma(_2244, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2252 = _2236 * _2250;
        float _2254 = _2248 + (-1.0);
        float _2256 = fma(_2186, _2252, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2258 = fma(_2182, _2252, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2260 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2262 = fma(_2200, _2248, _2260);
        _2226 = _2262;
        _2216 = _2256;
        _2220 = _2258;
        _2210 = _2236;
    }
    float _2264 = _2226;
    float _2266 = _2216;
    float _2268 = _2220;
    float _2270 = _2210;
    float _2272 = -_1804;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2264);
    float _2276 = -_1806;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2266);
    float _2280 = -_1836;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2268);
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2286 = _2274 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2290 = _2278 + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2294 = _2282 + _2292;
    float _2296 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2298 = _2286 * _2286;
    float _2300 = fma(_2290, _2290, _2298);
    float _2302 = fma(_2294, _2294, _2300);
    float _2304 = rsqrt(_2302);
    float _2306 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2308 = _2290 * _2306;
    float _2310 = _2294 * _2306;
    float _2312 = _2308 * _2308;
    float _2314 = _2310 * _2310;
    float _2316 = _2312 + _2314;
    float _2318 = sqrt(_2316);
    bool _2320 = _2318 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2324 = _2318 + _2322;
    float _2326 = _2294;
    float _2328 = _2316;
    float _2330 = _2324;
    float _2332 = _2286;
    float _2334 = _2306;
    if (_2320)
    {
        float _2336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2326 = _2336;
    }
    float _2338 = _2326;
    if (_2320)
    {
        float _2340 = rsqrt(_2316);
        _2328 = _2340;
    }
    float _2342 = _2328;
    if (_2320)
    {
        float _2344 = _2324 * _2338;
        _2330 = _2344;
    }
    float _2346 = _2330;
    if (_2320)
    {
        float _2348 = _2346 * 0.15915493667125701904296875;
        _2212 = _2348;
    }
    float _2350 = _2212;
    float _2352 = _2270;
    if (_2320)
    {
        float _2354 = _2350 * 6.283185482025146484375;
        float _2356 = sin(_2354);
        _2352 = _2356;
    }
    float _2358 = _2352;
    float _2360 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2362 = precise::max(0.0, _2360);
    float _2364 = _2304;
    float _2366 = _2360;
    if (_2320)
    {
        float _2368 = _2350 * 6.283185482025146484375;
        float _2370 = cos(_2368);
        _2364 = _2370;
    }
    float _2372 = _2364;
    float _2374 = -_2306;
    float _2376 = -_2362;
    float _2378 = fma(_2286, _2374, _2376);
    float _2380 = _2378;
    if (!_2320)
    {
        _2332 = _2308;
    }
    float _2382 = _2332;
    float _2384 = _2382;
    if (_2320)
    {
        float _2386 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2366 = _2386;
    }
    float _2388 = _2366;
    float _2390 = sqrt(_2302);
    float _2392 = _2388;
    float _2394 = _2358;
    if (_2320)
    {
        float _2396 = fma(_2358, _2388, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2392 = _2396;
    }
    float _2398 = _2392;
    float _2400 = _2398;
    float _2402 = _2372;
    if (_2320)
    {
        float _2404 = _2372 + (-1.0);
        _2334 = _2404;
    }
    float _2406 = _2334;
    float _2408 = _2406;
    if (_2320)
    {
        float _2410 = _2342 * _2398;
        _2394 = _2410;
    }
    float _2412 = _2394;
    float _2414 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_2320)
    {
        _2400 = _2310;
    }
    float _2416 = _2400;
    float _2418 = _2416;
    if (_2320)
    {
        float _2420 = _2406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2408 = _2420;
    }
    float _2422 = _2408;
    float _2424 = _2422;
    if (_2320)
    {
        float _2426 = _2308 * _2412;
        _2384 = _2426;
    }
    float _2428 = _2384;
    if (_2320)
    {
        float _2430 = _2310 * _2412;
        _2418 = _2430;
    }
    float _2432 = _2418;
    float _2434 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    if (_2320)
    {
        float _2436 = fma(_2378, _2372, _2422);
        _2380 = _2436;
    }
    float _2438 = _2380;
    if (!_2320)
    {
        _2424 = _2312;
    }
    float _2440 = _2424;
    float _2442 = _2440;
    if (_2320)
    {
        float _2444 = _2428 * _2428;
        _2442 = _2444;
    }
    float _2446 = _2442;
    float _2448 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2414);
    if (!_2320)
    {
        _2402 = _2314;
    }
    float _2450 = _2402;
    float _2452 = _2450;
    if (_2320)
    {
        float _2454 = _2432 * _2432;
        _2452 = _2454;
    }
    float _2456 = _2452;
    float _2458 = fma(_2438, _2438, _2446);
    float _2460 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[9].x, _2434);
    float _2462 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2448);
    float _2464 = _2458 + _2456;
    float _2466 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[9].z, _2460);
    float _2468 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2470 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2474 = fma(_2390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2472);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _2480 = _2468 * 0.5;
    float _2482 = rsqrt(_2464);
    float _2484 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2486 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2488 = fma(_2478, -0.5, _2480);
    float _2490 = -_2476;
    float _2492 = _2490 + 1.0;
    float _2494 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2484);
    float _2496 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2486);
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2500 = _2488 + _2498;
    float _2502 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2470);
    float _2504 = abs(_2492);
    float _2506 = log2(_2504);
    float _2508 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2296);
    float _2510 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2494);
    float _2512 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2502);
    float _2514 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2496);
    float _2516 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2508);
    float _2518 = _2482 * _2428;
    float _2520 = _2482 * _2438;
    float _2522 = _2512 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2524 = _2482 * _2432;
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2528 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2530 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2532 = -_2526;
    float _2534 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2532);
    float _2536 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2538 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2540 = -_2524;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2534);
    float _2544 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2546 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2548 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2550 = exp2(_2536);
    float _2552 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2544);
    float _2554 = fma(_2542, -0.5, 0.5);
    float _2556 = fma(_2542, 0.5, 0.5);
    float _2558 = -_2548;
    float _2560 = fma(_2558, _2546, 1.0);
    float _2562 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2552);
    float _2564 = _2520 + 1.0;
    float _2566 = fma(_2556, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2568 = sqrt(_2554);
    float _2570 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2562);
    float _2572 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2574 = fma(_2556, _2566, -0.212114393711090087890625);
    float _2576 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2578 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _2488);
    float _2580 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2582 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _2488);
    float _2584 = -_2520;
    float _2586 = fma(_2550, _2564, _2584);
    float _2588 = 1.0 / _2570;
    float _2590 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _2592 = fma(_2556, _2574, 1.570728778839111328125);
    float _2594 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2572);
    float _2596 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _2488);
    float _2598 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[8].x, _2590);
    float _2600 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2576);
    float _2602 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2594);
    float _2604 = 1.0 / _2468;
    float _2606 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[8].z, _2598);
    float _2608 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2600);
    float _2610 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2602);
    float _2612 = _2568 * 0.636619746685028076171875;
    float _2614 = _2606 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _2616 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2608);
    float _2618 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _2488);
    float _2620 = _2610 * _2588;
    float _2622 = -_2592;
    float _2624 = fma(_2612, _2622, 1.0);
    float _2626 = _2616 * _2588;
    float _2628 = _2614 + _2468;
    float _2630 = fma(_2620, 0.5, 0.5);
    float _2632 = fma(_2586, 0.5, 0.5);
    float _2634 = fma(_2626, -0.5, 0.5);
    float _2636 = _2628 * 0.5;
    float _2638 = _2488 * _2604;
    float _2640 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _2488);
    float _2642 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _2488);
    float _2644 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _2636);
    float _2646 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _2636);
    float _2648 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _2636);
    float _2650 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _2636);
    float _2652 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _2636);
    float _2654 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _2636);
    float _2656 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _2636);
    float _2658 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _2636);
    float _2660 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _2636);
    float _2662 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _2636);
    float _2664 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _2636);
    float _2666 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _2636);
    float _2668 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _2636);
    float _2670 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _2636);
    float _2672 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _2636);
    float _2674 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _2636);
    float _2676 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _2636);
    float _2678 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _2636);
    float _2680 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _2636);
    float _2682 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _2636);
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2686 = _2636 + _2684;
    float _2688 = _2636 * _2604;
    float _2690 = _2636 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2692 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _2488);
    float _2694 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _2488);
    float _2696 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _2488);
    float _2698 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _2488);
    float _2700 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _2488);
    float _2702 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _2488);
    float _2704 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _2488);
    float _2706 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _2488);
    float _2708 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _2488);
    float _2710 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _2488);
    float _2712 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _2488);
    float _2714 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _2488);
    float _2716 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _2488);
    float _2718 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _2488);
    float _2720 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _2488);
    float _2722 = _2644 * _2604;
    float _2724 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _2488);
    float _2726 = _2578 * _2604;
    float _2728 = _2640 * _2604;
    float _2730 = _2646 * _2604;
    float _2732 = _2686 * _2604;
    float2 _8315 = float2(_2722, _2726);
    float _2734 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8315, float2(0.0), isnan(_8315)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8315, float2(0.0), isnan(_8315)), level(0.0)).x;
    float _2736 = _2500 * _2604;
    float _2738 = _2580 * _2604;
    float2 _8331 = float2(_2730, _2728);
    float _2740 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8331, float2(0.0), isnan(_8331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8331, float2(0.0), isnan(_8331)), level(0.0)).x;
    float _2742 = _2582 * _2604;
    float2 _8342 = float2(_2732, _2638);
    float _2744 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8342, float2(0.0), isnan(_8342)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8342, float2(0.0), isnan(_8342)), level(0.0)).x;
    float _2746 = _2690 * _2604;
    float2 _8353 = float2(_2688, _2736);
    float _2748 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8353, float2(0.0), isnan(_8353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8353, float2(0.0), isnan(_8353)), level(0.0)).x;
    float2 _8361 = float2(_2688, _2738);
    float _2750 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8361, float2(0.0), isnan(_8361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8361, float2(0.0), isnan(_8361)), level(0.0)).x;
    float _2752 = _2648 * _2604;
    float2 _8372 = float2(_2730, _2742);
    float _2754 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8372, float2(0.0), isnan(_8372)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8372, float2(0.0), isnan(_8372)), level(0.0)).x;
    float _2756 = _2596 * _2604;
    float2 _8383 = float2(_2746, _2638);
    float _2758 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8383, float2(0.0), isnan(_8383)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8383, float2(0.0), isnan(_8383)), level(0.0)).x;
    float _2760 = _2650 * _2604;
    float _2762 = _2618 * _2604;
    float2 _8397 = float2(_2752, _2756);
    float _2764 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8397, float2(0.0), isnan(_8397)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8397, float2(0.0), isnan(_8397)), level(0.0)).x;
    float _2766 = _2652 * _2604;
    float _2768 = _2642 * _2604;
    float _2770 = log2(_2560);
    float2 _8413 = float2(_2760, _2762);
    float _2772 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8413, float2(0.0), isnan(_8413)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8413, float2(0.0), isnan(_8413)), level(0.0)).x;
    float _2774 = _2654 * _2604;
    float _2776 = _2718 * _2604;
    float2 _8427 = float2(_2766, _2638);
    float _2778 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8427, float2(0.0), isnan(_8427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8427, float2(0.0), isnan(_8427)), level(0.0)).x;
    float _2780 = _2692 * _2604;
    float2 _8438 = float2(_2774, _2768);
    float _2782 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8438, float2(0.0), isnan(_8438)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8438, float2(0.0), isnan(_8438)), level(0.0)).x;
    float2 _8446 = float2(_2688, _2726);
    float _2784 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8446, float2(0.0), isnan(_8446)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8446, float2(0.0), isnan(_8446)), level(0.0)).x;
    float _2786 = _2656 * _2604;
    float _2788 = _2694 * _2604;
    float _2790 = _2724 * _2604;
    float _2792 = _2658 * _2604;
    float _2794 = _2696 * _2604;
    float _2796 = _2698 * _2604;
    float _2798 = _2660 * _2604;
    float _2800 = _2662 * _2604;
    float _2802 = _2770 * 0.693147182464599609375;
    float _2804 = _2720 * _2604;
    float _2806 = _2702 * _2604;
    float2 _8486 = float2(_2688, _2756);
    float _2808 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8486, float2(0.0), isnan(_8486)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8486, float2(0.0), isnan(_8486)), level(0.0)).x;
    float2 _8494 = float2(_2774, _2780);
    float _2810 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8494, float2(0.0), isnan(_8494)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8494, float2(0.0), isnan(_8494)), level(0.0)).x;
    float _2812 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2814 = _2700 * _2604;
    float2 _8509 = float2(_2730, _2638);
    float _2816 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8509, float2(0.0), isnan(_8509)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8509, float2(0.0), isnan(_8509)), level(0.0)).x;
    float2 _8517 = float2(_2786, _2788);
    float _2818 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8517, float2(0.0), isnan(_8517)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8517, float2(0.0), isnan(_8517)), level(0.0)).x;
    float _2820 = _2704 * _2604;
    float _2822 = _2716 * _2604;
    float _2824 = _2664 * _2604;
    float2 _8534 = float2(_2792, _2794);
    float _2826 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8534, float2(0.0), isnan(_8534)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8534, float2(0.0), isnan(_8534)), level(0.0)).x;
    float2 _8542 = float2(_2798, _2638);
    float _2828 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8542, float2(0.0), isnan(_8542)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8542, float2(0.0), isnan(_8542)), level(0.0)).x;
    float2 _8550 = float2(_2800, _2796);
    float _2830 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8550, float2(0.0), isnan(_8550)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8550, float2(0.0), isnan(_8550)), level(0.0)).x;
    float2 _8558 = float2(_2688, _2814);
    float _2832 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8558, float2(0.0), isnan(_8558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8558, float2(0.0), isnan(_8558)), level(0.0)).x;
    float2 _8566 = float2(_2688, _2806);
    float _2834 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8566, float2(0.0), isnan(_8566)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8566, float2(0.0), isnan(_8566)), level(0.0)).x;
    float2 _8574 = float2(_2800, _2820);
    float _2836 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8574, float2(0.0), isnan(_8574)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8574, float2(0.0), isnan(_8574)), level(0.0)).x;
    float2 _8582 = float2(_2824, _2638);
    float _2838 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8582, float2(0.0), isnan(_8582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8582, float2(0.0), isnan(_8582)), level(0.0)).x;
    float _2840 = _2666 * _2604;
    float _2842 = _2668 * _2604;
    float _2844 = _2706 * _2604;
    float _2846 = _2670 * _2604;
    float _2848 = _2708 * _2604;
    float _2850 = _2672 * _2604;
    float _2852 = _2710 * _2604;
    float _2854 = _2674 * _2604;
    float _2856 = _2712 * _2604;
    float _2858 = _2676 * _2604;
    float _2860 = _2714 * _2604;
    float _2862 = _2678 * _2604;
    float2 _8626 = float2(_2840, _2844);
    float _2864 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8626, float2(0.0), isnan(_8626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8626, float2(0.0), isnan(_8626)), level(0.0)).x;
    float2 _8634 = float2(_2842, _2848);
    float _2866 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8634, float2(0.0), isnan(_8634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8634, float2(0.0), isnan(_8634)), level(0.0)).x;
    float2 _8642 = float2(_2846, _2852);
    float _2868 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8642, float2(0.0), isnan(_8642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8642, float2(0.0), isnan(_8642)), level(0.0)).x;
    float2 _8650 = float2(_2850, _2856);
    float _2870 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8650, float2(0.0), isnan(_8650)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8650, float2(0.0), isnan(_8650)), level(0.0)).x;
    float2 _8658 = float2(_2854, _2860);
    float _2872 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8658, float2(0.0), isnan(_8658)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8658, float2(0.0), isnan(_8658)), level(0.0)).x;
    float2 _8666 = float2(_2858, _2822);
    float _2874 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8666, float2(0.0), isnan(_8666)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8666, float2(0.0), isnan(_8666)), level(0.0)).x;
    float2 _8674 = float2(_2862, _2776);
    float _2876 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8674, float2(0.0), isnan(_8674)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8674, float2(0.0), isnan(_8674)), level(0.0)).x;
    float _2878 = _2680 * _2604;
    float _2880 = _2682 * _2604;
    float2 _8688 = float2(_2878, _2804);
    float _2882 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8688, float2(0.0), isnan(_8688)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8688, float2(0.0), isnan(_8688)), level(0.0)).x;
    float2 _8696 = float2(_2880, _2790);
    float _2884 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8696, float2(0.0), isnan(_8696)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8696, float2(0.0), isnan(_8696)), level(0.0)).x;
    float2 _8704 = float2(_2688, _2638);
    float _2886 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8704, float2(0.0), isnan(_8704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8704, float2(0.0), isnan(_8704)), level(0.0)).x;
    float3 _8713 = float3(_2630, _2634, _2812);
    float _2888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8713, float3(0.0), isnan(_8713)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8713, float3(0.0), isnan(_8713)), level(0.0)).x;
    float3 _8724 = float3(_2630, _2634, _2812);
    float4 _2891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8724, float3(0.0), isnan(_8724)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8724, float3(0.0), isnan(_8724)), level(0.0)).xyzw;
    float _2893 = _2891.x;
    float _2895 = _2891.y;
    float _2897 = _2891.z;
    float _2899 = _2891.w;
    float2 _8740 = float2(_2624, _2632);
    float3 _2903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8740, float2(0.0), isnan(_8740)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8740, float2(0.0), isnan(_8740)), level(0.0)).xyz;
    float _2905 = _2903.x;
    float _2907 = _2903.y;
    float _2909 = _2903.z;
    float _2911 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2913 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2915 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2911);
    float _2917 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2913);
    float _2919 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2915);
    float _2921 = _2919 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2923 = _2921 + _2468;
    float _2925 = _2923 * _2604;
    float _2927 = _2925 * 0.5;
    float _2929 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2931 = fma(_2927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2929);
    float _2933 = 1.0 / _2931;
    float _2935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2937 = _2933 * _2935;
    float _2939 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2941 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2939);
    float _2943 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2945 = fma(_2740, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2943);
    float _2947 = 1.0 / _2941;
    float _2949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2951 = fma(_2744, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2949);
    float _2953 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2955 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2953);
    float _2957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2959 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2957);
    float _2961 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2963 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2961);
    float _2965 = 1.0 / _2951;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2969 = fma(_2758, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2967);
    float _2971 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2973 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2971);
    float _2975 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2977 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2975);
    float _2979 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2981 = -_2937;
    float _2983 = fma(_2947, _2979, _2981);
    float _2985 = 1.0 / _2955;
    float _2987 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2989 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2987);
    float _2991 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2993 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2991);
    bool _2995 = _2983 >= 0.0;
    bool _2997 = isnan(_2983);
    bool _2999 = _2995 || _2997;
    bool _3001 = isnan(0.0);
    bool _3003 = _2999 || _3001;
    float _3005 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3007 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3005);
    float _3009 = 1.0 / _2945;
    float _3011 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3013 = -_2937;
    float _3015 = fma(_2985, _3011, _3013);
    float _3017 = 1.0 / _2969;
    float _3019 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3021 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3019);
    float _3023 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3025 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3023);
    float _3027 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3029 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3027);
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3033 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3031);
    float _3035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3037 = -_2937;
    float _3039 = fma(_3009, _3035, _3037);
    float _3041 = 1.0 / _2989;
    float _3043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3045 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3043);
    float _3047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3049 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3047);
    float _3051 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3053 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3051);
    bool _3055 = _3039 >= 0.0;
    bool _3057 = isnan(_3039);
    bool _3059 = _3055 || _3057;
    bool _3061 = isnan(0.0);
    bool _3063 = _3059 || _3061;
    float _3065 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3067 = -_2937;
    float _3069 = fma(_2965, _3065, _3067);
    float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3073 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3071);
    float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3077 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3075);
    bool _3079 = !_3063;
    float _3081 = _3079 ? 0.0 : 2.0;
    float _3083 = 1.0 / _3007;
    bool _3085 = _3069 >= 0.0;
    bool _3087 = isnan(_3069);
    bool _3089 = _3085 || _3087;
    bool _3091 = isnan(0.0);
    bool _3093 = _3089 || _3091;
    float _3095 = float(_3093);
    float _3097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3099 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3097);
    bool _3101 = !_3003;
    float _3103 = _3101 ? 0.0 : 2.0;
    float _3105 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3107 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3105);
    float _3109 = _3103 + _3095;
    bool _3111 = _3015 >= 0.0;
    bool _3113 = isnan(_3015);
    bool _3115 = _3111 || _3113;
    bool _3117 = isnan(0.0);
    bool _3119 = _3115 || _3117;
    float _3121 = float(_3119);
    float _3123 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3125 = -_2937;
    float _3127 = fma(_3017, _3123, _3125);
    float _3129 = 1.0 / _3049;
    float _3131 = _3109 + _3081;
    float _3133 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3135 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3133);
    float _3137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3139 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3137);
    bool _3141 = _3127 >= 0.0;
    bool _3143 = isnan(_3127);
    bool _3145 = _3141 || _3143;
    bool _3147 = isnan(0.0);
    bool _3149 = _3145 || _3147;
    float _3151 = float(_3149);
    float _3153 = _3131 + _3121;
    float _3155 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3157 = -_2937;
    float _3159 = fma(_3041, _3155, _3157);
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3163 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3161);
    float _3165 = 1.0 / _2959;
    float _3167 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3169 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3167);
    float _3171 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3173 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3171);
    float _3175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3177 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3175);
    float _3179 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3181 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3179);
    float _3183 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3185 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3183);
    float _3187 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3189 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3187);
    float _3191 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3193 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3191);
    float _3195 = 1.0 / _3107;
    float _3197 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3199 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3201 = -_2937;
    float _3203 = fma(_3165, _3199, _3201);
    float _3205 = 1.0 / _3185;
    bool _3207 = _3203 >= 0.0;
    bool _3209 = isnan(_3203);
    bool _3211 = _3207 || _3209;
    bool _3213 = isnan(0.0);
    bool _3215 = _3211 || _3213;
    float _3217 = float(_3215);
    float _3219 = 1.0 / _3193;
    float _3221 = _3153 + _3217;
    float _3223 = 1.0 / _2963;
    float _3225 = exp2(_3197);
    float _3227 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3229 = -_2937;
    float _3231 = fma(_3223, _3227, _3229);
    bool _3233 = _3231 >= 0.0;
    bool _3235 = isnan(_3231);
    bool _3237 = _3233 || _3235;
    bool _3239 = isnan(0.0);
    bool _3241 = _3237 || _3239;
    bool _3243 = !_3241;
    float _3245 = _3243 ? 0.0 : 2.0;
    float _3247 = _3221 + _3245;
    float _3249 = 1.0 / _2973;
    float _3251 = _3247 + _3151;
    float _3253 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3255 = -_2937;
    float _3257 = fma(_3249, _3253, _3255);
    bool _3259 = _3257 >= 0.0;
    bool _3261 = isnan(_3257);
    bool _3263 = _3259 || _3261;
    bool _3265 = isnan(0.0);
    bool _3267 = _3263 || _3265;
    float _3269 = 1.0 / _2977;
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3273 = -_2937;
    float _3275 = fma(_3269, _3271, _3273);
    bool _3277 = _3275 >= 0.0;
    bool _3279 = isnan(_3275);
    bool _3281 = _3277 || _3279;
    bool _3283 = isnan(0.0);
    bool _3285 = _3281 || _3283;
    bool _3287 = !_3267;
    float _3289 = _3287 ? 0.0 : 2.0;
    bool _3291 = !_3285;
    float _3293 = _3291 ? 0.0 : 2.0;
    float _3295 = _3251 + _3289;
    bool _3297 = _3159 >= 0.0;
    bool _3299 = isnan(_3159);
    bool _3301 = _3297 || _3299;
    bool _3303 = isnan(0.0);
    bool _3305 = _3301 || _3303;
    float _3307 = float(_3305);
    float _3309 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3311 = -_2937;
    float _3313 = fma(_3083, _3309, _3311);
    float _3315 = _3295 + _3293;
    float _3317 = 1.0 / _3021;
    float _3319 = _3315 + _3307;
    float _3321 = 1.0 / _2993;
    float _3323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3325 = -_2937;
    float _3327 = fma(_3317, _3323, _3325);
    bool _3329 = _3313 >= 0.0;
    bool _3331 = isnan(_3313);
    bool _3333 = _3329 || _3331;
    bool _3335 = isnan(0.0);
    bool _3337 = _3333 || _3335;
    float _3339 = float(_3337);
    float _3341 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3343 = -_2937;
    float _3345 = fma(_3321, _3341, _3343);
    bool _3347 = _3345 >= 0.0;
    bool _3349 = isnan(_3345);
    bool _3351 = _3347 || _3349;
    bool _3353 = isnan(0.0);
    bool _3355 = _3351 || _3353;
    bool _3357 = !_3355;
    float _3359 = _3357 ? 0.0 : 2.0;
    float _3361 = _3319 + _3359;
    bool _3363 = _3327 >= 0.0;
    bool _3365 = isnan(_3327);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = float(_3371);
    float _3375 = _3361 + _3339;
    float _3377 = 1.0 / _3029;
    float _3379 = _3375 + _3373;
    float _3381 = 1.0 / _3025;
    float _3383 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3385 = -_2937;
    float _3387 = fma(_3377, _3383, _3385);
    bool _3389 = _3387 >= 0.0;
    bool _3391 = isnan(_3387);
    bool _3393 = _3389 || _3391;
    bool _3395 = isnan(0.0);
    bool _3397 = _3393 || _3395;
    float _3399 = float(_3397);
    float _3401 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3403 = -_2937;
    float _3405 = fma(_3129, _3401, _3403);
    float _3407 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3409 = -_2937;
    float _3411 = fma(_3381, _3407, _3409);
    bool _3413 = _3411 >= 0.0;
    bool _3415 = isnan(_3411);
    bool _3417 = _3413 || _3415;
    bool _3419 = isnan(0.0);
    bool _3421 = _3417 || _3419;
    bool _3423 = !_3421;
    float _3425 = _3423 ? 0.0 : 2.0;
    float _3427 = _3379 + _3425;
    float _3429 = 1.0 / _3033;
    float _3431 = _3427 + _3399;
    float _3433 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3435 = -_2937;
    float _3437 = fma(_3429, _3433, _3435);
    bool _3439 = _3437 >= 0.0;
    bool _3441 = isnan(_3437);
    bool _3443 = _3439 || _3441;
    bool _3445 = isnan(0.0);
    bool _3447 = _3443 || _3445;
    float _3449 = 1.0 / _3045;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3453 = -_2937;
    float _3455 = fma(_3449, _3451, _3453);
    bool _3457 = _3455 >= 0.0;
    bool _3459 = isnan(_3455);
    bool _3461 = _3457 || _3459;
    bool _3463 = isnan(0.0);
    bool _3465 = _3461 || _3463;
    bool _3467 = !_3447;
    float _3469 = _3467 ? 0.0 : 2.0;
    bool _3471 = !_3465;
    float _3473 = _3471 ? 0.0 : 2.0;
    float _3475 = _3431 + _3469;
    bool _3477 = _3405 >= 0.0;
    bool _3479 = isnan(_3405);
    bool _3481 = _3477 || _3479;
    bool _3483 = isnan(0.0);
    bool _3485 = _3481 || _3483;
    float _3487 = float(_3485);
    float _3489 = _3475 + _3473;
    float _3491 = _3489 + _3487;
    float _3493 = 1.0 / _3053;
    float _3495 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3497 = -_2937;
    float _3499 = fma(_3493, _3495, _3497);
    bool _3501 = _3499 >= 0.0;
    bool _3503 = isnan(_3499);
    bool _3505 = _3501 || _3503;
    bool _3507 = isnan(0.0);
    bool _3509 = _3505 || _3507;
    float _3511 = 1.0 / _3073;
    float _3513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3515 = -_2937;
    float _3517 = fma(_3511, _3513, _3515);
    bool _3519 = !_3509;
    float _3521 = _3519 ? 0.0 : 2.0;
    bool _3523 = _3517 >= 0.0;
    bool _3525 = isnan(_3517);
    bool _3527 = _3523 || _3525;
    bool _3529 = isnan(0.0);
    bool _3531 = _3527 || _3529;
    float _3533 = float(_3531);
    float _3535 = _3491 + _3521;
    float _3537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3539 = -_2937;
    float _3541 = fma(_3195, _3537, _3539);
    float _3543 = 1.0 / _3077;
    float _3545 = _3535 + _3533;
    bool _3547 = _3541 >= 0.0;
    bool _3549 = isnan(_3541);
    bool _3551 = _3547 || _3549;
    bool _3553 = isnan(0.0);
    bool _3555 = _3551 || _3553;
    float _3557 = float(_3555);
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3561 = -_2937;
    float _3563 = fma(_3543, _3559, _3561);
    bool _3565 = _3563 >= 0.0;
    bool _3567 = isnan(_3563);
    bool _3569 = _3565 || _3567;
    bool _3571 = isnan(0.0);
    bool _3573 = _3569 || _3571;
    float _3575 = float(_3573);
    float _3577 = _3545 + _3575;
    float _3579 = 1.0 / _3099;
    float _3581 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3583 = -_2937;
    float _3585 = fma(_3579, _3581, _3583);
    bool _3587 = _3585 >= 0.0;
    bool _3589 = isnan(_3585);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan(0.0);
    bool _3595 = _3591 || _3593;
    bool _3597 = !_3595;
    float _3599 = _3597 ? 0.0 : 2.0;
    float _3601 = _3577 + _3599;
    float _3603 = 1.0 / _3135;
    float _3605 = _3601 + _3557;
    float _3607 = 1.0 / _3181;
    float _3609 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3611 = -_2937;
    float _3613 = fma(_3603, _3609, _3611);
    bool _3615 = _3613 >= 0.0;
    bool _3617 = isnan(_3613);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan(0.0);
    bool _3623 = _3619 || _3621;
    float _3625 = 1.0 / _3139;
    float _3627 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3629 = -_2937;
    float _3631 = fma(_3607, _3627, _3629);
    float _3633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3635 = -_2937;
    float _3637 = fma(_3625, _3633, _3635);
    bool _3639 = _3637 >= 0.0;
    bool _3641 = isnan(_3637);
    bool _3643 = _3639 || _3641;
    bool _3645 = isnan(0.0);
    bool _3647 = _3643 || _3645;
    float _3649 = 1.0 / _3163;
    float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3653 = -_2937;
    float _3655 = fma(_3649, _3651, _3653);
    bool _3657 = _3655 >= 0.0;
    bool _3659 = isnan(_3655);
    bool _3661 = _3657 || _3659;
    bool _3663 = isnan(0.0);
    bool _3665 = _3661 || _3663;
    float _3667 = 1.0 / _3169;
    bool _3669 = !_3665;
    float _3671 = _3669 ? 0.0 : 3.0;
    float _3673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3675 = -_2937;
    float _3677 = fma(_3667, _3673, _3675);
    bool _3679 = _3677 >= 0.0;
    bool _3681 = isnan(_3677);
    bool _3683 = _3679 || _3681;
    bool _3685 = isnan(0.0);
    bool _3687 = _3683 || _3685;
    float _3689 = 1.0 / _3173;
    bool _3691 = !_3687;
    float _3693 = _3691 ? 0.0 : 3.0;
    float _3695 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3697 = -_2937;
    float _3699 = fma(_3689, _3695, _3697);
    bool _3701 = _3699 >= 0.0;
    bool _3703 = isnan(_3699);
    bool _3705 = _3701 || _3703;
    bool _3707 = isnan(0.0);
    bool _3709 = _3705 || _3707;
    float _3711 = 1.0 / _3177;
    float _3713 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3715 = -_2937;
    float _3717 = fma(_3711, _3713, _3715);
    bool _3719 = _3717 >= 0.0;
    bool _3721 = isnan(_3717);
    bool _3723 = _3719 || _3721;
    bool _3725 = isnan(0.0);
    bool _3727 = _3723 || _3725;
    bool _3729 = !_3647;
    float _3731 = _3729 ? 0.0 : 3.0;
    bool _3733 = _3631 >= 0.0;
    bool _3735 = isnan(_3631);
    bool _3737 = _3733 || _3735;
    bool _3739 = isnan(0.0);
    bool _3741 = _3737 || _3739;
    bool _3743 = !_3727;
    float _3745 = _3743 ? 0.0 : 3.0;
    float _3747 = _3731 + _3671;
    bool _3749 = !_3709;
    float _3751 = _3749 ? 0.0 : 3.0;
    float _3753 = _3747 + _3693;
    bool _3755 = !_3741;
    float _3757 = _3755 ? 0.0 : 3.0;
    float _3759 = _3753 + _3751;
    bool _3761 = !_3623;
    float _3763 = _3761 ? 0.0 : 2.0;
    float _3765 = _3759 + _3745;
    float _3767 = _3605 + _3763;
    float _3769 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2917);
    float _3771 = _3765 + _3757;
    float _3773 = _3767 * 0.02857142873108386993408203125;
    float _3775 = precise::clamp(_3773, 0.0, 1.0);
    float _3777 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3769);
    float _3779 = 1.0 / _3189;
    float _3781 = _3777 + _2570;
    out.gl_Position.x = _2610;
    out.gl_Position.y = _2616;
    out.gl_Position.z = _3777;
    out.gl_Position.w = _2570;
    float _3783 = _3781 * 0.5;
    float _3785 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3787 = -_2937;
    float _3789 = fma(_3205, _3785, _3787);
    out.m_73.z = _3783;
    out.m_73.w = _2570;
    bool _3791 = _3789 >= 0.0;
    bool _3793 = isnan(_3789);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(0.0);
    bool _3799 = _3795 || _3797;
    float _3801 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3803 = -_2937;
    float _3805 = fma(_3779, _3801, _3803);
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3809 = -_2937;
    float _3811 = fma(_3219, _3807, _3809);
    bool _3813 = !_3799;
    float _3815 = _3813 ? 0.0 : 3.0;
    float _3817 = -_3225;
    float _3819 = _3817 + 1.0;
    bool _3821 = _3805 >= 0.0;
    bool _3823 = isnan(_3805);
    bool _3825 = _3821 || _3823;
    bool _3827 = isnan(0.0);
    bool _3829 = _3825 || _3827;
    bool _3831 = _3811 >= 0.0;
    bool _3833 = isnan(_3811);
    bool _3835 = _3831 || _3833;
    bool _3837 = isnan(0.0);
    bool _3839 = _3835 || _3837;
    float _3841 = _3771 + _3815;
    bool _3843 = !_3829;
    float _3845 = _3843 ? 0.0 : 3.0;
    float _3847 = _3819 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3849 = !_3839;
    float _3851 = _3849 ? 0.0 : 5.0;
    float _3853 = _3841 + _3845;
    float _3855 = _3847 * _2888;
    float _3857 = -_3847;
    float _3859 = _3857 + 1.0;
    float _3861 = _3853 + _3851;
    float _3863 = _2899 * _3855;
    float _3865 = _2909 * _3855;
    float _3867 = _3861 * 0.14285714924335479736328125;
    float _3869 = precise::clamp(_3867, 0.0, 1.0);
    float _3871 = fma(_2905, _3863, _2893);
    float _3873 = _3775 * _3869;
    float _3875 = _3873 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3877 = fma(_2907, _3863, _2895);
    float _3879 = _2899 * _3859;
    float _3881 = fma(_2899, _3865, _2897);
    float _3883 = _3875 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _3871;
    out.m_75.y = _3877;
    out.m_75.z = _3881;
    out.m_75.w = _3879;
    out.m_47.x = _3883;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1008 = false;
    bool _864 = false;
    bool _476 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    float _106 = _104;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3942 = as_type<float>(_112);
        out.gl_Position.z = _3942;
    }
    if (!_98)
    {
        return out;
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_94);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4012 = as_type<float>(_150);
        out.gl_Position.z = _4012;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_51.w;
    float _154 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _168, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _174);
    float _270 = fma(_264, _152, _172);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    int _276 = as_type<int>(_272);
    float _294;
    if (!_274)
    {
        float _278 = in.m_53.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_94);
        float _300 = 1.0 / _298;
        float _302 = _130 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _340;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _376 = 1.0 / _344;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = in.m_51.x;
    float _386 = in.m_51.y;
    float _388 = in.m_51.z;
    float _390 = _308 * _362;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = fma(_372, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _402 = fma(_394, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = _324 * _376;
    float _408 = _400 * _378;
    float _410 = _402 * _378;
    float _412 = _404 * _378;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _428 = fma(_416, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_420, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _434 = fma(_424, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _436 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _412);
    float _438 = fma(_428, _364, _426);
    float _440 = fma(_430, _364, _432);
    float _442 = fma(_434, _364, _436);
    float _444 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _438);
    float _446 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _440);
    float _448 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _442);
    float _450 = _444 * _384;
    float _452 = _446 * _386;
    float _454 = _448 * _388;
    bool _456 = !_374;
    float _474;
    if (!_456)
    {
        float _458 = in.m_53.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_94);
        float _480 = 1.0 / _478;
        float _482 = _130 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _502 = 1.0 / _488;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _512 = 1.0 / _492;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _516 = _484 + _514;
    bool _518 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _520 = isnan(_484);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = 1.0 / _496;
    float _532 = _516 * _502;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _484 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _540 = _484 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _544 = _484 + _542;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _548 = 1.0 / _506;
    float _550 = _536 * _512;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _554 = _484 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _558 = _484 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _560;
    float _564 = 1.0 / _500;
    float _566 = _540 * _530;
    bool _568 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _570 = isnan(_484);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = fma(_562, _532, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _582 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _584 = isnan(_484);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _510;
    float _596 = _554 * _548;
    float _598 = -_578;
    float _600 = _598 + 1.0;
    float _602 = -_592;
    float _604 = _602 + 1.0;
    float _606 = _592 * _600;
    float _608 = _544 * _564;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _614;
    float _618 = fma(_612, _532, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _620 = fma(_616, _532, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _622 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _624 = isnan(_484);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _558 * _594;
    bool _636 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _638 = isnan(_484);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_646;
    float _650 = _648 + 1.0;
    float _652 = _646 * _604;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _658 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _660 = isnan(_484);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _632 * _650;
    bool _672 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _674 = isnan(_484);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_632;
    float _686 = _684 + 1.0;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _696 = fma(_656, _550, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _698 = _528 * _686;
    float _700 = -_682;
    float _702 = _700 + 1.0;
    float _704 = -_528;
    float _706 = _704 + 1.0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _708;
    float _712 = fma(_690, _550, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _714 = _668 * _702;
    float _716 = _682 * _706;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _722;
    float _726 = fma(_694, _550, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _728 = _618 * _714;
    float _730 = _580 * _714;
    float _732 = -_668;
    float _734 = _732 + 1.0;
    float _736 = fma(_720, _566, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _738 = fma(_724, _566, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _740 = fma(_710, _566, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _742 = _620 * _714;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _756 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].z, _730);
    float _758 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].x, _728);
    float _760 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].y, _742);
    float _762 = fma(_746, _608, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _764 = fma(_750, _608, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _766 = fma(_754, _608, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _768 = fma(_726, _716, _756);
    float _770 = fma(_712, _716, _758);
    float _772 = fma(_696, _716, _760);
    float _774 = fma(_736, _698, _770);
    float _776 = fma(_740, _698, _768);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _782;
    float _786 = fma(_738, _698, _772);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _788;
    float _792 = fma(_762, _670, _774);
    float _794 = fma(_766, _670, _776);
    float _796 = fma(_780, _596, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _798 = fma(_784, _596, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _808 = fma(_790, _596, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _810 = fma(_764, _670, _786);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _816 = fma(_802, _634, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _818 = fma(_806, _634, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _820 = fma(_796, _652, _792);
    float _822 = fma(_814, _634, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _824 = fma(_798, _652, _810);
    float _826 = fma(_808, _652, _794);
    float _828 = fma(_816, _606, _820);
    float _830 = fma(_818, _606, _824);
    float _832 = fma(_822, _606, _826);
    float _834 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[113].x, _828);
    float _836 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[113].y, _830);
    float _838 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[113].z, _832);
    bool _840 = !_546;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _862;
    if (!_840)
    {
        float _846 = in.m_53.x;
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _850 = _846 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _854 = _852 * _848;
        float _856 = floor(_854);
        float _858 = -_856;
        float _860 = _854 + _858;
        _862 = _860;
        _864 = true;
    }
    else
    {
        float _866 = float(_94);
        float _868 = 1.0 / _866;
        float _870 = _130 * _868;
        _862 = _870;
    }
    _864 = false;
    float _872 = _862;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _876 = _872 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _882 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_872);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _898 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _900 = isnan(_872);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _910;
    bool _914 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _916 = isnan(_872);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = 1.0 / _880;
    float _928 = -_892;
    float _930 = _928 + 1.0;
    bool _932 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _934 = 1.0 / _896;
    float _936 = _912 * _926;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _942 = -_924;
    float _944 = _942 + 1.0;
    float _946 = fma(_936, _876, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _948 = _908 * _930;
    float _950 = -_908;
    float _952 = _950 + 1.0;
    float _954 = _892 * _944;
    float _956 = _940 * _934;
    float _958 = _946 * _948;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _962 = _872 + _960;
    float _964 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _966 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[115].x, _958);
    float _968 = fma(_956, _962, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _970 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _972 = fma(_968, _954, _966);
    float _974 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _976 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[117].x, _972);
    float _982 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _980 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _976;
    out.m_55.y = _982;
    out.m_55.z = _978;
    out.m_55.w = _984;
    bool _986 = !_932;
    int _988 = as_type<int>(_958);
    float _1006;
    if (!_986)
    {
        float _990 = in.m_53.x;
        float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _994 = _990 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _998 = _996 * _992;
        float _1000 = floor(_998);
        float _1002 = -_1000;
        float _1004 = _998 + _1002;
        _1006 = _1004;
        _1008 = true;
    }
    else
    {
        float _1010 = float(_94);
        float _1012 = 1.0 / _1010;
        float _1014 = _130 * _1012;
        _1006 = _1014;
        _102 = _1010;
    }
    _1008 = false;
    float _1016 = _1006;
    float _1018 = _102;
    float _1020 = in.m_57.x;
    float _1022 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1026 = _1024 != 0;
    float _1028 = in.m_53.w;
    float _1030 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1032 = in.m_57.y;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1036 = _1034 != 0;
    float _1038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1040 = in.m_53.z;
    float _1042 = _924;
    float _1044 = _1018;
    int _1046 = as_type<int>(_1030);
    if (_1026)
    {
        float _1048 = in.m_53.x;
        _1042 = _1048;
    }
    float _1050 = _1042;
    float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1054 = in.m_53.y;
    if (_1026)
    {
        float _1056 = -_1020;
        float _1058 = _1056 + 1.0;
        _988 = as_type<int>(_1058);
    }
    int _1060 = _988;
    if (!_1026)
    {
        _1044 = _1020;
    }
    float _1062 = _1044;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1066 = _1028 > 0.5;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1070 = _1040 > 0.5;
    bool _1072 = false;
    float _1074 = _1062;
    if (_1026)
    {
        bool _1076 = _1050 > 0.5;
        _1072 = _1076;
    }
    bool _1078 = _1072;
    if (_1026)
    {
        float _1080 = _1078 ? as_type<float>(_1060) : _1020;
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = -_1032;
    float _1086 = _1084 + 1.0;
    bool _1088 = _1054 > 0.5;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1092 = _1090 != 0;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1096 = _1094 != 0;
    int _1098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1100 = _1098 != 0;
    int _1102 = _1066 ? as_type<int>(_1086) : as_type<int>(_1032);
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1106 = _1104 != 0;
    float _1108 = _1096 ? as_type<float>(_1102) : _1032;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1110;
    int _1114 = _1070 ? as_type<int>(_1086) : as_type<int>(_1032);
    float _1116 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1118 = _1088 ? as_type<int>(_1086) : as_type<int>(_1032);
    float _1120 = 1.0 / _1112;
    float _1122 = _1036 ? as_type<float>(_1114) : _1032;
    float _1124 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1022);
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1132 = _1130 != 0;
    float _1134 = _1092 ? as_type<float>(_1118) : _1032;
    float _1136 = _1040 * 2.0;
    float _1138 = _1100 ? as_type<float>(_1114) : _1032;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1144 = _1142 != 0;
    float _1146 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1116);
    float _1148 = _1054 * 2.0;
    float _1150 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1030);
    float _1152 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1154 = _1150;
    if (_1106)
    {
        float _1156 = -_1020;
        float _1158 = _1156 + 1.0;
        _1046 = as_type<int>(_1158);
    }
    int _1160 = _1046;
    if (!_1106)
    {
        _842 = _1020;
    }
    float _1162 = _842;
    float _1164 = floor(_1136);
    float _1166 = fma(_1152, -2.0, _1140);
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1170 = _1016 + _1168;
    float _1172 = _1162;
    if (_1106)
    {
        float _1174 = _1070 ? as_type<float>(_1160) : _1020;
        _1172 = _1174;
    }
    float _1176 = _1172;
    float _1178 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1146);
    float _1180 = _1170 * _1120;
    int _1182 = as_type<int>(_1120);
    if (_1132)
    {
        float _1184 = -_1020;
        float _1186 = _1184 + 1.0;
        _1182 = as_type<int>(_1186);
    }
    int _1188 = _1182;
    float _1190 = floor(_1148);
    float _1192 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1150);
    float _1194 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1124);
    if (!_1132)
    {
        _1154 = _1020;
    }
    float _1196 = _1154;
    float _1198 = _1196;
    if (_1128)
    {
        float _1200 = -_1020;
        float _1202 = _1200 + 1.0;
        _276 = as_type<int>(_1202);
    }
    int _1204 = _276;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1208 = 1.0 + _1206;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_1132)
    {
        float _1212 = _1088 ? as_type<float>(_1188) : _1020;
        _1198 = _1212;
    }
    float _1214 = _1198;
    if (!_1128)
    {
        _844 = _1020;
    }
    float _1216 = _844;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1218;
    float _1222 = _1216;
    if (_1128)
    {
        float _1224 = _1088 ? as_type<float>(_1204) : _1020;
        _1222 = _1224;
    }
    float _1226 = _1222;
    bool _1228 = _1164 > 0.0;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _1232 = _1190 > 0.0;
    bool _1234 = _1190 >= 0.0;
    bool _1236 = isnan(_1190);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.0);
    bool _1242 = _1238 || _1240;
    float _1244 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1246 = _1164 >= 0.0;
    bool _1248 = isnan(_1164);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(0.0);
    bool _1254 = _1250 || _1252;
    float _1256 = fma(_1220, _1180, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1258 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1260 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1262 = _1220;
    if (_1144)
    {
        float _1264 = in.m_53.x;
        _1262 = _1264;
    }
    float _1266 = _1262;
    float _1268 = fma(_1134, _1244, -0.5);
    float _1270 = fma(_1108, _1258, -0.5);
    float _1272 = fma(_1138, _1260, -0.5);
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1276 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1278 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1280 = isnan(_1016);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1292;
    bool _1296 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1298 = isnan(_1016);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = -_1288;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_1122, _1276, -0.5);
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1314;
    float _1318 = fma(_1294, _1180, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1320 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1290);
    float _1322 = _1306 * _1310;
    float _1324 = fma(_1316, _1180, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1326 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1166);
    float _1328 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1320);
    float _1330 = _1256 * _1322;
    float _1332 = _1318 * _1322;
    float _1334 = -_1306;
    float _1336 = _1334 + 1.0;
    float _1338 = _1324 * _1322;
    float _1340 = -_1326;
    float _1342 = fma(_1328, _1268, _1340);
    float _1344 = _1328;
    int _1346 = as_type<int>(_1324);
    int _1348 = as_type<int>(_1332);
    float _1350 = _1338;
    if (_1144)
    {
        _1344 = _1054;
    }
    float _1352 = _1344;
    float _1354 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1332);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1338);
    float _1358 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1330);
    float _1360 = _1352;
    if (_1144)
    {
        _1346 = 0;
    }
    int _1362 = _1346;
    int _1364 = _1362;
    if (_1144)
    {
        _1348 = 0;
    }
    int _1366 = _1348;
    int _1368 = _1254 ? 0 : 1;
    int _1370 = _1242 ? 0 : 1;
    int _1372 = _1366;
    float _1374 = _1266;
    if (_1144)
    {
        _1350 = _1266;
    }
    float _1376 = _1350;
    float _1378 = _1376;
    if (!_1144)
    {
        float _1380 = in.m_53.x;
        float _1382 = _1054 * 3.1415927410125732421875;
        float _1384 = _1382 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1380 * 3.1415927410125732421875;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = _1392 * 6.283185482025146484375;
        float _1396 = sin(_1394);
        _1364 = 1;
        _1372 = 2;
        _1374 = _1380;
        _1378 = _1396;
        _1360 = _1388;
    }
    int _1398 = _1364;
    int _1400 = _1372;
    float _1402 = _1374;
    float _1404 = _1378;
    float _1406 = _1360;
    int _1408 = ~_1370;
    int _1410 = _1408 + 1;
    int _1412 = _1410 + 1;
    float _1414 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1416 = _1412;
    if (!_1232)
    {
        int _1418 = ~_1370;
        int _1420 = _1418 + 1;
        _1416 = _1420;
    }
    int _1422 = _1416;
    float _1424 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1428 = _1398 != 1;
    float _1430 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1358);
    bool _1432 = _1400 != 2;
    float _1434 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1356);
    float _1436 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1438 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1440 = ~_1368;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    float _1446 = fma(_1436, _1176, -0.5);
    int _1448 = _1444;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (!_1228)
    {
        int _1452 = ~_1368;
        int _1454 = _1452 + 1;
        _1448 = _1454;
    }
    int _1456 = _1448;
    float _1458 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1470 = _1468 != 0;
    float _1472 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1354);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1476 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1478 = fma(_1438, _1226, -0.5);
    float _1480 = fma(_1458, _1082, -0.5);
    float _1482 = -_1474;
    float _1484 = fma(_1476, 2.0, _1482);
    float _1486 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1490 = fma(_1486, _1214, -0.5);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1494 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1488);
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1498 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1502 = _1054 + _1402;
    float _1504 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1492);
    float _1506 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1508 = -_1496;
    float _1510 = fma(_1498, 2.0, _1508);
    float _1512 = _1502 + (-1.0);
    float _1514 = fma(_1506, -2.0, _1500);
    float _1516 = _1402 * 2.0;
    float _1518 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1522 = _1414 + _1520;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1526 = _1192 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1424 + _1528;
    float _1532 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1534 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1524);
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = _1526 + _1536;
    float _1540 = 0.0;
    float _1542 = _1532;
    float _1544 = _1516;
    float _1546 = _1490;
    if (!_1428)
    {
        _1540 = _1054;
    }
    float _1548 = _1540;
    float _1550 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1532);
    float _1552 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1534);
    float _1554 = -_130;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1484);
    float _1558 = floor(_1516);
    float _1560 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1550);
    float _1562 = _1550;
    float _1564 = _1548;
    if (!_1428)
    {
        _1562 = _1040;
    }
    float _1566 = _1562;
    float _1568 = fma(_1552, _1480, _1556);
    float _1570 = 0.0;
    float _1572 = _1566;
    if (!_1428)
    {
        _1570 = _1040;
    }
    float _1574 = _1570;
    float _1576 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1578 = _1574;
    if (!_1428)
    {
        _1450 = _1548;
    }
    float _1580 = _1450;
    float _1582 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1494);
    float _1584 = _1580;
    if (_1428)
    {
        _1572 = _1054;
    }
    float _1586 = _1572;
    float _1588 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1428)
    {
        _1578 = _1054;
    }
    float _1590 = _1578;
    float _1592 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1504);
    if (_1428)
    {
        _1584 = _1402;
    }
    float _1594 = _1584;
    if (_1428)
    {
        _1564 = _1402;
    }
    float _1596 = _1564;
    if (_1432)
    {
        _1542 = _1402;
    }
    float _1598 = _1542;
    float _1600 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1602 = _1598;
    if (_1432)
    {
        _1544 = _1054;
    }
    float _1604 = _1544;
    bool _1606 = _1558 > 0.0;
    bool _1608 = _1558 >= 0.0;
    bool _1610 = isnan(_1558);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan(0.0);
    bool _1616 = _1612 || _1614;
    float _1618 = _1430 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1620 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1622 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = _1604;
    if (!_1432)
    {
        _1602 = _1040;
    }
    float _1626 = _1602;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1432)
    {
        _1624 = _1402;
    }
    float _1630 = _1624;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1634 = _1560 >= 0.0;
    float _1636 = -_130;
    float _1638 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1510);
    float _1640 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1644 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1514);
    float _1646 = fma(_1582, _1490, _1638);
    out.m_61.x = _1622;
    out.m_61.y = _1588;
    out.m_61.z = _1640;
    out.m_61.w = _1632;
    float _1648 = -_1628;
    float _1650 = fma(_1642, 2.0, _1648);
    float _1652 = -_1644;
    float _1654 = fma(_1592, _1312, _1652);
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1634)
    {
        _1546 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1658 = _1546;
    float _1660 = _1646 + 0.5;
    float _1662 = _1654 + 0.5;
    int _1664 = as_type<int>(_1658);
    if (_1634)
    {
        out.m_47.x = 0.0;
    }
    if (_1634)
    {
        float _1666 = _1658 * 5.0;
        _1664 = as_type<int>(_1666);
    }
    int _1668 = _1664;
    out.m_63.x = _1660;
    out.m_63.y = _1662;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1672 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1656);
    float _1674 = -_130;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1650);
    if (_1634)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6537 = as_type<float>(_1668);
        out.gl_Position.z = _6537;
    }
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1680 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1670);
    float _1682 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1672);
    float _1684 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1678);
    float _1686 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1680);
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1690 = fma(_1682, _1478, _1676);
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1694 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1696 = -_1688;
    float _1698 = fma(_1600, 2.0, _1696);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1702 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1704 = fma(_1694, -2.0, _1692);
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1708 = -_130;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1698);
    float _1712 = fma(_1702, -2.0, _1700);
    float _1714 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1684);
    float _1716 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1706);
    float _1718 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1704);
    float _1720 = fma(_1686, _1446, _1710);
    float _1722 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1712);
    float _1724 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1726 = log2(_1724);
    float _1728 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1716);
    float _1730 = -_1718;
    float _1732 = fma(_1714, _1270, _1730);
    float _1734 = _1522 * _1522;
    bool _1736 = !_1462;
    int _1738 = _1736 ? 0 : 1;
    float _1740 = -_1722;
    float _1742 = fma(_1728, _1272, _1740);
    float _1744 = _1342 + 0.5;
    float _1746 = fma(_1530, _1530, _1734);
    int _1748 = abs(_1738);
    float _1750 = _1690 + 0.5;
    float _1752 = in.m_65.x;
    float _1754 = in.m_65.y;
    float _1756 = in.m_65.z;
    float _1758 = fma(_1538, _1538, _1746);
    float _1760 = _1568 + 0.5;
    float _1762 = _1720 + 0.5;
    float _1764 = _1732 + 0.5;
    float _1766 = _1742 + 0.5;
    float _1768 = _1726 * _130;
    float _1770 = rsqrt(_1758);
    int _1772 = _1616 ? 0 : 1;
    out.m_67.x = _1760;
    out.m_67.y = _1744;
    out.m_67.z = _1762;
    out.m_67.w = _1764;
    float _1774 = float(_1456);
    float _1776 = float(_1748);
    out.m_69.x = _1750;
    out.m_69.y = _1766;
    int _1778 = ~_1772;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    float _1784 = exp2(_1768);
    int _1786 = _1782;
    if (!_1606)
    {
        int _1788 = ~_1772;
        int _1790 = _1788 + 1;
        _1786 = _1790;
    }
    int _1792 = _1786;
    float _1794 = _1776 * _1774;
    bool _1796 = !_1466;
    int _1798 = _1796 ? 0 : 1;
    bool _1800 = !_1470;
    int _1802 = _1800 ? 0 : 1;
    float _1804 = _1522 * _1770;
    float _1806 = _1530 * _1770;
    if (_1634)
    {
        return out;
    }
    float _1808 = -_1804;
    float _1810 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1414);
    float _1812 = _1794 * (-2.0);
    float _1814 = _1402 + (-0.5);
    float _1816 = -_1806;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1822 = _1810 + _1820;
    float _1824 = fma(_1812, _1752, _1752);
    float _1826 = fma(_1518, _1812, _1518);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1830 = _1818 + _1828;
    float _1832 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1834 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1824);
    float _1836 = _1538 * _1770;
    int _1838 = abs(_1802);
    float _1840 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1832);
    int _1842 = abs(_1798);
    float _1844 = -_1836;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1526);
    float _1848 = float(_1422);
    float _1850 = 1.0 / _1208;
    bool _1852 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1854 = isnan(1.0);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1860 = _1856 || _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1864 = _1846 + _1862;
    float _1866 = float(_1838);
    float _1868 = -_1784;
    float _1870 = _1868 + 1.0;
    float _1872 = float(_1792);
    float _1874 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1840);
    bool _1876 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1878 = isnan(0.0);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1884 = _1880 || _1882;
    float _1886 = _1866 * _1848;
    float _1888 = float(_1842);
    float _1890 = _1040 + _1402;
    float _1892 = _1054 + _1040;
    float _1894 = _1884 ? _1870 : 0.0;
    float _1896 = _1886 * (-2.0);
    float _1898 = _1888 * _1872;
    float _1900 = _1890 + (-1.0);
    bool _1902 = _1874 >= 0.0;
    float _1904 = _1892 + (-1.0);
    float _1906 = _1898 * (-2.0);
    float _1908 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1910 = _1040 + (-0.5);
    float _1912 = fma(_1896, _1756, _1756);
    float _1914 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1916 = fma(_1906, _1754, _1754);
    float _1918 = _1054 + (-0.5);
    if (_1860)
    {
        float _1920 = _1894 * _1850;
        _132 = _1920;
    }
    float _1922 = _132;
    float _1924 = fma(_1908, _1896, _1908);
    float _1926 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1912);
    float _1928 = fma(_1914, _1906, _1914);
    float _1930 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1916);
    float _1932 = fma(_1826, _1922, _1834);
    float _1934 = fma(_1924, _1922, _1926);
    float _1936 = _1934;
    if (_1902)
    {
        out.m_47.x = 0.0;
    }
    float _1938 = fma(_1928, _1922, _1930);
    float _1940 = _1932 * 0.15915493667125701904296875;
    float _1942 = _1934 * 0.15915493667125701904296875;
    if (_1902)
    {
        _1936 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1944 = _1936;
    float _1946 = _1938 * 0.15915493667125701904296875;
    float _1948 = _1940 * 6.283185482025146484375;
    float _1950 = sin(_1948);
    int _1952 = as_type<int>(_1944);
    if (_1902)
    {
        float _1954 = _1944 * 5.0;
        _1952 = as_type<int>(_1954);
    }
    int _1956 = _1952;
    float _1958 = _1940 * 6.283185482025146484375;
    float _1960 = cos(_1958);
    if (_1902)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7005 = as_type<float>(_1956);
        out.gl_Position.z = _7005;
    }
    float _1962 = _1942 * 6.283185482025146484375;
    float _1964 = sin(_1962);
    float _1966 = _1946 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    if (_1902)
    {
        return out;
    }
    float _1970 = -_1414;
    float _1972 = _1970 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1974 = -_1424;
    float _1976 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1978 = -_1804;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _1982 = -_1526;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1986 = _1972 * _1972;
    float _1988 = -_1806;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1530);
    float _1992 = _1980 * _1980;
    float _1994 = -_1836;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1998 = fma(_1976, _1976, _1986);
    float _2000 = _1946 * 6.283185482025146484375;
    float _2002 = cos(_2000);
    float _2004 = fma(_1990, _1990, _1992);
    float _2006 = _1950 * _1968;
    float _2008 = fma(_1984, _1984, _1998);
    float _2010 = in.m_71.x;
    float _2012 = in.m_71.y;
    float _2014 = in.m_71.z;
    float _2016 = fma(_1996, _1996, _2004);
    float _2018 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2020 = _1942 * 6.283185482025146484375;
    float _2022 = cos(_2020);
    float _2024 = rsqrt(_2008);
    float _2026 = _1960 * _2002;
    float _2028 = fma(_1964, _2026, _2006);
    float _2030 = fma(_1964, _2006, _2026);
    float _2032 = sqrt(_2016);
    float _2034 = _1976 * _2024;
    float _2036 = _1984 * _2024;
    float _2038 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2042 = _2034 * _2040;
    float _2044 = _1770 * _2032;
    float _2046 = _1972 * _2024;
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2050 = _2036 * _2048;
    float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2054 = -_2042;
    float _2056 = fma(_2036, _2052, _2054);
    float _2058 = _2044 * _2038;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2062 = _2046 * _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2066 = -_2050;
    float _2068 = fma(_2046, _2064, _2066);
    float _2070 = _2056 * _2056;
    float _2072 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2076 = -_2062;
    float _2078 = fma(_2034, _2074, _2076);
    float _2080 = _1960 * _1968;
    float _2082 = fma(_2068, _2068, _2070);
    float _2084 = _1968 * _2022;
    float _2086 = fma(_2078, _2078, _2082);
    float _2088 = _2044 * _2018;
    float _2090 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2012);
    float _2092 = _2044 * _2072;
    float _2094 = _1950 * _2002;
    float _2096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2014);
    float _2098 = rsqrt(_2086);
    float _2100 = _2088 * _2090;
    float _2102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2010);
    float _2104 = -_2080;
    float _2106 = fma(_1964, _2094, _2104);
    float _2108 = -_2094;
    float _2110 = fma(_1964, _2080, _2108);
    float _2112 = -_2100;
    float _2114 = _1964 * _2112;
    float _2116 = _2092 * _2102;
    float _2118 = _2022 * _2100;
    float _2120 = _2058 * _2096;
    float _2122 = _2002 * _2022;
    float _2124 = _1960 * _2118;
    float _2126 = _1950 * _2118;
    float _2128 = fma(_2122, _2116, _2114);
    float _2130 = fma(_2028, _2116, _2124);
    float _2132 = _2068 * _2098;
    float _2134 = _2056 * _2098;
    float _2136 = fma(_2106, _2116, _2126);
    float _2138 = fma(_2110, _2120, _2130);
    float _2140 = _2046 * _2132;
    float _2142 = _2078 * _2098;
    float _2144 = _2036 * _2134;
    float _2146 = fma(_2084, _2120, _2128);
    float _2148 = -_2140;
    float _2150 = fma(_2034, _2134, _2148);
    float _2152 = fma(_2030, _2120, _2136);
    float _2154 = -_2144;
    float _2156 = fma(_2046, _2142, _2154);
    float _2158 = _2150 * _2138;
    float _2160 = _2156 * _2138;
    float _2162 = fma(_2142, _2146, _2158);
    float _2164 = fma(_2132, _2146, _2160);
    float _2166 = fma(_2036, _2152, _2162);
    float _2168 = fma(_2034, _2152, _2164);
    float _2170 = _2034 * _2142;
    float _2172 = _1526 + _2166;
    float _2174 = _1424 + _2168;
    float _2176 = -_2170;
    float _2178 = fma(_2036, _2132, _2176);
    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2182 = _2172 + _2180;
    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2186 = _2174 + _2184;
    float _2188 = _2178 * _2138;
    float _2190 = _2182 * _2182;
    float _2192 = fma(_2134, _2146, _2188);
    float _2194 = fma(_2186, _2186, _2190);
    float _2196 = fma(_2046, _2152, _2192);
    float _2198 = sqrt(_2194);
    float _2200 = _1414 + _2196;
    bool _2202 = _2198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2204 = _2142;
    float _2206 = _2138;
    float _2208 = _2190;
    float _2210 = _2194;
    float _2212 = _2188;
    if (!_2202)
    {
        _2204 = _2174;
    }
    float _2214 = _2204;
    float _2216 = _2214;
    if (!_2202)
    {
        _2206 = _2172;
    }
    float _2218 = _2206;
    float _2220 = _2218;
    if (!_2202)
    {
        _2208 = _2200;
    }
    float _2222 = _2208;
    bool _2224 = !_2202;
    float _2226 = _2222;
    if (!_2224)
    {
        float _2228 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2232 = _2198 + _2230;
        float _2234 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2236 = rsqrt(_2194);
        float _2238 = _2232 * _2228;
        float _2240 = _2238 * 0.15915493667125701904296875;
        float _2242 = _2240 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = _2240 * 6.283185482025146484375;
        float _2248 = cos(_2246);
        float _2250 = fma(_2244, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2252 = _2236 * _2250;
        float _2254 = _2248 + (-1.0);
        float _2256 = fma(_2186, _2252, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2258 = fma(_2182, _2252, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2260 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2262 = fma(_2200, _2248, _2260);
        _2226 = _2262;
        _2216 = _2256;
        _2220 = _2258;
        _2210 = _2236;
    }
    float _2264 = _2226;
    float _2266 = _2216;
    float _2268 = _2220;
    float _2270 = _2210;
    float _2272 = -_1804;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2264);
    float _2276 = -_1806;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2266);
    float _2280 = -_1836;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2268);
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2286 = _2274 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2290 = _2278 + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2294 = _2282 + _2292;
    float _2296 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2298 = _2286 * _2286;
    float _2300 = fma(_2290, _2290, _2298);
    float _2302 = fma(_2294, _2294, _2300);
    float _2304 = rsqrt(_2302);
    float _2306 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2308 = _2290 * _2306;
    float _2310 = _2294 * _2306;
    float _2312 = _2308 * _2308;
    float _2314 = _2310 * _2310;
    float _2316 = _2312 + _2314;
    float _2318 = sqrt(_2316);
    bool _2320 = _2318 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2324 = _2318 + _2322;
    float _2326 = _2294;
    float _2328 = _2316;
    float _2330 = _2324;
    float _2332 = _2286;
    float _2334 = _2306;
    if (_2320)
    {
        float _2336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2326 = _2336;
    }
    float _2338 = _2326;
    if (_2320)
    {
        float _2340 = rsqrt(_2316);
        _2328 = _2340;
    }
    float _2342 = _2328;
    if (_2320)
    {
        float _2344 = _2324 * _2338;
        _2330 = _2344;
    }
    float _2346 = _2330;
    if (_2320)
    {
        float _2348 = _2346 * 0.15915493667125701904296875;
        _2212 = _2348;
    }
    float _2350 = _2212;
    float _2352 = _2270;
    if (_2320)
    {
        float _2354 = _2350 * 6.283185482025146484375;
        float _2356 = sin(_2354);
        _2352 = _2356;
    }
    float _2358 = _2352;
    float _2360 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2362 = precise::max(0.0, _2360);
    float _2364 = _2304;
    float _2366 = _2360;
    if (_2320)
    {
        float _2368 = _2350 * 6.283185482025146484375;
        float _2370 = cos(_2368);
        _2364 = _2370;
    }
    float _2372 = _2364;
    float _2374 = -_2306;
    float _2376 = -_2362;
    float _2378 = fma(_2286, _2374, _2376);
    float _2380 = _2378;
    if (!_2320)
    {
        _2332 = _2308;
    }
    float _2382 = _2332;
    float _2384 = _2382;
    if (_2320)
    {
        float _2386 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2366 = _2386;
    }
    float _2388 = _2366;
    float _2390 = sqrt(_2302);
    float _2392 = _2388;
    float _2394 = _2358;
    if (_2320)
    {
        float _2396 = fma(_2358, _2388, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2392 = _2396;
    }
    float _2398 = _2392;
    float _2400 = _2398;
    float _2402 = _2372;
    if (_2320)
    {
        float _2404 = _2372 + (-1.0);
        _2334 = _2404;
    }
    float _2406 = _2334;
    float _2408 = _2406;
    if (_2320)
    {
        float _2410 = _2342 * _2398;
        _2394 = _2410;
    }
    float _2412 = _2394;
    float _2414 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_2320)
    {
        _2400 = _2310;
    }
    float _2416 = _2400;
    float _2418 = _2416;
    if (_2320)
    {
        float _2420 = _2406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2408 = _2420;
    }
    float _2422 = _2408;
    float _2424 = _2422;
    if (_2320)
    {
        float _2426 = _2308 * _2412;
        _2384 = _2426;
    }
    float _2428 = _2384;
    if (_2320)
    {
        float _2430 = _2310 * _2412;
        _2418 = _2430;
    }
    float _2432 = _2418;
    float _2434 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    if (_2320)
    {
        float _2436 = fma(_2378, _2372, _2422);
        _2380 = _2436;
    }
    float _2438 = _2380;
    if (!_2320)
    {
        _2424 = _2312;
    }
    float _2440 = _2424;
    float _2442 = _2440;
    if (_2320)
    {
        float _2444 = _2428 * _2428;
        _2442 = _2444;
    }
    float _2446 = _2442;
    float _2448 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2414);
    if (!_2320)
    {
        _2402 = _2314;
    }
    float _2450 = _2402;
    float _2452 = _2450;
    if (_2320)
    {
        float _2454 = _2432 * _2432;
        _2452 = _2454;
    }
    float _2456 = _2452;
    float _2458 = fma(_2438, _2438, _2446);
    float _2460 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[9].x, _2434);
    float _2462 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2448);
    float _2464 = _2458 + _2456;
    float _2466 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[9].z, _2460);
    float _2468 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2470 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2474 = fma(_2390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2472);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _2480 = _2468 * 0.5;
    float _2482 = rsqrt(_2464);
    float _2484 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2486 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2488 = fma(_2478, -0.5, _2480);
    float _2490 = -_2476;
    float _2492 = _2490 + 1.0;
    float _2494 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2484);
    float _2496 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2486);
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2500 = _2488 + _2498;
    float _2502 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2470);
    float _2504 = abs(_2492);
    float _2506 = log2(_2504);
    float _2508 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2296);
    float _2510 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2494);
    float _2512 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2502);
    float _2514 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2496);
    float _2516 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2508);
    float _2518 = _2482 * _2428;
    float _2520 = _2482 * _2438;
    float _2522 = _2512 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2524 = _2482 * _2432;
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2528 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2530 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2532 = -_2526;
    float _2534 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2532);
    float _2536 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2538 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2540 = -_2524;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2534);
    float _2544 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2546 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2548 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2550 = exp2(_2536);
    float _2552 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2544);
    float _2554 = fma(_2542, -0.5, 0.5);
    float _2556 = fma(_2542, 0.5, 0.5);
    float _2558 = -_2548;
    float _2560 = fma(_2558, _2546, 1.0);
    float _2562 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2552);
    float _2564 = _2520 + 1.0;
    float _2566 = fma(_2556, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2568 = sqrt(_2554);
    float _2570 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2562);
    float _2572 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2574 = fma(_2556, _2566, -0.212114393711090087890625);
    float _2576 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2578 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _2488);
    float _2580 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2582 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _2488);
    float _2584 = -_2520;
    float _2586 = fma(_2550, _2564, _2584);
    float _2588 = 1.0 / _2570;
    float _2590 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _2592 = fma(_2556, _2574, 1.570728778839111328125);
    float _2594 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2572);
    float _2596 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _2488);
    float _2598 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[8].x, _2590);
    float _2600 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2576);
    float _2602 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2594);
    float _2604 = 1.0 / _2468;
    float _2606 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[8].z, _2598);
    float _2608 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2600);
    float _2610 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2602);
    float _2612 = _2568 * 0.636619746685028076171875;
    float _2614 = _2606 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _2616 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2608);
    float _2618 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _2488);
    float _2620 = _2610 * _2588;
    float _2622 = -_2592;
    float _2624 = fma(_2612, _2622, 1.0);
    float _2626 = _2616 * _2588;
    float _2628 = _2614 + _2468;
    float _2630 = fma(_2620, 0.5, 0.5);
    float _2632 = fma(_2586, 0.5, 0.5);
    float _2634 = fma(_2626, -0.5, 0.5);
    float _2636 = _2628 * 0.5;
    float _2638 = _2488 * _2604;
    float _2640 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _2488);
    float _2642 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _2488);
    float _2644 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _2636);
    float _2646 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _2636);
    float _2648 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _2636);
    float _2650 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _2636);
    float _2652 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _2636);
    float _2654 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _2636);
    float _2656 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _2636);
    float _2658 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _2636);
    float _2660 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _2636);
    float _2662 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _2636);
    float _2664 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _2636);
    float _2666 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _2636);
    float _2668 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _2636);
    float _2670 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _2636);
    float _2672 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _2636);
    float _2674 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _2636);
    float _2676 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _2636);
    float _2678 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _2636);
    float _2680 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _2636);
    float _2682 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _2636);
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2686 = _2636 + _2684;
    float _2688 = _2636 * _2604;
    float _2690 = _2636 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2692 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _2488);
    float _2694 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _2488);
    float _2696 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _2488);
    float _2698 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _2488);
    float _2700 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _2488);
    float _2702 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _2488);
    float _2704 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _2488);
    float _2706 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _2488);
    float _2708 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _2488);
    float _2710 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _2488);
    float _2712 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _2488);
    float _2714 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _2488);
    float _2716 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _2488);
    float _2718 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _2488);
    float _2720 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _2488);
    float _2722 = _2644 * _2604;
    float _2724 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _2488);
    float _2726 = _2578 * _2604;
    float _2728 = _2640 * _2604;
    float _2730 = _2646 * _2604;
    float _2732 = _2686 * _2604;
    float2 _8315 = float2(_2722, _2726);
    float _2734 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8315, float2(0.0), isnan(_8315)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8315, float2(0.0), isnan(_8315)), level(0.0)).x;
    float _2736 = _2500 * _2604;
    float _2738 = _2580 * _2604;
    float2 _8331 = float2(_2730, _2728);
    float _2740 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8331, float2(0.0), isnan(_8331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8331, float2(0.0), isnan(_8331)), level(0.0)).x;
    float _2742 = _2582 * _2604;
    float2 _8342 = float2(_2732, _2638);
    float _2744 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8342, float2(0.0), isnan(_8342)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8342, float2(0.0), isnan(_8342)), level(0.0)).x;
    float _2746 = _2690 * _2604;
    float2 _8353 = float2(_2688, _2736);
    float _2748 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8353, float2(0.0), isnan(_8353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8353, float2(0.0), isnan(_8353)), level(0.0)).x;
    float2 _8361 = float2(_2688, _2738);
    float _2750 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8361, float2(0.0), isnan(_8361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8361, float2(0.0), isnan(_8361)), level(0.0)).x;
    float _2752 = _2648 * _2604;
    float2 _8372 = float2(_2730, _2742);
    float _2754 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8372, float2(0.0), isnan(_8372)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8372, float2(0.0), isnan(_8372)), level(0.0)).x;
    float _2756 = _2596 * _2604;
    float2 _8383 = float2(_2746, _2638);
    float _2758 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8383, float2(0.0), isnan(_8383)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8383, float2(0.0), isnan(_8383)), level(0.0)).x;
    float _2760 = _2650 * _2604;
    float _2762 = _2618 * _2604;
    float2 _8397 = float2(_2752, _2756);
    float _2764 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8397, float2(0.0), isnan(_8397)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8397, float2(0.0), isnan(_8397)), level(0.0)).x;
    float _2766 = _2652 * _2604;
    float _2768 = _2642 * _2604;
    float _2770 = log2(_2560);
    float2 _8413 = float2(_2760, _2762);
    float _2772 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8413, float2(0.0), isnan(_8413)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8413, float2(0.0), isnan(_8413)), level(0.0)).x;
    float _2774 = _2654 * _2604;
    float _2776 = _2718 * _2604;
    float2 _8427 = float2(_2766, _2638);
    float _2778 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8427, float2(0.0), isnan(_8427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8427, float2(0.0), isnan(_8427)), level(0.0)).x;
    float _2780 = _2692 * _2604;
    float2 _8438 = float2(_2774, _2768);
    float _2782 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8438, float2(0.0), isnan(_8438)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8438, float2(0.0), isnan(_8438)), level(0.0)).x;
    float2 _8446 = float2(_2688, _2726);
    float _2784 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8446, float2(0.0), isnan(_8446)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8446, float2(0.0), isnan(_8446)), level(0.0)).x;
    float _2786 = _2656 * _2604;
    float _2788 = _2694 * _2604;
    float _2790 = _2724 * _2604;
    float _2792 = _2658 * _2604;
    float _2794 = _2696 * _2604;
    float _2796 = _2698 * _2604;
    float _2798 = _2660 * _2604;
    float _2800 = _2662 * _2604;
    float _2802 = _2770 * 0.693147182464599609375;
    float _2804 = _2720 * _2604;
    float _2806 = _2702 * _2604;
    float2 _8486 = float2(_2688, _2756);
    float _2808 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8486, float2(0.0), isnan(_8486)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8486, float2(0.0), isnan(_8486)), level(0.0)).x;
    float2 _8494 = float2(_2774, _2780);
    float _2810 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8494, float2(0.0), isnan(_8494)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8494, float2(0.0), isnan(_8494)), level(0.0)).x;
    float _2812 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2814 = _2700 * _2604;
    float2 _8509 = float2(_2730, _2638);
    float _2816 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8509, float2(0.0), isnan(_8509)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8509, float2(0.0), isnan(_8509)), level(0.0)).x;
    float2 _8517 = float2(_2786, _2788);
    float _2818 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8517, float2(0.0), isnan(_8517)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8517, float2(0.0), isnan(_8517)), level(0.0)).x;
    float _2820 = _2704 * _2604;
    float _2822 = _2716 * _2604;
    float _2824 = _2664 * _2604;
    float2 _8534 = float2(_2792, _2794);
    float _2826 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8534, float2(0.0), isnan(_8534)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8534, float2(0.0), isnan(_8534)), level(0.0)).x;
    float2 _8542 = float2(_2798, _2638);
    float _2828 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8542, float2(0.0), isnan(_8542)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8542, float2(0.0), isnan(_8542)), level(0.0)).x;
    float2 _8550 = float2(_2800, _2796);
    float _2830 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8550, float2(0.0), isnan(_8550)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8550, float2(0.0), isnan(_8550)), level(0.0)).x;
    float2 _8558 = float2(_2688, _2814);
    float _2832 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8558, float2(0.0), isnan(_8558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8558, float2(0.0), isnan(_8558)), level(0.0)).x;
    float2 _8566 = float2(_2688, _2806);
    float _2834 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8566, float2(0.0), isnan(_8566)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8566, float2(0.0), isnan(_8566)), level(0.0)).x;
    float2 _8574 = float2(_2800, _2820);
    float _2836 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8574, float2(0.0), isnan(_8574)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8574, float2(0.0), isnan(_8574)), level(0.0)).x;
    float2 _8582 = float2(_2824, _2638);
    float _2838 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8582, float2(0.0), isnan(_8582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8582, float2(0.0), isnan(_8582)), level(0.0)).x;
    float _2840 = _2666 * _2604;
    float _2842 = _2668 * _2604;
    float _2844 = _2706 * _2604;
    float _2846 = _2670 * _2604;
    float _2848 = _2708 * _2604;
    float _2850 = _2672 * _2604;
    float _2852 = _2710 * _2604;
    float _2854 = _2674 * _2604;
    float _2856 = _2712 * _2604;
    float _2858 = _2676 * _2604;
    float _2860 = _2714 * _2604;
    float _2862 = _2678 * _2604;
    float2 _8626 = float2(_2840, _2844);
    float _2864 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8626, float2(0.0), isnan(_8626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8626, float2(0.0), isnan(_8626)), level(0.0)).x;
    float2 _8634 = float2(_2842, _2848);
    float _2866 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8634, float2(0.0), isnan(_8634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8634, float2(0.0), isnan(_8634)), level(0.0)).x;
    float2 _8642 = float2(_2846, _2852);
    float _2868 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8642, float2(0.0), isnan(_8642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8642, float2(0.0), isnan(_8642)), level(0.0)).x;
    float2 _8650 = float2(_2850, _2856);
    float _2870 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8650, float2(0.0), isnan(_8650)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8650, float2(0.0), isnan(_8650)), level(0.0)).x;
    float2 _8658 = float2(_2854, _2860);
    float _2872 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8658, float2(0.0), isnan(_8658)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8658, float2(0.0), isnan(_8658)), level(0.0)).x;
    float2 _8666 = float2(_2858, _2822);
    float _2874 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8666, float2(0.0), isnan(_8666)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8666, float2(0.0), isnan(_8666)), level(0.0)).x;
    float2 _8674 = float2(_2862, _2776);
    float _2876 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8674, float2(0.0), isnan(_8674)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8674, float2(0.0), isnan(_8674)), level(0.0)).x;
    float _2878 = _2680 * _2604;
    float _2880 = _2682 * _2604;
    float2 _8688 = float2(_2878, _2804);
    float _2882 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8688, float2(0.0), isnan(_8688)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8688, float2(0.0), isnan(_8688)), level(0.0)).x;
    float2 _8696 = float2(_2880, _2790);
    float _2884 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8696, float2(0.0), isnan(_8696)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8696, float2(0.0), isnan(_8696)), level(0.0)).x;
    float2 _8704 = float2(_2688, _2638);
    float _2886 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8704, float2(0.0), isnan(_8704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8704, float2(0.0), isnan(_8704)), level(0.0)).x;
    float3 _8713 = float3(_2630, _2634, _2812);
    float _2888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8713, float3(0.0), isnan(_8713)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8713, float3(0.0), isnan(_8713)), level(0.0)).x;
    float3 _8724 = float3(_2630, _2634, _2812);
    float4 _2891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8724, float3(0.0), isnan(_8724)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8724, float3(0.0), isnan(_8724)), level(0.0)).xyzw;
    float _2893 = _2891.x;
    float _2895 = _2891.y;
    float _2897 = _2891.z;
    float _2899 = _2891.w;
    float2 _8740 = float2(_2624, _2632);
    float3 _2903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8740, float2(0.0), isnan(_8740)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8740, float2(0.0), isnan(_8740)), level(0.0)).xyz;
    float _2905 = _2903.x;
    float _2907 = _2903.y;
    float _2909 = _2903.z;
    float _2911 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2913 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2915 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2911);
    float _2917 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2913);
    float _2919 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2915);
    float _2921 = _2919 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2923 = _2921 + _2468;
    float _2925 = _2923 * _2604;
    float _2927 = _2925 * 0.5;
    float _2929 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2931 = fma(_2927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2929);
    float _2933 = 1.0 / _2931;
    float _2935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2937 = _2933 * _2935;
    float _2939 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2941 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2939);
    float _2943 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2945 = fma(_2740, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2943);
    float _2947 = 1.0 / _2941;
    float _2949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2951 = fma(_2744, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2949);
    float _2953 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2955 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2953);
    float _2957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2959 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2957);
    float _2961 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2963 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2961);
    float _2965 = 1.0 / _2951;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2969 = fma(_2758, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2967);
    float _2971 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2973 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2971);
    float _2975 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2977 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2975);
    float _2979 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2981 = -_2937;
    float _2983 = fma(_2947, _2979, _2981);
    float _2985 = 1.0 / _2955;
    float _2987 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2989 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2987);
    float _2991 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2993 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2991);
    bool _2995 = _2983 >= 0.0;
    bool _2997 = isnan(_2983);
    bool _2999 = _2995 || _2997;
    bool _3001 = isnan(0.0);
    bool _3003 = _2999 || _3001;
    float _3005 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3007 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3005);
    float _3009 = 1.0 / _2945;
    float _3011 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3013 = -_2937;
    float _3015 = fma(_2985, _3011, _3013);
    float _3017 = 1.0 / _2969;
    float _3019 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3021 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3019);
    float _3023 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3025 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3023);
    float _3027 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3029 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3027);
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3033 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3031);
    float _3035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3037 = -_2937;
    float _3039 = fma(_3009, _3035, _3037);
    float _3041 = 1.0 / _2989;
    float _3043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3045 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3043);
    float _3047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3049 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3047);
    float _3051 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3053 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3051);
    bool _3055 = _3039 >= 0.0;
    bool _3057 = isnan(_3039);
    bool _3059 = _3055 || _3057;
    bool _3061 = isnan(0.0);
    bool _3063 = _3059 || _3061;
    float _3065 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3067 = -_2937;
    float _3069 = fma(_2965, _3065, _3067);
    float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3073 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3071);
    float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3077 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3075);
    bool _3079 = !_3063;
    float _3081 = _3079 ? 0.0 : 2.0;
    float _3083 = 1.0 / _3007;
    bool _3085 = _3069 >= 0.0;
    bool _3087 = isnan(_3069);
    bool _3089 = _3085 || _3087;
    bool _3091 = isnan(0.0);
    bool _3093 = _3089 || _3091;
    float _3095 = float(_3093);
    float _3097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3099 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3097);
    bool _3101 = !_3003;
    float _3103 = _3101 ? 0.0 : 2.0;
    float _3105 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3107 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3105);
    float _3109 = _3103 + _3095;
    bool _3111 = _3015 >= 0.0;
    bool _3113 = isnan(_3015);
    bool _3115 = _3111 || _3113;
    bool _3117 = isnan(0.0);
    bool _3119 = _3115 || _3117;
    float _3121 = float(_3119);
    float _3123 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3125 = -_2937;
    float _3127 = fma(_3017, _3123, _3125);
    float _3129 = 1.0 / _3049;
    float _3131 = _3109 + _3081;
    float _3133 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3135 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3133);
    float _3137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3139 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3137);
    bool _3141 = _3127 >= 0.0;
    bool _3143 = isnan(_3127);
    bool _3145 = _3141 || _3143;
    bool _3147 = isnan(0.0);
    bool _3149 = _3145 || _3147;
    float _3151 = float(_3149);
    float _3153 = _3131 + _3121;
    float _3155 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3157 = -_2937;
    float _3159 = fma(_3041, _3155, _3157);
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3163 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3161);
    float _3165 = 1.0 / _2959;
    float _3167 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3169 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3167);
    float _3171 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3173 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3171);
    float _3175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3177 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3175);
    float _3179 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3181 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3179);
    float _3183 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3185 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3183);
    float _3187 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3189 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3187);
    float _3191 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3193 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3191);
    float _3195 = 1.0 / _3107;
    float _3197 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3199 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3201 = -_2937;
    float _3203 = fma(_3165, _3199, _3201);
    float _3205 = 1.0 / _3185;
    bool _3207 = _3203 >= 0.0;
    bool _3209 = isnan(_3203);
    bool _3211 = _3207 || _3209;
    bool _3213 = isnan(0.0);
    bool _3215 = _3211 || _3213;
    float _3217 = float(_3215);
    float _3219 = 1.0 / _3193;
    float _3221 = _3153 + _3217;
    float _3223 = 1.0 / _2963;
    float _3225 = exp2(_3197);
    float _3227 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3229 = -_2937;
    float _3231 = fma(_3223, _3227, _3229);
    bool _3233 = _3231 >= 0.0;
    bool _3235 = isnan(_3231);
    bool _3237 = _3233 || _3235;
    bool _3239 = isnan(0.0);
    bool _3241 = _3237 || _3239;
    bool _3243 = !_3241;
    float _3245 = _3243 ? 0.0 : 2.0;
    float _3247 = _3221 + _3245;
    float _3249 = 1.0 / _2973;
    float _3251 = _3247 + _3151;
    float _3253 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3255 = -_2937;
    float _3257 = fma(_3249, _3253, _3255);
    bool _3259 = _3257 >= 0.0;
    bool _3261 = isnan(_3257);
    bool _3263 = _3259 || _3261;
    bool _3265 = isnan(0.0);
    bool _3267 = _3263 || _3265;
    float _3269 = 1.0 / _2977;
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3273 = -_2937;
    float _3275 = fma(_3269, _3271, _3273);
    bool _3277 = _3275 >= 0.0;
    bool _3279 = isnan(_3275);
    bool _3281 = _3277 || _3279;
    bool _3283 = isnan(0.0);
    bool _3285 = _3281 || _3283;
    bool _3287 = !_3267;
    float _3289 = _3287 ? 0.0 : 2.0;
    bool _3291 = !_3285;
    float _3293 = _3291 ? 0.0 : 2.0;
    float _3295 = _3251 + _3289;
    bool _3297 = _3159 >= 0.0;
    bool _3299 = isnan(_3159);
    bool _3301 = _3297 || _3299;
    bool _3303 = isnan(0.0);
    bool _3305 = _3301 || _3303;
    float _3307 = float(_3305);
    float _3309 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3311 = -_2937;
    float _3313 = fma(_3083, _3309, _3311);
    float _3315 = _3295 + _3293;
    float _3317 = 1.0 / _3021;
    float _3319 = _3315 + _3307;
    float _3321 = 1.0 / _2993;
    float _3323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3325 = -_2937;
    float _3327 = fma(_3317, _3323, _3325);
    bool _3329 = _3313 >= 0.0;
    bool _3331 = isnan(_3313);
    bool _3333 = _3329 || _3331;
    bool _3335 = isnan(0.0);
    bool _3337 = _3333 || _3335;
    float _3339 = float(_3337);
    float _3341 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3343 = -_2937;
    float _3345 = fma(_3321, _3341, _3343);
    bool _3347 = _3345 >= 0.0;
    bool _3349 = isnan(_3345);
    bool _3351 = _3347 || _3349;
    bool _3353 = isnan(0.0);
    bool _3355 = _3351 || _3353;
    bool _3357 = !_3355;
    float _3359 = _3357 ? 0.0 : 2.0;
    float _3361 = _3319 + _3359;
    bool _3363 = _3327 >= 0.0;
    bool _3365 = isnan(_3327);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = float(_3371);
    float _3375 = _3361 + _3339;
    float _3377 = 1.0 / _3029;
    float _3379 = _3375 + _3373;
    float _3381 = 1.0 / _3025;
    float _3383 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3385 = -_2937;
    float _3387 = fma(_3377, _3383, _3385);
    bool _3389 = _3387 >= 0.0;
    bool _3391 = isnan(_3387);
    bool _3393 = _3389 || _3391;
    bool _3395 = isnan(0.0);
    bool _3397 = _3393 || _3395;
    float _3399 = float(_3397);
    float _3401 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3403 = -_2937;
    float _3405 = fma(_3129, _3401, _3403);
    float _3407 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3409 = -_2937;
    float _3411 = fma(_3381, _3407, _3409);
    bool _3413 = _3411 >= 0.0;
    bool _3415 = isnan(_3411);
    bool _3417 = _3413 || _3415;
    bool _3419 = isnan(0.0);
    bool _3421 = _3417 || _3419;
    bool _3423 = !_3421;
    float _3425 = _3423 ? 0.0 : 2.0;
    float _3427 = _3379 + _3425;
    float _3429 = 1.0 / _3033;
    float _3431 = _3427 + _3399;
    float _3433 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3435 = -_2937;
    float _3437 = fma(_3429, _3433, _3435);
    bool _3439 = _3437 >= 0.0;
    bool _3441 = isnan(_3437);
    bool _3443 = _3439 || _3441;
    bool _3445 = isnan(0.0);
    bool _3447 = _3443 || _3445;
    float _3449 = 1.0 / _3045;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3453 = -_2937;
    float _3455 = fma(_3449, _3451, _3453);
    bool _3457 = _3455 >= 0.0;
    bool _3459 = isnan(_3455);
    bool _3461 = _3457 || _3459;
    bool _3463 = isnan(0.0);
    bool _3465 = _3461 || _3463;
    bool _3467 = !_3447;
    float _3469 = _3467 ? 0.0 : 2.0;
    bool _3471 = !_3465;
    float _3473 = _3471 ? 0.0 : 2.0;
    float _3475 = _3431 + _3469;
    bool _3477 = _3405 >= 0.0;
    bool _3479 = isnan(_3405);
    bool _3481 = _3477 || _3479;
    bool _3483 = isnan(0.0);
    bool _3485 = _3481 || _3483;
    float _3487 = float(_3485);
    float _3489 = _3475 + _3473;
    float _3491 = _3489 + _3487;
    float _3493 = 1.0 / _3053;
    float _3495 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3497 = -_2937;
    float _3499 = fma(_3493, _3495, _3497);
    bool _3501 = _3499 >= 0.0;
    bool _3503 = isnan(_3499);
    bool _3505 = _3501 || _3503;
    bool _3507 = isnan(0.0);
    bool _3509 = _3505 || _3507;
    float _3511 = 1.0 / _3073;
    float _3513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3515 = -_2937;
    float _3517 = fma(_3511, _3513, _3515);
    bool _3519 = !_3509;
    float _3521 = _3519 ? 0.0 : 2.0;
    bool _3523 = _3517 >= 0.0;
    bool _3525 = isnan(_3517);
    bool _3527 = _3523 || _3525;
    bool _3529 = isnan(0.0);
    bool _3531 = _3527 || _3529;
    float _3533 = float(_3531);
    float _3535 = _3491 + _3521;
    float _3537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3539 = -_2937;
    float _3541 = fma(_3195, _3537, _3539);
    float _3543 = 1.0 / _3077;
    float _3545 = _3535 + _3533;
    bool _3547 = _3541 >= 0.0;
    bool _3549 = isnan(_3541);
    bool _3551 = _3547 || _3549;
    bool _3553 = isnan(0.0);
    bool _3555 = _3551 || _3553;
    float _3557 = float(_3555);
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3561 = -_2937;
    float _3563 = fma(_3543, _3559, _3561);
    bool _3565 = _3563 >= 0.0;
    bool _3567 = isnan(_3563);
    bool _3569 = _3565 || _3567;
    bool _3571 = isnan(0.0);
    bool _3573 = _3569 || _3571;
    float _3575 = float(_3573);
    float _3577 = _3545 + _3575;
    float _3579 = 1.0 / _3099;
    float _3581 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3583 = -_2937;
    float _3585 = fma(_3579, _3581, _3583);
    bool _3587 = _3585 >= 0.0;
    bool _3589 = isnan(_3585);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan(0.0);
    bool _3595 = _3591 || _3593;
    bool _3597 = !_3595;
    float _3599 = _3597 ? 0.0 : 2.0;
    float _3601 = _3577 + _3599;
    float _3603 = 1.0 / _3135;
    float _3605 = _3601 + _3557;
    float _3607 = 1.0 / _3181;
    float _3609 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3611 = -_2937;
    float _3613 = fma(_3603, _3609, _3611);
    bool _3615 = _3613 >= 0.0;
    bool _3617 = isnan(_3613);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan(0.0);
    bool _3623 = _3619 || _3621;
    float _3625 = 1.0 / _3139;
    float _3627 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3629 = -_2937;
    float _3631 = fma(_3607, _3627, _3629);
    float _3633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3635 = -_2937;
    float _3637 = fma(_3625, _3633, _3635);
    bool _3639 = _3637 >= 0.0;
    bool _3641 = isnan(_3637);
    bool _3643 = _3639 || _3641;
    bool _3645 = isnan(0.0);
    bool _3647 = _3643 || _3645;
    float _3649 = 1.0 / _3163;
    float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3653 = -_2937;
    float _3655 = fma(_3649, _3651, _3653);
    bool _3657 = _3655 >= 0.0;
    bool _3659 = isnan(_3655);
    bool _3661 = _3657 || _3659;
    bool _3663 = isnan(0.0);
    bool _3665 = _3661 || _3663;
    float _3667 = 1.0 / _3169;
    bool _3669 = !_3665;
    float _3671 = _3669 ? 0.0 : 3.0;
    float _3673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3675 = -_2937;
    float _3677 = fma(_3667, _3673, _3675);
    bool _3679 = _3677 >= 0.0;
    bool _3681 = isnan(_3677);
    bool _3683 = _3679 || _3681;
    bool _3685 = isnan(0.0);
    bool _3687 = _3683 || _3685;
    float _3689 = 1.0 / _3173;
    bool _3691 = !_3687;
    float _3693 = _3691 ? 0.0 : 3.0;
    float _3695 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3697 = -_2937;
    float _3699 = fma(_3689, _3695, _3697);
    bool _3701 = _3699 >= 0.0;
    bool _3703 = isnan(_3699);
    bool _3705 = _3701 || _3703;
    bool _3707 = isnan(0.0);
    bool _3709 = _3705 || _3707;
    float _3711 = 1.0 / _3177;
    float _3713 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3715 = -_2937;
    float _3717 = fma(_3711, _3713, _3715);
    bool _3719 = _3717 >= 0.0;
    bool _3721 = isnan(_3717);
    bool _3723 = _3719 || _3721;
    bool _3725 = isnan(0.0);
    bool _3727 = _3723 || _3725;
    bool _3729 = !_3647;
    float _3731 = _3729 ? 0.0 : 3.0;
    bool _3733 = _3631 >= 0.0;
    bool _3735 = isnan(_3631);
    bool _3737 = _3733 || _3735;
    bool _3739 = isnan(0.0);
    bool _3741 = _3737 || _3739;
    bool _3743 = !_3727;
    float _3745 = _3743 ? 0.0 : 3.0;
    float _3747 = _3731 + _3671;
    bool _3749 = !_3709;
    float _3751 = _3749 ? 0.0 : 3.0;
    float _3753 = _3747 + _3693;
    bool _3755 = !_3741;
    float _3757 = _3755 ? 0.0 : 3.0;
    float _3759 = _3753 + _3751;
    bool _3761 = !_3623;
    float _3763 = _3761 ? 0.0 : 2.0;
    float _3765 = _3759 + _3745;
    float _3767 = _3605 + _3763;
    float _3769 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2917);
    float _3771 = _3765 + _3757;
    float _3773 = _3767 * 0.02857142873108386993408203125;
    float _3775 = precise::clamp(_3773, 0.0, 1.0);
    float _3777 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3769);
    float _3779 = 1.0 / _3189;
    float _3781 = _3777 + _2570;
    out.gl_Position.x = _2610;
    out.gl_Position.y = _2616;
    out.gl_Position.z = _3777;
    out.gl_Position.w = _2570;
    float _3783 = _3781 * 0.5;
    float _3785 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3787 = -_2937;
    float _3789 = fma(_3205, _3785, _3787);
    out.m_73.z = _3783;
    out.m_73.w = _2570;
    bool _3791 = _3789 >= 0.0;
    bool _3793 = isnan(_3789);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(0.0);
    bool _3799 = _3795 || _3797;
    float _3801 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3803 = -_2937;
    float _3805 = fma(_3779, _3801, _3803);
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3809 = -_2937;
    float _3811 = fma(_3219, _3807, _3809);
    bool _3813 = !_3799;
    float _3815 = _3813 ? 0.0 : 3.0;
    float _3817 = -_3225;
    float _3819 = _3817 + 1.0;
    bool _3821 = _3805 >= 0.0;
    bool _3823 = isnan(_3805);
    bool _3825 = _3821 || _3823;
    bool _3827 = isnan(0.0);
    bool _3829 = _3825 || _3827;
    bool _3831 = _3811 >= 0.0;
    bool _3833 = isnan(_3811);
    bool _3835 = _3831 || _3833;
    bool _3837 = isnan(0.0);
    bool _3839 = _3835 || _3837;
    float _3841 = _3771 + _3815;
    bool _3843 = !_3829;
    float _3845 = _3843 ? 0.0 : 3.0;
    float _3847 = _3819 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3849 = !_3839;
    float _3851 = _3849 ? 0.0 : 5.0;
    float _3853 = _3841 + _3845;
    float _3855 = _3847 * _2888;
    float _3857 = -_3847;
    float _3859 = _3857 + 1.0;
    float _3861 = _3853 + _3851;
    float _3863 = _2899 * _3855;
    float _3865 = _2909 * _3855;
    float _3867 = _3861 * 0.14285714924335479736328125;
    float _3869 = precise::clamp(_3867, 0.0, 1.0);
    float _3871 = fma(_2905, _3863, _2893);
    float _3873 = _3775 * _3869;
    float _3875 = _3873 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3877 = fma(_2907, _3863, _2895);
    float _3879 = _2899 * _3859;
    float _3881 = fma(_2899, _3865, _2897);
    float _3883 = _3875 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _3871;
    out.m_75.y = _3877;
    out.m_75.z = _3881;
    out.m_75.w = _3879;
    out.m_47.x = _3883;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1008 = false;
    bool _864 = false;
    bool _476 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    float _106 = _104;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3942 = as_type<float>(_112);
        out.gl_Position.z = _3942;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_94);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4012 = as_type<float>(_150);
        out.gl_Position.z = _4012;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_51.w;
    float _154 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _168, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _174);
    float _270 = fma(_264, _152, _172);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    int _276 = as_type<int>(_272);
    float _294;
    if (!_274)
    {
        float _278 = in.m_53.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_94);
        float _300 = 1.0 / _298;
        float _302 = _130 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _340;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _376 = 1.0 / _344;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = in.m_51.x;
    float _386 = in.m_51.y;
    float _388 = in.m_51.z;
    float _390 = _308 * _362;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = fma(_372, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _402 = fma(_394, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = _324 * _376;
    float _408 = _400 * _378;
    float _410 = _402 * _378;
    float _412 = _404 * _378;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _428 = fma(_416, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_420, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _434 = fma(_424, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _436 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _412);
    float _438 = fma(_428, _364, _426);
    float _440 = fma(_430, _364, _432);
    float _442 = fma(_434, _364, _436);
    float _444 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _438);
    float _446 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _440);
    float _448 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _442);
    float _450 = _444 * _384;
    float _452 = _446 * _386;
    float _454 = _448 * _388;
    bool _456 = !_374;
    float _474;
    if (!_456)
    {
        float _458 = in.m_53.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_94);
        float _480 = 1.0 / _478;
        float _482 = _130 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _502 = 1.0 / _488;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _512 = 1.0 / _492;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _516 = _484 + _514;
    bool _518 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _520 = isnan(_484);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = 1.0 / _496;
    float _532 = _516 * _502;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _484 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _540 = _484 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _544 = _484 + _542;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _548 = 1.0 / _506;
    float _550 = _536 * _512;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _554 = _484 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _558 = _484 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _560;
    float _564 = 1.0 / _500;
    float _566 = _540 * _530;
    bool _568 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _570 = isnan(_484);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = fma(_562, _532, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _582 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _584 = isnan(_484);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _510;
    float _596 = _554 * _548;
    float _598 = -_578;
    float _600 = _598 + 1.0;
    float _602 = -_592;
    float _604 = _602 + 1.0;
    float _606 = _592 * _600;
    float _608 = _544 * _564;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _614;
    float _618 = fma(_612, _532, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _620 = fma(_616, _532, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _622 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _624 = isnan(_484);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _558 * _594;
    bool _636 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _638 = isnan(_484);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_646;
    float _650 = _648 + 1.0;
    float _652 = _646 * _604;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _658 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _660 = isnan(_484);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _632 * _650;
    bool _672 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _674 = isnan(_484);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_632;
    float _686 = _684 + 1.0;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _696 = fma(_656, _550, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _698 = _528 * _686;
    float _700 = -_682;
    float _702 = _700 + 1.0;
    float _704 = -_528;
    float _706 = _704 + 1.0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _708;
    float _712 = fma(_690, _550, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _714 = _668 * _702;
    float _716 = _682 * _706;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _722;
    float _726 = fma(_694, _550, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _728 = _618 * _714;
    float _730 = _580 * _714;
    float _732 = -_668;
    float _734 = _732 + 1.0;
    float _736 = fma(_720, _566, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _738 = fma(_724, _566, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _740 = fma(_710, _566, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _742 = _620 * _714;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _756 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].z, _730);
    float _758 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].x, _728);
    float _760 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].y, _742);
    float _762 = fma(_746, _608, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _764 = fma(_750, _608, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _766 = fma(_754, _608, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _768 = fma(_726, _716, _756);
    float _770 = fma(_712, _716, _758);
    float _772 = fma(_696, _716, _760);
    float _774 = fma(_736, _698, _770);
    float _776 = fma(_740, _698, _768);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _782;
    float _786 = fma(_738, _698, _772);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _788;
    float _792 = fma(_762, _670, _774);
    float _794 = fma(_766, _670, _776);
    float _796 = fma(_780, _596, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _798 = fma(_784, _596, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _808 = fma(_790, _596, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _810 = fma(_764, _670, _786);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _816 = fma(_802, _634, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _818 = fma(_806, _634, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _820 = fma(_796, _652, _792);
    float _822 = fma(_814, _634, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _824 = fma(_798, _652, _810);
    float _826 = fma(_808, _652, _794);
    float _828 = fma(_816, _606, _820);
    float _830 = fma(_818, _606, _824);
    float _832 = fma(_822, _606, _826);
    float _834 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[113].x, _828);
    float _836 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[113].y, _830);
    float _838 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[113].z, _832);
    bool _840 = !_546;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _862;
    if (!_840)
    {
        float _846 = in.m_53.x;
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _850 = _846 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _854 = _852 * _848;
        float _856 = floor(_854);
        float _858 = -_856;
        float _860 = _854 + _858;
        _862 = _860;
        _864 = true;
    }
    else
    {
        float _866 = float(_94);
        float _868 = 1.0 / _866;
        float _870 = _130 * _868;
        _862 = _870;
    }
    _864 = false;
    float _872 = _862;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _876 = _872 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _882 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_872);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _898 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _900 = isnan(_872);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _910;
    bool _914 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _916 = isnan(_872);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = 1.0 / _880;
    float _928 = -_892;
    float _930 = _928 + 1.0;
    bool _932 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _934 = 1.0 / _896;
    float _936 = _912 * _926;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _942 = -_924;
    float _944 = _942 + 1.0;
    float _946 = fma(_936, _876, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _948 = _908 * _930;
    float _950 = -_908;
    float _952 = _950 + 1.0;
    float _954 = _892 * _944;
    float _956 = _940 * _934;
    float _958 = _946 * _948;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _962 = _872 + _960;
    float _964 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _966 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[115].x, _958);
    float _968 = fma(_956, _962, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _970 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _972 = fma(_968, _954, _966);
    float _974 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _976 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[117].x, _972);
    float _982 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _980 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _976;
    out.m_55.y = _982;
    out.m_55.z = _978;
    out.m_55.w = _984;
    bool _986 = !_932;
    int _988 = as_type<int>(_958);
    float _1006;
    if (!_986)
    {
        float _990 = in.m_53.x;
        float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _994 = _990 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _998 = _996 * _992;
        float _1000 = floor(_998);
        float _1002 = -_1000;
        float _1004 = _998 + _1002;
        _1006 = _1004;
        _1008 = true;
    }
    else
    {
        float _1010 = float(_94);
        float _1012 = 1.0 / _1010;
        float _1014 = _130 * _1012;
        _1006 = _1014;
        _102 = _1010;
    }
    _1008 = false;
    float _1016 = _1006;
    float _1018 = _102;
    float _1020 = in.m_57.x;
    float _1022 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1026 = _1024 != 0;
    float _1028 = in.m_53.w;
    float _1030 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1032 = in.m_57.y;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1036 = _1034 != 0;
    float _1038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1040 = in.m_53.z;
    float _1042 = _924;
    float _1044 = _1018;
    int _1046 = as_type<int>(_1030);
    if (_1026)
    {
        float _1048 = in.m_53.x;
        _1042 = _1048;
    }
    float _1050 = _1042;
    float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1054 = in.m_53.y;
    if (_1026)
    {
        float _1056 = -_1020;
        float _1058 = _1056 + 1.0;
        _988 = as_type<int>(_1058);
    }
    int _1060 = _988;
    if (!_1026)
    {
        _1044 = _1020;
    }
    float _1062 = _1044;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1066 = _1028 > 0.5;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1070 = _1040 > 0.5;
    bool _1072 = false;
    float _1074 = _1062;
    if (_1026)
    {
        bool _1076 = _1050 > 0.5;
        _1072 = _1076;
    }
    bool _1078 = _1072;
    if (_1026)
    {
        float _1080 = _1078 ? as_type<float>(_1060) : _1020;
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = -_1032;
    float _1086 = _1084 + 1.0;
    bool _1088 = _1054 > 0.5;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1092 = _1090 != 0;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1096 = _1094 != 0;
    int _1098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1100 = _1098 != 0;
    int _1102 = _1066 ? as_type<int>(_1086) : as_type<int>(_1032);
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1106 = _1104 != 0;
    float _1108 = _1096 ? as_type<float>(_1102) : _1032;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1110;
    int _1114 = _1070 ? as_type<int>(_1086) : as_type<int>(_1032);
    float _1116 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1118 = _1088 ? as_type<int>(_1086) : as_type<int>(_1032);
    float _1120 = 1.0 / _1112;
    float _1122 = _1036 ? as_type<float>(_1114) : _1032;
    float _1124 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1022);
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1132 = _1130 != 0;
    float _1134 = _1092 ? as_type<float>(_1118) : _1032;
    float _1136 = _1040 * 2.0;
    float _1138 = _1100 ? as_type<float>(_1114) : _1032;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1144 = _1142 != 0;
    float _1146 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1116);
    float _1148 = _1054 * 2.0;
    float _1150 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1030);
    float _1152 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1154 = _1150;
    if (_1106)
    {
        float _1156 = -_1020;
        float _1158 = _1156 + 1.0;
        _1046 = as_type<int>(_1158);
    }
    int _1160 = _1046;
    if (!_1106)
    {
        _842 = _1020;
    }
    float _1162 = _842;
    float _1164 = floor(_1136);
    float _1166 = fma(_1152, -2.0, _1140);
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1170 = _1016 + _1168;
    float _1172 = _1162;
    if (_1106)
    {
        float _1174 = _1070 ? as_type<float>(_1160) : _1020;
        _1172 = _1174;
    }
    float _1176 = _1172;
    float _1178 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1146);
    float _1180 = _1170 * _1120;
    int _1182 = as_type<int>(_1120);
    if (_1132)
    {
        float _1184 = -_1020;
        float _1186 = _1184 + 1.0;
        _1182 = as_type<int>(_1186);
    }
    int _1188 = _1182;
    float _1190 = floor(_1148);
    float _1192 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1150);
    float _1194 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1124);
    if (!_1132)
    {
        _1154 = _1020;
    }
    float _1196 = _1154;
    float _1198 = _1196;
    if (_1128)
    {
        float _1200 = -_1020;
        float _1202 = _1200 + 1.0;
        _276 = as_type<int>(_1202);
    }
    int _1204 = _276;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1208 = 1.0 + _1206;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_1132)
    {
        float _1212 = _1088 ? as_type<float>(_1188) : _1020;
        _1198 = _1212;
    }
    float _1214 = _1198;
    if (!_1128)
    {
        _844 = _1020;
    }
    float _1216 = _844;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1218;
    float _1222 = _1216;
    if (_1128)
    {
        float _1224 = _1088 ? as_type<float>(_1204) : _1020;
        _1222 = _1224;
    }
    float _1226 = _1222;
    bool _1228 = _1164 > 0.0;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _1232 = _1190 > 0.0;
    bool _1234 = _1190 >= 0.0;
    bool _1236 = isnan(_1190);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.0);
    bool _1242 = _1238 || _1240;
    float _1244 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1246 = _1164 >= 0.0;
    bool _1248 = isnan(_1164);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(0.0);
    bool _1254 = _1250 || _1252;
    float _1256 = fma(_1220, _1180, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1258 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1260 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1262 = _1220;
    if (_1144)
    {
        float _1264 = in.m_53.x;
        _1262 = _1264;
    }
    float _1266 = _1262;
    float _1268 = fma(_1134, _1244, -0.5);
    float _1270 = fma(_1108, _1258, -0.5);
    float _1272 = fma(_1138, _1260, -0.5);
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1276 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1278 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1280 = isnan(_1016);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1292;
    bool _1296 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1298 = isnan(_1016);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = -_1288;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_1122, _1276, -0.5);
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1314;
    float _1318 = fma(_1294, _1180, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1320 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1290);
    float _1322 = _1306 * _1310;
    float _1324 = fma(_1316, _1180, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1326 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1166);
    float _1328 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1320);
    float _1330 = _1256 * _1322;
    float _1332 = _1318 * _1322;
    float _1334 = -_1306;
    float _1336 = _1334 + 1.0;
    float _1338 = _1324 * _1322;
    float _1340 = -_1326;
    float _1342 = fma(_1328, _1268, _1340);
    float _1344 = _1328;
    int _1346 = as_type<int>(_1324);
    int _1348 = as_type<int>(_1332);
    float _1350 = _1338;
    if (_1144)
    {
        _1344 = _1054;
    }
    float _1352 = _1344;
    float _1354 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1332);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1338);
    float _1358 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1330);
    float _1360 = _1352;
    if (_1144)
    {
        _1346 = 0;
    }
    int _1362 = _1346;
    int _1364 = _1362;
    if (_1144)
    {
        _1348 = 0;
    }
    int _1366 = _1348;
    int _1368 = _1254 ? 0 : 1;
    int _1370 = _1242 ? 0 : 1;
    int _1372 = _1366;
    float _1374 = _1266;
    if (_1144)
    {
        _1350 = _1266;
    }
    float _1376 = _1350;
    float _1378 = _1376;
    if (!_1144)
    {
        float _1380 = in.m_53.x;
        float _1382 = _1054 * 3.1415927410125732421875;
        float _1384 = _1382 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1380 * 3.1415927410125732421875;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = _1392 * 6.283185482025146484375;
        float _1396 = sin(_1394);
        _1364 = 1;
        _1372 = 2;
        _1374 = _1380;
        _1378 = _1396;
        _1360 = _1388;
    }
    int _1398 = _1364;
    int _1400 = _1372;
    float _1402 = _1374;
    float _1404 = _1378;
    float _1406 = _1360;
    int _1408 = ~_1370;
    int _1410 = _1408 + 1;
    int _1412 = _1410 + 1;
    float _1414 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1416 = _1412;
    if (!_1232)
    {
        int _1418 = ~_1370;
        int _1420 = _1418 + 1;
        _1416 = _1420;
    }
    int _1422 = _1416;
    float _1424 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1428 = _1398 != 1;
    float _1430 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1358);
    bool _1432 = _1400 != 2;
    float _1434 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1356);
    float _1436 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1438 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1440 = ~_1368;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    float _1446 = fma(_1436, _1176, -0.5);
    int _1448 = _1444;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (!_1228)
    {
        int _1452 = ~_1368;
        int _1454 = _1452 + 1;
        _1448 = _1454;
    }
    int _1456 = _1448;
    float _1458 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1470 = _1468 != 0;
    float _1472 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1354);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1476 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1478 = fma(_1438, _1226, -0.5);
    float _1480 = fma(_1458, _1082, -0.5);
    float _1482 = -_1474;
    float _1484 = fma(_1476, 2.0, _1482);
    float _1486 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1490 = fma(_1486, _1214, -0.5);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1494 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1488);
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1498 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1502 = _1054 + _1402;
    float _1504 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1492);
    float _1506 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1508 = -_1496;
    float _1510 = fma(_1498, 2.0, _1508);
    float _1512 = _1502 + (-1.0);
    float _1514 = fma(_1506, -2.0, _1500);
    float _1516 = _1402 * 2.0;
    float _1518 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1522 = _1414 + _1520;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1526 = _1192 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1424 + _1528;
    float _1532 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1534 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1524);
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = _1526 + _1536;
    float _1540 = 0.0;
    float _1542 = _1532;
    float _1544 = _1516;
    float _1546 = _1490;
    if (!_1428)
    {
        _1540 = _1054;
    }
    float _1548 = _1540;
    float _1550 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1532);
    float _1552 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1534);
    float _1554 = -_130;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1484);
    float _1558 = floor(_1516);
    float _1560 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1550);
    float _1562 = _1550;
    float _1564 = _1548;
    if (!_1428)
    {
        _1562 = _1040;
    }
    float _1566 = _1562;
    float _1568 = fma(_1552, _1480, _1556);
    float _1570 = 0.0;
    float _1572 = _1566;
    if (!_1428)
    {
        _1570 = _1040;
    }
    float _1574 = _1570;
    float _1576 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1578 = _1574;
    if (!_1428)
    {
        _1450 = _1548;
    }
    float _1580 = _1450;
    float _1582 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1494);
    float _1584 = _1580;
    if (_1428)
    {
        _1572 = _1054;
    }
    float _1586 = _1572;
    float _1588 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1428)
    {
        _1578 = _1054;
    }
    float _1590 = _1578;
    float _1592 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1504);
    if (_1428)
    {
        _1584 = _1402;
    }
    float _1594 = _1584;
    if (_1428)
    {
        _1564 = _1402;
    }
    float _1596 = _1564;
    if (_1432)
    {
        _1542 = _1402;
    }
    float _1598 = _1542;
    float _1600 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1602 = _1598;
    if (_1432)
    {
        _1544 = _1054;
    }
    float _1604 = _1544;
    bool _1606 = _1558 > 0.0;
    bool _1608 = _1558 >= 0.0;
    bool _1610 = isnan(_1558);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan(0.0);
    bool _1616 = _1612 || _1614;
    float _1618 = _1430 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1620 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1622 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = _1604;
    if (!_1432)
    {
        _1602 = _1040;
    }
    float _1626 = _1602;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1432)
    {
        _1624 = _1402;
    }
    float _1630 = _1624;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1634 = _1560 >= 0.0;
    float _1636 = -_130;
    float _1638 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1510);
    float _1640 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1644 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1514);
    float _1646 = fma(_1582, _1490, _1638);
    out.m_61.x = _1622;
    out.m_61.y = _1588;
    out.m_61.z = _1640;
    out.m_61.w = _1632;
    float _1648 = -_1628;
    float _1650 = fma(_1642, 2.0, _1648);
    float _1652 = -_1644;
    float _1654 = fma(_1592, _1312, _1652);
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1634)
    {
        _1546 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1658 = _1546;
    float _1660 = _1646 + 0.5;
    float _1662 = _1654 + 0.5;
    int _1664 = as_type<int>(_1658);
    if (_1634)
    {
        out.m_47.x = 0.0;
    }
    if (_1634)
    {
        float _1666 = _1658 * 5.0;
        _1664 = as_type<int>(_1666);
    }
    int _1668 = _1664;
    out.m_63.x = _1660;
    out.m_63.y = _1662;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1672 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1656);
    float _1674 = -_130;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1650);
    if (_1634)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6537 = as_type<float>(_1668);
        out.gl_Position.z = _6537;
    }
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1680 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1670);
    float _1682 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1672);
    float _1684 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1678);
    float _1686 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1680);
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1690 = fma(_1682, _1478, _1676);
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1694 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1696 = -_1688;
    float _1698 = fma(_1600, 2.0, _1696);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1702 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1704 = fma(_1694, -2.0, _1692);
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1708 = -_130;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1698);
    float _1712 = fma(_1702, -2.0, _1700);
    float _1714 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1684);
    float _1716 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1706);
    float _1718 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1704);
    float _1720 = fma(_1686, _1446, _1710);
    float _1722 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1712);
    float _1724 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1726 = log2(_1724);
    float _1728 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1716);
    float _1730 = -_1718;
    float _1732 = fma(_1714, _1270, _1730);
    float _1734 = _1522 * _1522;
    bool _1736 = !_1462;
    int _1738 = _1736 ? 0 : 1;
    float _1740 = -_1722;
    float _1742 = fma(_1728, _1272, _1740);
    float _1744 = _1342 + 0.5;
    float _1746 = fma(_1530, _1530, _1734);
    int _1748 = abs(_1738);
    float _1750 = _1690 + 0.5;
    float _1752 = in.m_65.x;
    float _1754 = in.m_65.y;
    float _1756 = in.m_65.z;
    float _1758 = fma(_1538, _1538, _1746);
    float _1760 = _1568 + 0.5;
    float _1762 = _1720 + 0.5;
    float _1764 = _1732 + 0.5;
    float _1766 = _1742 + 0.5;
    float _1768 = _1726 * _130;
    float _1770 = rsqrt(_1758);
    int _1772 = _1616 ? 0 : 1;
    out.m_67.x = _1760;
    out.m_67.y = _1744;
    out.m_67.z = _1762;
    out.m_67.w = _1764;
    float _1774 = float(_1456);
    float _1776 = float(_1748);
    out.m_69.x = _1750;
    out.m_69.y = _1766;
    int _1778 = ~_1772;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    float _1784 = exp2(_1768);
    int _1786 = _1782;
    if (!_1606)
    {
        int _1788 = ~_1772;
        int _1790 = _1788 + 1;
        _1786 = _1790;
    }
    int _1792 = _1786;
    float _1794 = _1776 * _1774;
    bool _1796 = !_1466;
    int _1798 = _1796 ? 0 : 1;
    bool _1800 = !_1470;
    int _1802 = _1800 ? 0 : 1;
    float _1804 = _1522 * _1770;
    float _1806 = _1530 * _1770;
    if (_1634)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1808 = -_1804;
    float _1810 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1414);
    float _1812 = _1794 * (-2.0);
    float _1814 = _1402 + (-0.5);
    float _1816 = -_1806;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1822 = _1810 + _1820;
    float _1824 = fma(_1812, _1752, _1752);
    float _1826 = fma(_1518, _1812, _1518);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1830 = _1818 + _1828;
    float _1832 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1834 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1824);
    float _1836 = _1538 * _1770;
    int _1838 = abs(_1802);
    float _1840 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1832);
    int _1842 = abs(_1798);
    float _1844 = -_1836;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1526);
    float _1848 = float(_1422);
    float _1850 = 1.0 / _1208;
    bool _1852 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1854 = isnan(1.0);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1860 = _1856 || _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1864 = _1846 + _1862;
    float _1866 = float(_1838);
    float _1868 = -_1784;
    float _1870 = _1868 + 1.0;
    float _1872 = float(_1792);
    float _1874 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1840);
    bool _1876 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1878 = isnan(0.0);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1884 = _1880 || _1882;
    float _1886 = _1866 * _1848;
    float _1888 = float(_1842);
    float _1890 = _1040 + _1402;
    float _1892 = _1054 + _1040;
    float _1894 = _1884 ? _1870 : 0.0;
    float _1896 = _1886 * (-2.0);
    float _1898 = _1888 * _1872;
    float _1900 = _1890 + (-1.0);
    bool _1902 = _1874 >= 0.0;
    float _1904 = _1892 + (-1.0);
    float _1906 = _1898 * (-2.0);
    float _1908 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1910 = _1040 + (-0.5);
    float _1912 = fma(_1896, _1756, _1756);
    float _1914 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1916 = fma(_1906, _1754, _1754);
    float _1918 = _1054 + (-0.5);
    if (_1860)
    {
        float _1920 = _1894 * _1850;
        _132 = _1920;
    }
    float _1922 = _132;
    float _1924 = fma(_1908, _1896, _1908);
    float _1926 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1912);
    float _1928 = fma(_1914, _1906, _1914);
    float _1930 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1916);
    float _1932 = fma(_1826, _1922, _1834);
    float _1934 = fma(_1924, _1922, _1926);
    float _1936 = _1934;
    if (_1902)
    {
        out.m_47.x = 0.0;
    }
    float _1938 = fma(_1928, _1922, _1930);
    float _1940 = _1932 * 0.15915493667125701904296875;
    float _1942 = _1934 * 0.15915493667125701904296875;
    if (_1902)
    {
        _1936 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1944 = _1936;
    float _1946 = _1938 * 0.15915493667125701904296875;
    float _1948 = _1940 * 6.283185482025146484375;
    float _1950 = sin(_1948);
    int _1952 = as_type<int>(_1944);
    if (_1902)
    {
        float _1954 = _1944 * 5.0;
        _1952 = as_type<int>(_1954);
    }
    int _1956 = _1952;
    float _1958 = _1940 * 6.283185482025146484375;
    float _1960 = cos(_1958);
    if (_1902)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7005 = as_type<float>(_1956);
        out.gl_Position.z = _7005;
    }
    float _1962 = _1942 * 6.283185482025146484375;
    float _1964 = sin(_1962);
    float _1966 = _1946 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    if (_1902)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1970 = -_1414;
    float _1972 = _1970 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1974 = -_1424;
    float _1976 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1978 = -_1804;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _1982 = -_1526;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1986 = _1972 * _1972;
    float _1988 = -_1806;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1530);
    float _1992 = _1980 * _1980;
    float _1994 = -_1836;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1998 = fma(_1976, _1976, _1986);
    float _2000 = _1946 * 6.283185482025146484375;
    float _2002 = cos(_2000);
    float _2004 = fma(_1990, _1990, _1992);
    float _2006 = _1950 * _1968;
    float _2008 = fma(_1984, _1984, _1998);
    float _2010 = in.m_71.x;
    float _2012 = in.m_71.y;
    float _2014 = in.m_71.z;
    float _2016 = fma(_1996, _1996, _2004);
    float _2018 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2020 = _1942 * 6.283185482025146484375;
    float _2022 = cos(_2020);
    float _2024 = rsqrt(_2008);
    float _2026 = _1960 * _2002;
    float _2028 = fma(_1964, _2026, _2006);
    float _2030 = fma(_1964, _2006, _2026);
    float _2032 = sqrt(_2016);
    float _2034 = _1976 * _2024;
    float _2036 = _1984 * _2024;
    float _2038 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2042 = _2034 * _2040;
    float _2044 = _1770 * _2032;
    float _2046 = _1972 * _2024;
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2050 = _2036 * _2048;
    float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2054 = -_2042;
    float _2056 = fma(_2036, _2052, _2054);
    float _2058 = _2044 * _2038;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2062 = _2046 * _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2066 = -_2050;
    float _2068 = fma(_2046, _2064, _2066);
    float _2070 = _2056 * _2056;
    float _2072 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2076 = -_2062;
    float _2078 = fma(_2034, _2074, _2076);
    float _2080 = _1960 * _1968;
    float _2082 = fma(_2068, _2068, _2070);
    float _2084 = _1968 * _2022;
    float _2086 = fma(_2078, _2078, _2082);
    float _2088 = _2044 * _2018;
    float _2090 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2012);
    float _2092 = _2044 * _2072;
    float _2094 = _1950 * _2002;
    float _2096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2014);
    float _2098 = rsqrt(_2086);
    float _2100 = _2088 * _2090;
    float _2102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2010);
    float _2104 = -_2080;
    float _2106 = fma(_1964, _2094, _2104);
    float _2108 = -_2094;
    float _2110 = fma(_1964, _2080, _2108);
    float _2112 = -_2100;
    float _2114 = _1964 * _2112;
    float _2116 = _2092 * _2102;
    float _2118 = _2022 * _2100;
    float _2120 = _2058 * _2096;
    float _2122 = _2002 * _2022;
    float _2124 = _1960 * _2118;
    float _2126 = _1950 * _2118;
    float _2128 = fma(_2122, _2116, _2114);
    float _2130 = fma(_2028, _2116, _2124);
    float _2132 = _2068 * _2098;
    float _2134 = _2056 * _2098;
    float _2136 = fma(_2106, _2116, _2126);
    float _2138 = fma(_2110, _2120, _2130);
    float _2140 = _2046 * _2132;
    float _2142 = _2078 * _2098;
    float _2144 = _2036 * _2134;
    float _2146 = fma(_2084, _2120, _2128);
    float _2148 = -_2140;
    float _2150 = fma(_2034, _2134, _2148);
    float _2152 = fma(_2030, _2120, _2136);
    float _2154 = -_2144;
    float _2156 = fma(_2046, _2142, _2154);
    float _2158 = _2150 * _2138;
    float _2160 = _2156 * _2138;
    float _2162 = fma(_2142, _2146, _2158);
    float _2164 = fma(_2132, _2146, _2160);
    float _2166 = fma(_2036, _2152, _2162);
    float _2168 = fma(_2034, _2152, _2164);
    float _2170 = _2034 * _2142;
    float _2172 = _1526 + _2166;
    float _2174 = _1424 + _2168;
    float _2176 = -_2170;
    float _2178 = fma(_2036, _2132, _2176);
    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2182 = _2172 + _2180;
    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2186 = _2174 + _2184;
    float _2188 = _2178 * _2138;
    float _2190 = _2182 * _2182;
    float _2192 = fma(_2134, _2146, _2188);
    float _2194 = fma(_2186, _2186, _2190);
    float _2196 = fma(_2046, _2152, _2192);
    float _2198 = sqrt(_2194);
    float _2200 = _1414 + _2196;
    bool _2202 = _2198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2204 = _2142;
    float _2206 = _2138;
    float _2208 = _2190;
    float _2210 = _2194;
    float _2212 = _2188;
    if (!_2202)
    {
        _2204 = _2174;
    }
    float _2214 = _2204;
    float _2216 = _2214;
    if (!_2202)
    {
        _2206 = _2172;
    }
    float _2218 = _2206;
    float _2220 = _2218;
    if (!_2202)
    {
        _2208 = _2200;
    }
    float _2222 = _2208;
    bool _2224 = !_2202;
    float _2226 = _2222;
    if (!_2224)
    {
        float _2228 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2232 = _2198 + _2230;
        float _2234 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2236 = rsqrt(_2194);
        float _2238 = _2232 * _2228;
        float _2240 = _2238 * 0.15915493667125701904296875;
        float _2242 = _2240 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = _2240 * 6.283185482025146484375;
        float _2248 = cos(_2246);
        float _2250 = fma(_2244, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2252 = _2236 * _2250;
        float _2254 = _2248 + (-1.0);
        float _2256 = fma(_2186, _2252, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2258 = fma(_2182, _2252, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2260 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2262 = fma(_2200, _2248, _2260);
        _2226 = _2262;
        _2216 = _2256;
        _2220 = _2258;
        _2210 = _2236;
    }
    float _2264 = _2226;
    float _2266 = _2216;
    float _2268 = _2220;
    float _2270 = _2210;
    float _2272 = -_1804;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2264);
    float _2276 = -_1806;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2266);
    float _2280 = -_1836;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2268);
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2286 = _2274 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2290 = _2278 + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2294 = _2282 + _2292;
    float _2296 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2298 = _2286 * _2286;
    float _2300 = fma(_2290, _2290, _2298);
    float _2302 = fma(_2294, _2294, _2300);
    float _2304 = rsqrt(_2302);
    float _2306 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2308 = _2290 * _2306;
    float _2310 = _2294 * _2306;
    float _2312 = _2308 * _2308;
    float _2314 = _2310 * _2310;
    float _2316 = _2312 + _2314;
    float _2318 = sqrt(_2316);
    bool _2320 = _2318 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2324 = _2318 + _2322;
    float _2326 = _2294;
    float _2328 = _2316;
    float _2330 = _2324;
    float _2332 = _2286;
    float _2334 = _2306;
    if (_2320)
    {
        float _2336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2326 = _2336;
    }
    float _2338 = _2326;
    if (_2320)
    {
        float _2340 = rsqrt(_2316);
        _2328 = _2340;
    }
    float _2342 = _2328;
    if (_2320)
    {
        float _2344 = _2324 * _2338;
        _2330 = _2344;
    }
    float _2346 = _2330;
    if (_2320)
    {
        float _2348 = _2346 * 0.15915493667125701904296875;
        _2212 = _2348;
    }
    float _2350 = _2212;
    float _2352 = _2270;
    if (_2320)
    {
        float _2354 = _2350 * 6.283185482025146484375;
        float _2356 = sin(_2354);
        _2352 = _2356;
    }
    float _2358 = _2352;
    float _2360 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2362 = precise::max(0.0, _2360);
    float _2364 = _2304;
    float _2366 = _2360;
    if (_2320)
    {
        float _2368 = _2350 * 6.283185482025146484375;
        float _2370 = cos(_2368);
        _2364 = _2370;
    }
    float _2372 = _2364;
    float _2374 = -_2306;
    float _2376 = -_2362;
    float _2378 = fma(_2286, _2374, _2376);
    float _2380 = _2378;
    if (!_2320)
    {
        _2332 = _2308;
    }
    float _2382 = _2332;
    float _2384 = _2382;
    if (_2320)
    {
        float _2386 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2366 = _2386;
    }
    float _2388 = _2366;
    float _2390 = sqrt(_2302);
    float _2392 = _2388;
    float _2394 = _2358;
    if (_2320)
    {
        float _2396 = fma(_2358, _2388, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2392 = _2396;
    }
    float _2398 = _2392;
    float _2400 = _2398;
    float _2402 = _2372;
    if (_2320)
    {
        float _2404 = _2372 + (-1.0);
        _2334 = _2404;
    }
    float _2406 = _2334;
    float _2408 = _2406;
    if (_2320)
    {
        float _2410 = _2342 * _2398;
        _2394 = _2410;
    }
    float _2412 = _2394;
    float _2414 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_2320)
    {
        _2400 = _2310;
    }
    float _2416 = _2400;
    float _2418 = _2416;
    if (_2320)
    {
        float _2420 = _2406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2408 = _2420;
    }
    float _2422 = _2408;
    float _2424 = _2422;
    if (_2320)
    {
        float _2426 = _2308 * _2412;
        _2384 = _2426;
    }
    float _2428 = _2384;
    if (_2320)
    {
        float _2430 = _2310 * _2412;
        _2418 = _2430;
    }
    float _2432 = _2418;
    float _2434 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    if (_2320)
    {
        float _2436 = fma(_2378, _2372, _2422);
        _2380 = _2436;
    }
    float _2438 = _2380;
    if (!_2320)
    {
        _2424 = _2312;
    }
    float _2440 = _2424;
    float _2442 = _2440;
    if (_2320)
    {
        float _2444 = _2428 * _2428;
        _2442 = _2444;
    }
    float _2446 = _2442;
    float _2448 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2414);
    if (!_2320)
    {
        _2402 = _2314;
    }
    float _2450 = _2402;
    float _2452 = _2450;
    if (_2320)
    {
        float _2454 = _2432 * _2432;
        _2452 = _2454;
    }
    float _2456 = _2452;
    float _2458 = fma(_2438, _2438, _2446);
    float _2460 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[9].x, _2434);
    float _2462 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2448);
    float _2464 = _2458 + _2456;
    float _2466 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[9].z, _2460);
    float _2468 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2470 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2474 = fma(_2390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2472);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _2480 = _2468 * 0.5;
    float _2482 = rsqrt(_2464);
    float _2484 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2486 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2488 = fma(_2478, -0.5, _2480);
    float _2490 = -_2476;
    float _2492 = _2490 + 1.0;
    float _2494 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2484);
    float _2496 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2486);
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2500 = _2488 + _2498;
    float _2502 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2470);
    float _2504 = abs(_2492);
    float _2506 = log2(_2504);
    float _2508 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2296);
    float _2510 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2494);
    float _2512 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2502);
    float _2514 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2496);
    float _2516 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2508);
    float _2518 = _2482 * _2428;
    float _2520 = _2482 * _2438;
    float _2522 = _2512 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2524 = _2482 * _2432;
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2528 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2530 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2532 = -_2526;
    float _2534 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2532);
    float _2536 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2538 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2540 = -_2524;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2534);
    float _2544 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2546 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2548 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2550 = exp2(_2536);
    float _2552 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2544);
    float _2554 = fma(_2542, -0.5, 0.5);
    float _2556 = fma(_2542, 0.5, 0.5);
    float _2558 = -_2548;
    float _2560 = fma(_2558, _2546, 1.0);
    float _2562 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2552);
    float _2564 = _2520 + 1.0;
    float _2566 = fma(_2556, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2568 = sqrt(_2554);
    float _2570 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2562);
    float _2572 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2574 = fma(_2556, _2566, -0.212114393711090087890625);
    float _2576 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2578 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _2488);
    float _2580 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2582 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _2488);
    float _2584 = -_2520;
    float _2586 = fma(_2550, _2564, _2584);
    float _2588 = 1.0 / _2570;
    float _2590 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _2592 = fma(_2556, _2574, 1.570728778839111328125);
    float _2594 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2572);
    float _2596 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _2488);
    float _2598 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[8].x, _2590);
    float _2600 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2576);
    float _2602 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2594);
    float _2604 = 1.0 / _2468;
    float _2606 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[8].z, _2598);
    float _2608 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2600);
    float _2610 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2602);
    float _2612 = _2568 * 0.636619746685028076171875;
    float _2614 = _2606 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _2616 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2608);
    float _2618 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _2488);
    float _2620 = _2610 * _2588;
    float _2622 = -_2592;
    float _2624 = fma(_2612, _2622, 1.0);
    float _2626 = _2616 * _2588;
    float _2628 = _2614 + _2468;
    float _2630 = fma(_2620, 0.5, 0.5);
    float _2632 = fma(_2586, 0.5, 0.5);
    float _2634 = fma(_2626, -0.5, 0.5);
    float _2636 = _2628 * 0.5;
    float _2638 = _2488 * _2604;
    float _2640 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _2488);
    float _2642 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _2488);
    float _2644 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _2636);
    float _2646 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _2636);
    float _2648 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _2636);
    float _2650 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _2636);
    float _2652 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _2636);
    float _2654 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _2636);
    float _2656 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _2636);
    float _2658 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _2636);
    float _2660 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _2636);
    float _2662 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _2636);
    float _2664 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _2636);
    float _2666 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _2636);
    float _2668 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _2636);
    float _2670 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _2636);
    float _2672 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _2636);
    float _2674 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _2636);
    float _2676 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _2636);
    float _2678 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _2636);
    float _2680 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _2636);
    float _2682 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _2636);
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2686 = _2636 + _2684;
    float _2688 = _2636 * _2604;
    float _2690 = _2636 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2692 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _2488);
    float _2694 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _2488);
    float _2696 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _2488);
    float _2698 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _2488);
    float _2700 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _2488);
    float _2702 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _2488);
    float _2704 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _2488);
    float _2706 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _2488);
    float _2708 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _2488);
    float _2710 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _2488);
    float _2712 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _2488);
    float _2714 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _2488);
    float _2716 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _2488);
    float _2718 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _2488);
    float _2720 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _2488);
    float _2722 = _2644 * _2604;
    float _2724 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _2488);
    float _2726 = _2578 * _2604;
    float _2728 = _2640 * _2604;
    float _2730 = _2646 * _2604;
    float _2732 = _2686 * _2604;
    float2 _8315 = float2(_2722, _2726);
    float _2734 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8315, float2(0.0), isnan(_8315)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8315, float2(0.0), isnan(_8315)), level(0.0)).x;
    float _2736 = _2500 * _2604;
    float _2738 = _2580 * _2604;
    float2 _8331 = float2(_2730, _2728);
    float _2740 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8331, float2(0.0), isnan(_8331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8331, float2(0.0), isnan(_8331)), level(0.0)).x;
    float _2742 = _2582 * _2604;
    float2 _8342 = float2(_2732, _2638);
    float _2744 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8342, float2(0.0), isnan(_8342)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8342, float2(0.0), isnan(_8342)), level(0.0)).x;
    float _2746 = _2690 * _2604;
    float2 _8353 = float2(_2688, _2736);
    float _2748 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8353, float2(0.0), isnan(_8353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8353, float2(0.0), isnan(_8353)), level(0.0)).x;
    float2 _8361 = float2(_2688, _2738);
    float _2750 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8361, float2(0.0), isnan(_8361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8361, float2(0.0), isnan(_8361)), level(0.0)).x;
    float _2752 = _2648 * _2604;
    float2 _8372 = float2(_2730, _2742);
    float _2754 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8372, float2(0.0), isnan(_8372)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8372, float2(0.0), isnan(_8372)), level(0.0)).x;
    float _2756 = _2596 * _2604;
    float2 _8383 = float2(_2746, _2638);
    float _2758 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8383, float2(0.0), isnan(_8383)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8383, float2(0.0), isnan(_8383)), level(0.0)).x;
    float _2760 = _2650 * _2604;
    float _2762 = _2618 * _2604;
    float2 _8397 = float2(_2752, _2756);
    float _2764 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8397, float2(0.0), isnan(_8397)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8397, float2(0.0), isnan(_8397)), level(0.0)).x;
    float _2766 = _2652 * _2604;
    float _2768 = _2642 * _2604;
    float _2770 = log2(_2560);
    float2 _8413 = float2(_2760, _2762);
    float _2772 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8413, float2(0.0), isnan(_8413)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8413, float2(0.0), isnan(_8413)), level(0.0)).x;
    float _2774 = _2654 * _2604;
    float _2776 = _2718 * _2604;
    float2 _8427 = float2(_2766, _2638);
    float _2778 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8427, float2(0.0), isnan(_8427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8427, float2(0.0), isnan(_8427)), level(0.0)).x;
    float _2780 = _2692 * _2604;
    float2 _8438 = float2(_2774, _2768);
    float _2782 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8438, float2(0.0), isnan(_8438)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8438, float2(0.0), isnan(_8438)), level(0.0)).x;
    float2 _8446 = float2(_2688, _2726);
    float _2784 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8446, float2(0.0), isnan(_8446)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8446, float2(0.0), isnan(_8446)), level(0.0)).x;
    float _2786 = _2656 * _2604;
    float _2788 = _2694 * _2604;
    float _2790 = _2724 * _2604;
    float _2792 = _2658 * _2604;
    float _2794 = _2696 * _2604;
    float _2796 = _2698 * _2604;
    float _2798 = _2660 * _2604;
    float _2800 = _2662 * _2604;
    float _2802 = _2770 * 0.693147182464599609375;
    float _2804 = _2720 * _2604;
    float _2806 = _2702 * _2604;
    float2 _8486 = float2(_2688, _2756);
    float _2808 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8486, float2(0.0), isnan(_8486)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8486, float2(0.0), isnan(_8486)), level(0.0)).x;
    float2 _8494 = float2(_2774, _2780);
    float _2810 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8494, float2(0.0), isnan(_8494)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8494, float2(0.0), isnan(_8494)), level(0.0)).x;
    float _2812 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2814 = _2700 * _2604;
    float2 _8509 = float2(_2730, _2638);
    float _2816 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8509, float2(0.0), isnan(_8509)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8509, float2(0.0), isnan(_8509)), level(0.0)).x;
    float2 _8517 = float2(_2786, _2788);
    float _2818 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8517, float2(0.0), isnan(_8517)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8517, float2(0.0), isnan(_8517)), level(0.0)).x;
    float _2820 = _2704 * _2604;
    float _2822 = _2716 * _2604;
    float _2824 = _2664 * _2604;
    float2 _8534 = float2(_2792, _2794);
    float _2826 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8534, float2(0.0), isnan(_8534)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8534, float2(0.0), isnan(_8534)), level(0.0)).x;
    float2 _8542 = float2(_2798, _2638);
    float _2828 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8542, float2(0.0), isnan(_8542)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8542, float2(0.0), isnan(_8542)), level(0.0)).x;
    float2 _8550 = float2(_2800, _2796);
    float _2830 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8550, float2(0.0), isnan(_8550)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8550, float2(0.0), isnan(_8550)), level(0.0)).x;
    float2 _8558 = float2(_2688, _2814);
    float _2832 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8558, float2(0.0), isnan(_8558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8558, float2(0.0), isnan(_8558)), level(0.0)).x;
    float2 _8566 = float2(_2688, _2806);
    float _2834 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8566, float2(0.0), isnan(_8566)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8566, float2(0.0), isnan(_8566)), level(0.0)).x;
    float2 _8574 = float2(_2800, _2820);
    float _2836 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8574, float2(0.0), isnan(_8574)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8574, float2(0.0), isnan(_8574)), level(0.0)).x;
    float2 _8582 = float2(_2824, _2638);
    float _2838 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8582, float2(0.0), isnan(_8582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8582, float2(0.0), isnan(_8582)), level(0.0)).x;
    float _2840 = _2666 * _2604;
    float _2842 = _2668 * _2604;
    float _2844 = _2706 * _2604;
    float _2846 = _2670 * _2604;
    float _2848 = _2708 * _2604;
    float _2850 = _2672 * _2604;
    float _2852 = _2710 * _2604;
    float _2854 = _2674 * _2604;
    float _2856 = _2712 * _2604;
    float _2858 = _2676 * _2604;
    float _2860 = _2714 * _2604;
    float _2862 = _2678 * _2604;
    float2 _8626 = float2(_2840, _2844);
    float _2864 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8626, float2(0.0), isnan(_8626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8626, float2(0.0), isnan(_8626)), level(0.0)).x;
    float2 _8634 = float2(_2842, _2848);
    float _2866 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8634, float2(0.0), isnan(_8634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8634, float2(0.0), isnan(_8634)), level(0.0)).x;
    float2 _8642 = float2(_2846, _2852);
    float _2868 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8642, float2(0.0), isnan(_8642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8642, float2(0.0), isnan(_8642)), level(0.0)).x;
    float2 _8650 = float2(_2850, _2856);
    float _2870 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8650, float2(0.0), isnan(_8650)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8650, float2(0.0), isnan(_8650)), level(0.0)).x;
    float2 _8658 = float2(_2854, _2860);
    float _2872 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8658, float2(0.0), isnan(_8658)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8658, float2(0.0), isnan(_8658)), level(0.0)).x;
    float2 _8666 = float2(_2858, _2822);
    float _2874 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8666, float2(0.0), isnan(_8666)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8666, float2(0.0), isnan(_8666)), level(0.0)).x;
    float2 _8674 = float2(_2862, _2776);
    float _2876 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8674, float2(0.0), isnan(_8674)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8674, float2(0.0), isnan(_8674)), level(0.0)).x;
    float _2878 = _2680 * _2604;
    float _2880 = _2682 * _2604;
    float2 _8688 = float2(_2878, _2804);
    float _2882 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8688, float2(0.0), isnan(_8688)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8688, float2(0.0), isnan(_8688)), level(0.0)).x;
    float2 _8696 = float2(_2880, _2790);
    float _2884 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8696, float2(0.0), isnan(_8696)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8696, float2(0.0), isnan(_8696)), level(0.0)).x;
    float2 _8704 = float2(_2688, _2638);
    float _2886 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_8704, float2(0.0), isnan(_8704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_8704, float2(0.0), isnan(_8704)), level(0.0)).x;
    float3 _8713 = float3(_2630, _2634, _2812);
    float _2888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8713, float3(0.0), isnan(_8713)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8713, float3(0.0), isnan(_8713)), level(0.0)).x;
    float3 _8724 = float3(_2630, _2634, _2812);
    float4 _2891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8724, float3(0.0), isnan(_8724)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8724, float3(0.0), isnan(_8724)), level(0.0)).xyzw;
    float _2893 = _2891.x;
    float _2895 = _2891.y;
    float _2897 = _2891.z;
    float _2899 = _2891.w;
    float2 _8740 = float2(_2624, _2632);
    float3 _2903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8740, float2(0.0), isnan(_8740)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8740, float2(0.0), isnan(_8740)), level(0.0)).xyz;
    float _2905 = _2903.x;
    float _2907 = _2903.y;
    float _2909 = _2903.z;
    float _2911 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2913 = _2522 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2915 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2911);
    float _2917 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2913);
    float _2919 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2915);
    float _2921 = _2919 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2923 = _2921 + _2468;
    float _2925 = _2923 * _2604;
    float _2927 = _2925 * 0.5;
    float _2929 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2931 = fma(_2927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2929);
    float _2933 = 1.0 / _2931;
    float _2935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2937 = _2933 * _2935;
    float _2939 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2941 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2939);
    float _2943 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2945 = fma(_2740, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2943);
    float _2947 = 1.0 / _2941;
    float _2949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2951 = fma(_2744, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2949);
    float _2953 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2955 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2953);
    float _2957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2959 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2957);
    float _2961 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2963 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2961);
    float _2965 = 1.0 / _2951;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2969 = fma(_2758, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2967);
    float _2971 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2973 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2971);
    float _2975 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2977 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2975);
    float _2979 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2981 = -_2937;
    float _2983 = fma(_2947, _2979, _2981);
    float _2985 = 1.0 / _2955;
    float _2987 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2989 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2987);
    float _2991 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2993 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2991);
    bool _2995 = _2983 >= 0.0;
    bool _2997 = isnan(_2983);
    bool _2999 = _2995 || _2997;
    bool _3001 = isnan(0.0);
    bool _3003 = _2999 || _3001;
    float _3005 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3007 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3005);
    float _3009 = 1.0 / _2945;
    float _3011 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3013 = -_2937;
    float _3015 = fma(_2985, _3011, _3013);
    float _3017 = 1.0 / _2969;
    float _3019 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3021 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3019);
    float _3023 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3025 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3023);
    float _3027 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3029 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3027);
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3033 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3031);
    float _3035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3037 = -_2937;
    float _3039 = fma(_3009, _3035, _3037);
    float _3041 = 1.0 / _2989;
    float _3043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3045 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3043);
    float _3047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3049 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3047);
    float _3051 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3053 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3051);
    bool _3055 = _3039 >= 0.0;
    bool _3057 = isnan(_3039);
    bool _3059 = _3055 || _3057;
    bool _3061 = isnan(0.0);
    bool _3063 = _3059 || _3061;
    float _3065 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3067 = -_2937;
    float _3069 = fma(_2965, _3065, _3067);
    float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3073 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3071);
    float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3077 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3075);
    bool _3079 = !_3063;
    float _3081 = _3079 ? 0.0 : 2.0;
    float _3083 = 1.0 / _3007;
    bool _3085 = _3069 >= 0.0;
    bool _3087 = isnan(_3069);
    bool _3089 = _3085 || _3087;
    bool _3091 = isnan(0.0);
    bool _3093 = _3089 || _3091;
    float _3095 = float(_3093);
    float _3097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3099 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3097);
    bool _3101 = !_3003;
    float _3103 = _3101 ? 0.0 : 2.0;
    float _3105 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3107 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3105);
    float _3109 = _3103 + _3095;
    bool _3111 = _3015 >= 0.0;
    bool _3113 = isnan(_3015);
    bool _3115 = _3111 || _3113;
    bool _3117 = isnan(0.0);
    bool _3119 = _3115 || _3117;
    float _3121 = float(_3119);
    float _3123 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3125 = -_2937;
    float _3127 = fma(_3017, _3123, _3125);
    float _3129 = 1.0 / _3049;
    float _3131 = _3109 + _3081;
    float _3133 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3135 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3133);
    float _3137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3139 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3137);
    bool _3141 = _3127 >= 0.0;
    bool _3143 = isnan(_3127);
    bool _3145 = _3141 || _3143;
    bool _3147 = isnan(0.0);
    bool _3149 = _3145 || _3147;
    float _3151 = float(_3149);
    float _3153 = _3131 + _3121;
    float _3155 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3157 = -_2937;
    float _3159 = fma(_3041, _3155, _3157);
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3163 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3161);
    float _3165 = 1.0 / _2959;
    float _3167 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3169 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3167);
    float _3171 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3173 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3171);
    float _3175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3177 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3175);
    float _3179 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3181 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3179);
    float _3183 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3185 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3183);
    float _3187 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3189 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3187);
    float _3191 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3193 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3191);
    float _3195 = 1.0 / _3107;
    float _3197 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3199 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3201 = -_2937;
    float _3203 = fma(_3165, _3199, _3201);
    float _3205 = 1.0 / _3185;
    bool _3207 = _3203 >= 0.0;
    bool _3209 = isnan(_3203);
    bool _3211 = _3207 || _3209;
    bool _3213 = isnan(0.0);
    bool _3215 = _3211 || _3213;
    float _3217 = float(_3215);
    float _3219 = 1.0 / _3193;
    float _3221 = _3153 + _3217;
    float _3223 = 1.0 / _2963;
    float _3225 = exp2(_3197);
    float _3227 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3229 = -_2937;
    float _3231 = fma(_3223, _3227, _3229);
    bool _3233 = _3231 >= 0.0;
    bool _3235 = isnan(_3231);
    bool _3237 = _3233 || _3235;
    bool _3239 = isnan(0.0);
    bool _3241 = _3237 || _3239;
    bool _3243 = !_3241;
    float _3245 = _3243 ? 0.0 : 2.0;
    float _3247 = _3221 + _3245;
    float _3249 = 1.0 / _2973;
    float _3251 = _3247 + _3151;
    float _3253 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3255 = -_2937;
    float _3257 = fma(_3249, _3253, _3255);
    bool _3259 = _3257 >= 0.0;
    bool _3261 = isnan(_3257);
    bool _3263 = _3259 || _3261;
    bool _3265 = isnan(0.0);
    bool _3267 = _3263 || _3265;
    float _3269 = 1.0 / _2977;
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3273 = -_2937;
    float _3275 = fma(_3269, _3271, _3273);
    bool _3277 = _3275 >= 0.0;
    bool _3279 = isnan(_3275);
    bool _3281 = _3277 || _3279;
    bool _3283 = isnan(0.0);
    bool _3285 = _3281 || _3283;
    bool _3287 = !_3267;
    float _3289 = _3287 ? 0.0 : 2.0;
    bool _3291 = !_3285;
    float _3293 = _3291 ? 0.0 : 2.0;
    float _3295 = _3251 + _3289;
    bool _3297 = _3159 >= 0.0;
    bool _3299 = isnan(_3159);
    bool _3301 = _3297 || _3299;
    bool _3303 = isnan(0.0);
    bool _3305 = _3301 || _3303;
    float _3307 = float(_3305);
    float _3309 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3311 = -_2937;
    float _3313 = fma(_3083, _3309, _3311);
    float _3315 = _3295 + _3293;
    float _3317 = 1.0 / _3021;
    float _3319 = _3315 + _3307;
    float _3321 = 1.0 / _2993;
    float _3323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3325 = -_2937;
    float _3327 = fma(_3317, _3323, _3325);
    bool _3329 = _3313 >= 0.0;
    bool _3331 = isnan(_3313);
    bool _3333 = _3329 || _3331;
    bool _3335 = isnan(0.0);
    bool _3337 = _3333 || _3335;
    float _3339 = float(_3337);
    float _3341 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3343 = -_2937;
    float _3345 = fma(_3321, _3341, _3343);
    bool _3347 = _3345 >= 0.0;
    bool _3349 = isnan(_3345);
    bool _3351 = _3347 || _3349;
    bool _3353 = isnan(0.0);
    bool _3355 = _3351 || _3353;
    bool _3357 = !_3355;
    float _3359 = _3357 ? 0.0 : 2.0;
    float _3361 = _3319 + _3359;
    bool _3363 = _3327 >= 0.0;
    bool _3365 = isnan(_3327);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = float(_3371);
    float _3375 = _3361 + _3339;
    float _3377 = 1.0 / _3029;
    float _3379 = _3375 + _3373;
    float _3381 = 1.0 / _3025;
    float _3383 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3385 = -_2937;
    float _3387 = fma(_3377, _3383, _3385);
    bool _3389 = _3387 >= 0.0;
    bool _3391 = isnan(_3387);
    bool _3393 = _3389 || _3391;
    bool _3395 = isnan(0.0);
    bool _3397 = _3393 || _3395;
    float _3399 = float(_3397);
    float _3401 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3403 = -_2937;
    float _3405 = fma(_3129, _3401, _3403);
    float _3407 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3409 = -_2937;
    float _3411 = fma(_3381, _3407, _3409);
    bool _3413 = _3411 >= 0.0;
    bool _3415 = isnan(_3411);
    bool _3417 = _3413 || _3415;
    bool _3419 = isnan(0.0);
    bool _3421 = _3417 || _3419;
    bool _3423 = !_3421;
    float _3425 = _3423 ? 0.0 : 2.0;
    float _3427 = _3379 + _3425;
    float _3429 = 1.0 / _3033;
    float _3431 = _3427 + _3399;
    float _3433 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3435 = -_2937;
    float _3437 = fma(_3429, _3433, _3435);
    bool _3439 = _3437 >= 0.0;
    bool _3441 = isnan(_3437);
    bool _3443 = _3439 || _3441;
    bool _3445 = isnan(0.0);
    bool _3447 = _3443 || _3445;
    float _3449 = 1.0 / _3045;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3453 = -_2937;
    float _3455 = fma(_3449, _3451, _3453);
    bool _3457 = _3455 >= 0.0;
    bool _3459 = isnan(_3455);
    bool _3461 = _3457 || _3459;
    bool _3463 = isnan(0.0);
    bool _3465 = _3461 || _3463;
    bool _3467 = !_3447;
    float _3469 = _3467 ? 0.0 : 2.0;
    bool _3471 = !_3465;
    float _3473 = _3471 ? 0.0 : 2.0;
    float _3475 = _3431 + _3469;
    bool _3477 = _3405 >= 0.0;
    bool _3479 = isnan(_3405);
    bool _3481 = _3477 || _3479;
    bool _3483 = isnan(0.0);
    bool _3485 = _3481 || _3483;
    float _3487 = float(_3485);
    float _3489 = _3475 + _3473;
    float _3491 = _3489 + _3487;
    float _3493 = 1.0 / _3053;
    float _3495 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3497 = -_2937;
    float _3499 = fma(_3493, _3495, _3497);
    bool _3501 = _3499 >= 0.0;
    bool _3503 = isnan(_3499);
    bool _3505 = _3501 || _3503;
    bool _3507 = isnan(0.0);
    bool _3509 = _3505 || _3507;
    float _3511 = 1.0 / _3073;
    float _3513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3515 = -_2937;
    float _3517 = fma(_3511, _3513, _3515);
    bool _3519 = !_3509;
    float _3521 = _3519 ? 0.0 : 2.0;
    bool _3523 = _3517 >= 0.0;
    bool _3525 = isnan(_3517);
    bool _3527 = _3523 || _3525;
    bool _3529 = isnan(0.0);
    bool _3531 = _3527 || _3529;
    float _3533 = float(_3531);
    float _3535 = _3491 + _3521;
    float _3537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3539 = -_2937;
    float _3541 = fma(_3195, _3537, _3539);
    float _3543 = 1.0 / _3077;
    float _3545 = _3535 + _3533;
    bool _3547 = _3541 >= 0.0;
    bool _3549 = isnan(_3541);
    bool _3551 = _3547 || _3549;
    bool _3553 = isnan(0.0);
    bool _3555 = _3551 || _3553;
    float _3557 = float(_3555);
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3561 = -_2937;
    float _3563 = fma(_3543, _3559, _3561);
    bool _3565 = _3563 >= 0.0;
    bool _3567 = isnan(_3563);
    bool _3569 = _3565 || _3567;
    bool _3571 = isnan(0.0);
    bool _3573 = _3569 || _3571;
    float _3575 = float(_3573);
    float _3577 = _3545 + _3575;
    float _3579 = 1.0 / _3099;
    float _3581 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3583 = -_2937;
    float _3585 = fma(_3579, _3581, _3583);
    bool _3587 = _3585 >= 0.0;
    bool _3589 = isnan(_3585);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan(0.0);
    bool _3595 = _3591 || _3593;
    bool _3597 = !_3595;
    float _3599 = _3597 ? 0.0 : 2.0;
    float _3601 = _3577 + _3599;
    float _3603 = 1.0 / _3135;
    float _3605 = _3601 + _3557;
    float _3607 = 1.0 / _3181;
    float _3609 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3611 = -_2937;
    float _3613 = fma(_3603, _3609, _3611);
    bool _3615 = _3613 >= 0.0;
    bool _3617 = isnan(_3613);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan(0.0);
    bool _3623 = _3619 || _3621;
    float _3625 = 1.0 / _3139;
    float _3627 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3629 = -_2937;
    float _3631 = fma(_3607, _3627, _3629);
    float _3633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3635 = -_2937;
    float _3637 = fma(_3625, _3633, _3635);
    bool _3639 = _3637 >= 0.0;
    bool _3641 = isnan(_3637);
    bool _3643 = _3639 || _3641;
    bool _3645 = isnan(0.0);
    bool _3647 = _3643 || _3645;
    float _3649 = 1.0 / _3163;
    float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3653 = -_2937;
    float _3655 = fma(_3649, _3651, _3653);
    bool _3657 = _3655 >= 0.0;
    bool _3659 = isnan(_3655);
    bool _3661 = _3657 || _3659;
    bool _3663 = isnan(0.0);
    bool _3665 = _3661 || _3663;
    float _3667 = 1.0 / _3169;
    bool _3669 = !_3665;
    float _3671 = _3669 ? 0.0 : 3.0;
    float _3673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3675 = -_2937;
    float _3677 = fma(_3667, _3673, _3675);
    bool _3679 = _3677 >= 0.0;
    bool _3681 = isnan(_3677);
    bool _3683 = _3679 || _3681;
    bool _3685 = isnan(0.0);
    bool _3687 = _3683 || _3685;
    float _3689 = 1.0 / _3173;
    bool _3691 = !_3687;
    float _3693 = _3691 ? 0.0 : 3.0;
    float _3695 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3697 = -_2937;
    float _3699 = fma(_3689, _3695, _3697);
    bool _3701 = _3699 >= 0.0;
    bool _3703 = isnan(_3699);
    bool _3705 = _3701 || _3703;
    bool _3707 = isnan(0.0);
    bool _3709 = _3705 || _3707;
    float _3711 = 1.0 / _3177;
    float _3713 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3715 = -_2937;
    float _3717 = fma(_3711, _3713, _3715);
    bool _3719 = _3717 >= 0.0;
    bool _3721 = isnan(_3717);
    bool _3723 = _3719 || _3721;
    bool _3725 = isnan(0.0);
    bool _3727 = _3723 || _3725;
    bool _3729 = !_3647;
    float _3731 = _3729 ? 0.0 : 3.0;
    bool _3733 = _3631 >= 0.0;
    bool _3735 = isnan(_3631);
    bool _3737 = _3733 || _3735;
    bool _3739 = isnan(0.0);
    bool _3741 = _3737 || _3739;
    bool _3743 = !_3727;
    float _3745 = _3743 ? 0.0 : 3.0;
    float _3747 = _3731 + _3671;
    bool _3749 = !_3709;
    float _3751 = _3749 ? 0.0 : 3.0;
    float _3753 = _3747 + _3693;
    bool _3755 = !_3741;
    float _3757 = _3755 ? 0.0 : 3.0;
    float _3759 = _3753 + _3751;
    bool _3761 = !_3623;
    float _3763 = _3761 ? 0.0 : 2.0;
    float _3765 = _3759 + _3745;
    float _3767 = _3605 + _3763;
    float _3769 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2917);
    float _3771 = _3765 + _3757;
    float _3773 = _3767 * 0.02857142873108386993408203125;
    float _3775 = precise::clamp(_3773, 0.0, 1.0);
    float _3777 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3769);
    float _3779 = 1.0 / _3189;
    float _3781 = _3777 + _2570;
    out.gl_Position.x = _2610;
    out.gl_Position.y = _2616;
    out.gl_Position.z = _3777;
    out.gl_Position.w = _2570;
    float _3783 = _3781 * 0.5;
    float _3785 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3787 = -_2937;
    float _3789 = fma(_3205, _3785, _3787);
    out.m_73.z = _3783;
    out.m_73.w = _2570;
    bool _3791 = _3789 >= 0.0;
    bool _3793 = isnan(_3789);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(0.0);
    bool _3799 = _3795 || _3797;
    float _3801 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3803 = -_2937;
    float _3805 = fma(_3779, _3801, _3803);
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3809 = -_2937;
    float _3811 = fma(_3219, _3807, _3809);
    bool _3813 = !_3799;
    float _3815 = _3813 ? 0.0 : 3.0;
    float _3817 = -_3225;
    float _3819 = _3817 + 1.0;
    bool _3821 = _3805 >= 0.0;
    bool _3823 = isnan(_3805);
    bool _3825 = _3821 || _3823;
    bool _3827 = isnan(0.0);
    bool _3829 = _3825 || _3827;
    bool _3831 = _3811 >= 0.0;
    bool _3833 = isnan(_3811);
    bool _3835 = _3831 || _3833;
    bool _3837 = isnan(0.0);
    bool _3839 = _3835 || _3837;
    float _3841 = _3771 + _3815;
    bool _3843 = !_3829;
    float _3845 = _3843 ? 0.0 : 3.0;
    float _3847 = _3819 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3849 = !_3839;
    float _3851 = _3849 ? 0.0 : 5.0;
    float _3853 = _3841 + _3845;
    float _3855 = _3847 * _2888;
    float _3857 = -_3847;
    float _3859 = _3857 + 1.0;
    float _3861 = _3853 + _3851;
    float _3863 = _2899 * _3855;
    float _3865 = _2909 * _3855;
    float _3867 = _3861 * 0.14285714924335479736328125;
    float _3869 = precise::clamp(_3867, 0.0, 1.0);
    float _3871 = fma(_2905, _3863, _2893);
    float _3873 = _3775 * _3869;
    float _3875 = _3873 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3877 = fma(_2907, _3863, _2895);
    float _3879 = _2899 * _3859;
    float _3881 = fma(_2899, _3865, _2897);
    float _3883 = _3875 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _3871;
    out.m_75.y = _3877;
    out.m_75.z = _3881;
    out.m_75.w = _3879;
    out.m_47.x = _3883;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

