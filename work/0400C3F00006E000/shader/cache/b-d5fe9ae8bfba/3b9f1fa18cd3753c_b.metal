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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1458 = false;
    bool _1316 = false;
    bool _1040 = false;
    bool _860 = false;
    bool _626 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3016 = as_type<float>(_112);
        out.gl_Position.z = _3016;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = _130;
    if (_126)
    {
        float _136 = float(_96);
        _132 = _136;
    }
    float _138 = _132;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    if (_144)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _106;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3085 = as_type<float>(_150);
        out.gl_Position.z = _3085;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_49.w;
    float _154 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
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
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _276 = _272;
    float _294;
    if (!_274)
    {
        float _278 = in.m_51.x;
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
        float _298 = float(_96);
        float _300 = 1.0 / _298;
        float _302 = _130 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _304 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = 1.0 / _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _328;
    float _332 = 1.0 / _320;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    bool _338 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_304);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    bool _354 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _356 = isnan(_304);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = 1.0 / _316;
    float _368 = _336 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _372 = _304 + _370;
    bool _374 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _376 = isnan(_304);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = fma(_352, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = 1.0 / _324;
    float _390 = _372 * _332;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _394 = _304 + _392;
    bool _396 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _398 = isnan(_304);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    bool _408 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _410 = isnan(_304);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = 1.0 / _330;
    float _422 = _308 * _366;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _426 = _304 + _424;
    bool _428 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _430 = isnan(_304);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _444 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _446 = _394 * _388;
    float _448 = -_406;
    float _450 = _448 + 1.0;
    float _452 = fma(_442, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _454 = _418 * _450;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -_418;
    float _462 = _460 + 1.0;
    float _464 = _426 * _420;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _466;
    float _470 = fma(_458, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _472 = _364 * _462;
    float _474 = -_364;
    float _476 = _474 + 1.0;
    float _478 = fma(_468, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _480 = -_384;
    float _482 = _480 + 1.0;
    float _484 = _384 * _476;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = _348 * _482;
    float _492 = -_348;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _500 = fma(_488, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _502 = _438 * _494;
    float _504 = -_438;
    float _506 = _504 + 1.0;
    float _508 = fma(_498, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _510 = _470 * _502;
    float _512 = _478 * _502;
    float _514 = _386 * _502;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _516;
    float _520 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].x, _510);
    float _522 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].y, _512);
    float _524 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].z, _514);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = fma(_518, _390, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _532 = fma(_452, _490, _520);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _538;
    float _542 = fma(_528, _446, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _548 = fma(_530, _484, _532);
    float _550 = fma(_536, _390, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _552 = fma(_500, _490, _522);
    float _554 = fma(_540, _390, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _560 = fma(_508, _490, _524);
    float _562 = fma(_546, _446, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _564 = fma(_550, _484, _552);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _570;
    float _574 = fma(_558, _446, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _576 = fma(_554, _484, _560);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _578;
    float _582 = fma(_568, _464, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _584 = fma(_572, _464, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _586 = fma(_542, _472, _548);
    float _588 = fma(_580, _464, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _590 = fma(_574, _472, _564);
    float _592 = fma(_562, _472, _576);
    float _594 = fma(_582, _454, _586);
    float _596 = fma(_584, _454, _590);
    float _598 = fma(_588, _454, _592);
    float _600 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[148].x, _594);
    float _602 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[148].y, _596);
    float _604 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[148].z, _598);
    bool _606 = !_444;
    float _624;
    if (!_606)
    {
        float _608 = in.m_51.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_96);
        float _630 = 1.0 / _628;
        float _632 = _130 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = in.m_49.x;
    float _638 = in.m_49.y;
    float _640 = in.m_49.z;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _644 = _634 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _648 = _634 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _658;
    float _662 = 1.0 / _652;
    bool _664 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _666 = 1.0 / _656;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _668;
    float _672 = _604 * _640;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _676 = _634 + _674;
    float _678 = 1.0 / _660;
    float _680 = _602 * _638;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _682;
    float _686 = _676 * _662;
    bool _688 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _690 = isnan(_634);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _700;
    float _704 = fma(_684, _686, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _706 = _644 * _666;
    bool _708 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _710 = isnan(_634);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = fma(_702, _686, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _722 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _724 = isnan(_634);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = fma(_670, _686, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _736 = _648 * _678;
    float _738 = -_698;
    float _740 = _738 + 1.0;
    float _742 = -_732;
    float _744 = _742 + 1.0;
    float _746 = _718 * _740;
    bool _748 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _750 = isnan(_634);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _764 = -_718;
    float _766 = _764 + 1.0;
    float _768 = _758 * _744;
    float _770 = _732 * _766;
    float _772 = -_758;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _780 = _704 * _768;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _786 = _720 * _768;
    float _788 = _734 * _768;
    float _790 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[107].x, _780);
    float _792 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[107].y, _786);
    float _794 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[107].z, _788);
    float _796 = fma(_762, _706, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _798 = fma(_778, _706, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _800 = fma(_784, _706, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _810;
    float _814 = fma(_796, _770, _790);
    float _816 = fma(_804, _736, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _818 = fma(_808, _736, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _820 = fma(_812, _736, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _822 = fma(_798, _770, _792);
    float _824 = fma(_800, _770, _794);
    float _826 = fma(_816, _746, _814);
    float _828 = _600 * _636;
    float _830 = fma(_818, _746, _822);
    float _832 = fma(_820, _746, _824);
    float _834 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[110].x, _826);
    float _836 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[110].y, _830);
    float _838 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[110].z, _832);
    bool _840 = !_664;
    float _858;
    if (!_840)
    {
        float _842 = in.m_51.x;
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _846 = _842 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _850 = _848 * _844;
        float _852 = floor(_850);
        float _854 = -_852;
        float _856 = _850 + _854;
        _858 = _856;
        _860 = true;
    }
    else
    {
        float _862 = float(_96);
        float _864 = 1.0 / _862;
        float _866 = _130 * _864;
        _858 = _866;
    }
    _860 = false;
    float _868 = _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _872 = _868 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _878 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _880 = isnan(_868);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _898 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _900 = isnan(_868);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = 1.0 / _876;
    float _912 = -_888;
    float _914 = _912 + 1.0;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _916;
    bool _920 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _922 = isnan(_868);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = _908 * _914;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    bool _938 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _940 = 1.0 / _892;
    float _942 = _930 * _936;
    float _944 = -_930;
    float _946 = _944 + 1.0;
    float _948 = 1.0 / _896;
    float _950 = _918 * _910;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = fma(_950, _872, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _958 = _954 * _940;
    bool _960 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _962 = isnan(_868);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _978 = _868 + _976;
    float _980 = _956 * _942;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _984 = _868 + _982;
    float _986 = -_970;
    float _988 = _986 + 1.0;
    float _990 = fma(_958, _978, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _992 = _974 * _948;
    float _994 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[115].x, _980);
    float _996 = _888 * _988;
    float _998 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1000 = fma(_992, _984, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1002 = fma(_990, _932, _994);
    float _1004 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1006 = fma(_1000, _996, _1002);
    float _1008 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1006);
    float _1014 = _998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1014;
    out.m_53.y = _1016;
    out.m_53.z = _1010;
    out.m_53.w = _1018;
    bool _1020 = !_938;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_51.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        float _1042 = float(_96);
        float _1044 = 1.0 / _1042;
        float _1046 = _130 * _1044;
        _1038 = _1046;
    }
    _1040 = false;
    float _1048 = _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1052 = _1048 + _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1060 = _1048 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1078 = 1.0 / _1068;
    bool _1080 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1082 = 1.0 / _1064;
    float _1084 = 1.0 / _1072;
    float _1086 = 1.0 / _1076;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1090 = _1048 + _1088;
    float _1092 = _1052 * _1082;
    bool _1094 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1096 = isnan(_1048);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = _1090 * _1078;
    bool _1108 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1110 = isnan(_1048);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = _1056 * _1084;
    bool _1122 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1124 = isnan(_1048);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1118;
    float _1136 = _1134 + 1.0;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1138;
    float _1142 = _1104 * _1136;
    float _1144 = _1060 * _1086;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1150;
    float _1154 = -_1104;
    float _1156 = _1154 + 1.0;
    float _1158 = fma(_1140, _1120, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1160 = fma(_1148, _1120, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1162 = fma(_1152, _1120, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1164 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1166 = isnan(_1048);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -_1132;
    float _1178 = _1176 + 1.0;
    float _1180 = _1132 * _1156;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1186 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1188 = isnan(_1048);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = _1174 * _1178;
    float _1200 = -_1174;
    float _1202 = _1200 + 1.0;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1212 = fma(_1184, _1144, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1214 = _1196 * _1202;
    float _1216 = fma(_1206, _1144, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1218 = fma(_1210, _1144, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1220 = -_1196;
    float _1222 = _1220 + 1.0;
    float _1224 = _1158 * _1214;
    float _1226 = _1160 * _1214;
    float _1228 = _1162 * _1214;
    float _1230 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1224);
    float _1232 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1226);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1234;
    float _1238 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1228);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1244;
    float _1248 = fma(_1216, _1198, _1230);
    float _1250 = fma(_1218, _1198, _1232);
    float _1252 = fma(_1212, _1198, _1238);
    float _1254 = fma(_1236, _1092, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1256 = fma(_1242, _1092, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1258 = fma(_1246, _1092, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1272 = fma(_1254, _1180, _1248);
    float _1274 = fma(_1262, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1276 = fma(_1266, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1278 = fma(_1270, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1280 = fma(_1256, _1180, _1250);
    float _1282 = fma(_1258, _1180, _1252);
    float _1284 = fma(_1274, _1142, _1272);
    float _1286 = fma(_1276, _1142, _1280);
    float _1288 = fma(_1278, _1142, _1282);
    float _1290 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1284);
    float _1292 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1286);
    float _1294 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1288);
    bool _1296 = !_1080;
    float _1314;
    if (!_1296)
    {
        float _1298 = in.m_51.x;
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1302 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1304 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _1306 = _1304 * _1300;
        float _1308 = floor(_1306);
        float _1310 = -_1308;
        float _1312 = _1306 + _1310;
        _1314 = _1312;
        _1316 = true;
    }
    else
    {
        float _1318 = float(_96);
        float _1320 = 1.0 / _1318;
        float _1322 = _130 * _1320;
        _1314 = _1322;
    }
    _1316 = false;
    float _1324 = _1314;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1328 = _1324 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1334 = _1324 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1336 = isnan(_1324);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1350 = _1324 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1352 = isnan(_1324);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1358 = _1354 || _1356;
    float _1360 = float(_1358);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1362;
    bool _1366 = _1324 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1368 = isnan(_1324);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = 1.0 / _1332;
    float _1380 = -_1344;
    float _1382 = _1380 + 1.0;
    bool _1384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1386 = -_1376;
    float _1388 = _1386 + 1.0;
    float _1390 = 1.0 / _1348;
    float _1392 = _1344 * _1388;
    float _1394 = _1364 * _1378;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1398 = _1396 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1400 = fma(_1394, _1328, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1402 = _1360 * _1382;
    float _1404 = -_1360;
    float _1406 = _1404 + 1.0;
    float _1408 = _1398 * _1390;
    float _1410 = _1400 * _1402;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1414 = _1324 + _1412;
    float _1416 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1410);
    float _1420 = fma(_1408, _1414, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1422 = _1292 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1424 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1426 = fma(_1420, _1392, _1418);
    float _1428 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1426);
    float _1434 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1436 = _1432 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_55.x = _1428;
    out.m_55.y = _1430;
    out.m_55.z = _1434;
    out.m_55.w = _1436;
    bool _1438 = !_1384;
    float _1456;
    if (!_1438)
    {
        float _1440 = in.m_51.x;
        float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1444 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[14].y, _130);
        float _1448 = _1446 * _1442;
        float _1450 = floor(_1448);
        float _1452 = -_1450;
        float _1454 = _1448 + _1452;
        _1456 = _1454;
        _1458 = true;
    }
    else
    {
        float _1460 = float(_96);
        float _1462 = 1.0 / _1460;
        float _1464 = _130 * _1462;
        _1456 = _1464;
    }
    _1458 = false;
    float _1466 = _1456;
    float _1468 = in.m_51.z;
    float _1470 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1472 = in.m_51.x;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1476 = _1474 != 0;
    float _1478 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1480 = in.m_51.y;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1484 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1488 = _1486 != 0;
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1492 = _1490 != 0;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1496 = _1494 != 0;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1500 = !_1492;
    int _1502 = _1500 ? 0 : 1;
    bool _1504 = !_1496;
    int _1506 = _1504 ? 0 : 1;
    int _1508 = abs(_1502);
    float _1510 = _1468 * 2.0;
    float _1512 = float(_1508);
    float _1514 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1516 = _1472 * 2.0;
    float _1518 = floor(_1510);
    float _1520 = -_1482;
    float _1522 = fma(_1514, 2.0, _1520);
    float _1524 = _1472 + _1480;
    float _1526 = _1480 * 2.0;
    float _1528 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1530 = _1524 + (-1.0);
    float _1532 = floor(_1516);
    float _1534 = fma(_1528, -2.0, _1498);
    float _1536 = _1528;
    float _1538 = _1530;
    if (!_1476)
    {
        _1536 = _1480;
    }
    float _1540 = _1536;
    float _1542 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1544 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1534);
    float _1546 = _1540;
    if (!_1476)
    {
        _1538 = _1468;
    }
    float _1548 = _1538;
    float _1550 = floor(_1526);
    bool _1552 = _1518 > 0.0;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1556 = _1518 >= 0.0;
    bool _1558 = isnan(_1518);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan(0.0);
    bool _1564 = _1560 || _1562;
    float _1566 = _1548;
    float _1568 = _1518;
    if (_1476)
    {
        _1566 = _1480;
    }
    float _1570 = _1566;
    if (!_1476)
    {
        _1568 = _1468;
    }
    float _1572 = _1568;
    float _1574 = _1572;
    if (_1476)
    {
        _1546 = _1472;
    }
    float _1576 = _1546;
    float _1578 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1554);
    if (_1476)
    {
        _1574 = _1480;
    }
    float _1580 = _1574;
    float _1582 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1584 = log2(_1582);
    bool _1586 = _1532 > 0.0;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1590 = _1532 >= 0.0;
    bool _1592 = isnan(_1532);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan(0.0);
    bool _1598 = _1594 || _1596;
    float _1600 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1602 = _1564 ? 0 : 1;
    bool _1604 = !_1488;
    int _1606 = _1604 ? 0 : 1;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1610 = _1550 > 0.0;
    bool _1612 = _1550 >= 0.0;
    bool _1614 = isnan(_1550);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan(0.0);
    bool _1620 = _1616 || _1618;
    float _1622 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1608);
    float _1624 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1626 = ~_1602;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    float _1632 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1622);
    int _1634 = abs(_1606);
    float _1636 = -_1588;
    float _1638 = fma(_1624, 2.0, _1636);
    int _1640 = _1630;
    if (!_1552)
    {
        int _1642 = ~_1602;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1650 = _1598 ? 0 : 1;
    float _1652 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1578);
    float _1654 = float(_1634);
    float _1656 = fma(_1600, -2.0, _1648);
    float _1658 = float(_1646);
    float _1660 = _1472 + (-0.5);
    int _1662 = ~_1650;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    int _1668 = _1666;
    if (!_1586)
    {
        int _1670 = ~_1650;
        int _1672 = _1670 + 1;
        _1668 = _1672;
    }
    int _1674 = _1668;
    float _1676 = _1584 * _130;
    float _1678 = _1654 * _1658;
    int _1680 = _1620 ? 0 : 1;
    float _1682 = in.m_57.x;
    float _1684 = in.m_57.y;
    float _1686 = in.m_57.z;
    float _1688 = _1678 * (-2.0);
    float _1690 = exp2(_1676);
    int _1692 = ~_1680;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    int _1698 = _1696;
    if (!_1610)
    {
        int _1700 = ~_1680;
        int _1702 = _1700 + 1;
        _1698 = _1702;
    }
    int _1704 = _1698;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1708 = 1.0 + _1706;
    float _1710 = 1.0 / _1708;
    bool _1712 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1714 = isnan(1.0);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1720 = _1716 || _1718;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1724 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1726 = isnan(0.0);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1732 = _1728 || _1730;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1736 = float(_1674);
    float _1738 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1722);
    float _1740 = -_1690;
    float _1742 = _1740 + 1.0;
    float _1744 = -_130;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1522);
    float _1748 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1738);
    float _1750 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1656);
    float _1752 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1734);
    float _1754 = _1732 ? _1742 : 0.0;
    float _1756 = fma(_1688, _1682, _1682);
    float _1758 = fma(_1542, _1688, _1542);
    int _1760 = abs(_1506);
    float _1762 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1752);
    float _1764 = -_130;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1638);
    float _1768 = _1512 * _1736;
    float _1770 = _1480 + _1468;
    if (_1720)
    {
        float _1772 = _1754 * _1710;
        _134 = _1772;
    }
    float _1774 = _134;
    float _1776 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1756);
    float _1778 = float(_1760);
    float _1780 = _1770 + (-1.0);
    float _1782 = float(_1704);
    float _1784 = _1768 * (-2.0);
    float _1786 = fma(_1758, _1774, _1776);
    float _1788 = _1778 * _1782;
    float _1790 = _1480 + (-0.5);
    float _1792 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1794 = fma(_1784, _1684, _1684);
    float _1796 = _1472 + _1468;
    float _1798 = _1788 * (-2.0);
    float _1800 = fma(_1792, _1784, _1792);
    float _1802 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1794);
    float _1804 = _1796 + (-1.0);
    float _1806 = fma(_1798, _1686, _1686);
    float _1808 = fma(_1800, _1774, _1802);
    float _1810 = _1786 * 0.15915493667125701904296875;
    float _1812 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1814 = _1808 * 0.15915493667125701904296875;
    float _1816 = _1468 + (-0.5);
    float _1818 = in.m_59.x;
    float _1820 = in.m_59.y;
    float _1822 = in.m_59.z;
    float _1824 = fma(_1812, _1798, _1812);
    float _1826 = _1810 * 6.283185482025146484375;
    float _1828 = sin(_1826);
    float _1830 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1832 = fma(_1824, _1774, _1830);
    float _1834 = _1810 * 6.283185482025146484375;
    float _1836 = cos(_1834);
    float _1838 = _1814 * 6.283185482025146484375;
    float _1840 = sin(_1838);
    float _1842 = _1832 * 0.15915493667125701904296875;
    float _1844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1818);
    float _1846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1820);
    float _1848 = _1814 * 6.283185482025146484375;
    float _1850 = cos(_1848);
    float _1852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1822);
    float _1854 = _1470 * _1844;
    float _1856 = _1478 * _1846;
    float _1858 = _1484 * _1852;
    float _1860 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1862 = _1842 * 6.283185482025146484375;
    float _1864 = cos(_1862);
    float _1866 = _1828 * _1840;
    float _1868 = _1836 * _1840;
    float _1870 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1860);
    float _1872 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1870);
    float _1874 = _1842 * 6.283185482025146484375;
    float _1876 = sin(_1874);
    float _1878 = _1836 * _1850;
    float _1880 = _1828 * _1850;
    float _1882 = _1836 * _1864;
    float _1884 = _1828 * _1864;
    float _1886 = _1850 * _1864;
    float _1888 = _1840 * _1864;
    float _1890 = _1872 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1892 = _1884 * _1856;
    float _1894 = fma(_1876, _1878, _1866);
    float _1896 = fma(_1876, _1866, _1878);
    float _1898 = _1882 * _1856;
    float _1900 = -_1868;
    float _1902 = fma(_1876, _1880, _1900);
    float _1904 = -_1880;
    float _1906 = fma(_1876, _1868, _1904);
    float _1908 = -_1856;
    float _1910 = _1876 * _1908;
    float _1912 = fma(_1894, _1854, _1898);
    float _1914 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1916 = fma(_1902, _1854, _1892);
    float _1918 = fma(_1886, _1854, _1910);
    float _1920 = fma(_1906, _1858, _1912);
    float _1922 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1914);
    float _1924 = fma(_1896, _1858, _1916);
    float _1926 = fma(_1888, _1858, _1918);
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1930 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1922);
    float _1932 = _1920 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1934 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1936 = fma(_1926, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1928);
    float _1938 = _1930 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1940 = fma(_1926, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1932);
    float _1942 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1934);
    float _1944 = fma(_1924, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1936);
    float _1946 = fma(_1924, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1940);
    float _1948 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1942);
    float _1950 = _1938 + _1944;
    float _1952 = _1890 + _1946;
    float _1954 = _1948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1958 = _1950 + _1956;
    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1962 = _1952 + _1960;
    float _1964 = _1958 * _1958;
    float _1966 = fma(_1962, _1962, _1964);
    float _1968 = _1920 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1970 = sqrt(_1966);
    float _1972 = fma(_1926, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1968);
    float _1974 = fma(_1924, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1972);
    float _1976 = _1954 + _1974;
    bool _1978 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1980 = _1954;
    float _1982 = _1948;
    float _1984 = _1820;
    if (!_1978)
    {
        _1980 = _1952;
    }
    float _1986 = _1980;
    float _1988 = _1986;
    if (!_1978)
    {
        _276 = _1950;
    }
    float _1990 = _276;
    float _1992 = _1990;
    if (!_1978)
    {
        _1982 = _1976;
    }
    float _1994 = _1982;
    bool _1996 = !_1978;
    float _1998 = _1994;
    if (!_1996)
    {
        float _2000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2004 = _1970 + _2002;
        float _2006 = _1976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2008 = rsqrt(_1966);
        float _2010 = _2004 * _2000;
        float _2012 = _2010 * 0.15915493667125701904296875;
        float _2014 = _2012 * 6.283185482025146484375;
        float _2016 = cos(_2014);
        float _2018 = _2012 * 6.283185482025146484375;
        float _2020 = sin(_2018);
        float _2022 = _2016 + (-1.0);
        float _2024 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2026 = fma(_2020, _2006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2028 = fma(_1976, _2016, _2024);
        float _2030 = _2008 * _2026;
        float _2032 = fma(_1962, _2030, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2034 = fma(_1958, _2030, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1998 = _2028;
        _1988 = _2032;
        _1992 = _2034;
    }
    float _2036 = _1998;
    float _2038 = _1988;
    float _2040 = _1992;
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2044 = _2036 + _2042;
    float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2048 = _2038 + _2046;
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2052 = _2040 + _2050;
    float _2054 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2056 = _2044 * _2044;
    float _2058 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2060 = fma(_2048, _2048, _2056);
    float _2062 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2058);
    float _2064 = fma(_2052, _2052, _2060);
    float _2066 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2062);
    float _2068 = rsqrt(_2064);
    float _2070 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2072 = sqrt(_2064);
    float _2074 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2076 = _2048 * _2074;
    float _2078 = _2052 * _2074;
    float _2080 = _2076 * _2076;
    float _2082 = _2078 * _2078;
    float _2084 = _2080 + _2082;
    float _2086 = sqrt(_2084);
    bool _2088 = _2086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2092 = _2086 + _2090;
    float _2094 = _2052;
    float _2096 = _2084;
    float _2098 = _2092;
    float _2100 = _2056;
    if (_2088)
    {
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2094 = _2102;
    }
    float _2104 = _2094;
    if (_2088)
    {
        float _2106 = rsqrt(_2084);
        _2096 = _2106;
    }
    float _2108 = _2096;
    float _2110 = _2108;
    if (_2088)
    {
        float _2112 = _2092 * _2104;
        _2098 = _2112;
    }
    float _2114 = _2098;
    if (_2088)
    {
        float _2116 = _2114 * 0.15915493667125701904296875;
        _2100 = _2116;
    }
    float _2118 = _2100;
    float _2120 = _2104;
    float _2122 = _2118;
    if (_2088)
    {
        float _2124 = _2118 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        _2120 = _2126;
    }
    float _2128 = _2120;
    float _2130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2132 = precise::max(0.0, _2130);
    float _2134 = _1924;
    float _2136 = _2132;
    if (_2088)
    {
        float _2138 = _2118 * 6.283185482025146484375;
        float _2140 = cos(_2138);
        _2134 = _2140;
    }
    float _2142 = _2134;
    float _2144 = -_2074;
    float _2146 = -_2132;
    float _2148 = fma(_2044, _2144, _2146);
    float _2150 = _2148;
    if (_2088)
    {
        float _2152 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2136 = _2152;
    }
    float _2154 = _2136;
    float _2156 = _2128;
    float _2158 = _2154;
    if (_2088)
    {
        float _2160 = fma(_2128, _2154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = _2162;
    float _2166 = _2142;
    if (_2088)
    {
        float _2168 = _2142 + (-1.0);
        _2158 = _2168;
    }
    float _2170 = _2158;
    float _2172 = 0.0;
    float _2174 = _2170;
    if (_2088)
    {
        float _2176 = _2108 * _2162;
        _2172 = _2176;
    }
    float _2178 = _2172;
    if (!_2088)
    {
        _2164 = _2076;
    }
    float _2180 = _2164;
    float _2182 = _2180;
    if (_2088)
    {
        float _2184 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2122 = _2184;
    }
    float _2186 = _2122;
    if (_2088)
    {
        float _2188 = _2076 * _2178;
        _2182 = _2188;
    }
    float _2190 = _2182;
    if (!_2088)
    {
        _2174 = _2078;
    }
    float _2192 = _2174;
    float _2194 = _2192;
    if (_2088)
    {
        float _2196 = _2078 * _2178;
        _2194 = _2196;
    }
    float _2198 = _2194;
    if (!_2088)
    {
        _2110 = _2080;
    }
    float _2200 = _2110;
    float _2202 = _2200;
    if (_2088)
    {
        float _2204 = fma(_2148, _2142, _2186);
        _2150 = _2204;
    }
    float _2206 = _2150;
    if (_2088)
    {
        float _2208 = _2190 * _2190;
        _2202 = _2208;
    }
    float _2210 = _2202;
    if (!_2088)
    {
        _2166 = _2082;
    }
    float _2212 = _2166;
    float _2214 = _2212;
    if (_2088)
    {
        float _2216 = _2198 * _2198;
        _2214 = _2216;
    }
    float _2218 = _2214;
    float _2220 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2222 = fma(_2206, _2206, _2210);
    float _2224 = _2222 + _2218;
    float _2226 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2220);
    float _2228 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2232 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2230);
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2226);
    float _2238 = rsqrt(_2224);
    float _2240 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2228);
    float _2242 = -_2234;
    float _2244 = _2242 + 1.0;
    float _2246 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2248 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2250 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2240);
    float _2252 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2254 = abs(_2244);
    float _2256 = log2(_2254);
    float _2258 = _2250 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2260 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2248);
    float _2262 = -_2252;
    float _2264 = fma(_2262, _2054, 1.0);
    float _2266 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2268 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2260);
    float _2270 = _2238 * _2190;
    float _2272 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2266);
    float _2274 = _2238 * _2206;
    float _2276 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2278 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2280 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2272);
    float _2282 = _2238 * _2198;
    float _2284 = log2(_2264);
    float _2286 = -_2278;
    float _2288 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2286);
    float _2290 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2292 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2280);
    float _2294 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2296 = -_2282;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2288);
    float _2300 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2302 = exp2(_2290);
    float _2304 = fma(_2298, -0.5, 0.5);
    float _2306 = fma(_2298, 0.5, 0.5);
    float _2308 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2300);
    float _2310 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2294);
    float _2312 = _2274 + 1.0;
    float _2314 = fma(_2306, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2316 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2308);
    float _2318 = 1.0 / _2292;
    float _2320 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2310);
    float _2322 = fma(_2306, _2314, -0.212114393711090087890625);
    float _2324 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2316);
    float _2326 = _2284 * 0.693147182464599609375;
    float _2328 = fma(_2306, _2322, 1.570728778839111328125);
    float _2330 = sqrt(_2304);
    float _2332 = -_2274;
    float _2334 = fma(_2302, _2312, _2332);
    float _2336 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2320);
    float _2338 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2340 = fma(_2334, 0.5, 0.5);
    float _2342 = _2324 * _2318;
    float _2344 = _2336 * _2318;
    float _2346 = fma(_2342, 0.5, 0.5);
    float _2348 = fma(_2344, -0.5, 0.5);
    float _2350 = _2330 * 0.636619746685028076171875;
    float _2352 = -_2328;
    float _2354 = fma(_2350, _2352, 1.0);
    float3 _6647 = float3(_2346, _2348, _2338);
    float _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6647, float3(0.0), isnan(_6647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6647, float3(0.0), isnan(_6647)), level(0.0)).x;
    float3 _6658 = float3(_2346, _2348, _2338);
    float4 _2359 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6658, float3(0.0), isnan(_6658)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6658, float3(0.0), isnan(_6658)), level(0.0)).xyzw;
    float _2361 = _2359.x;
    float _2363 = _2359.y;
    float _2365 = _2359.z;
    float _2367 = _2359.w;
    float2 _6675 = float2(_2354, _2340);
    float3 _2371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6675, float2(0.0), isnan(_6675)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6675, float2(0.0), isnan(_6675)), level(0.0)).xyz;
    float _2373 = _2371.x;
    float _2375 = _2371.y;
    float _2377 = _2371.z;
    float _2379 = in.m_61.y;
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2383 = _1466 + _2381;
    float _2385 = in.m_51.w;
    float _2387 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2389 = _2387 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2393 = _2391 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2395 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2397 = _1466 + _2395;
    int _2399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2401 = _2399 != 0;
    float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2405 = _2403 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2409 = _2407 != 0;
    float _2411 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2413 = _2411 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2415 = 1.0 / _2389;
    bool _2417 = _1480 > 0.5;
    float _2419 = in.m_61.x;
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2423 = _2421 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2425 = _1468 > 0.5;
    float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2429 = _1466 + _2427;
    int _2431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2433 = _2431 != 0;
    float _2435 = -_2379;
    float _2437 = _2435 + 1.0;
    float _2439 = 1.0 / _2393;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _2445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2447 = _2445 != 0;
    float _2449 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2451 = _2385 > 0.5;
    out.m_63.x = _2038;
    out.m_63.y = _2036;
    out.m_63.z = _2040;
    int _2453 = _2417 ? as_type<int>(_2437) : as_type<int>(_2379);
    float _2455 = 1.0 / _2405;
    int _2457 = _2425 ? as_type<int>(_2437) : as_type<int>(_2379);
    float _2459 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2461 = _2459 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2463 = _2433 ? as_type<float>(_2453) : _2379;
    float _2465 = _2447 ? as_type<float>(_2457) : _2379;
    float _2467 = 1.0 / _2413;
    float _2469 = _2379;
    bool _2471 = _2451;
    if (_2401)
    {
        float _2473 = _2451 ? _2437 : _2379;
        _2469 = _2473;
    }
    float _2475 = _2469;
    if (_2409)
    {
        bool _2477 = _1472 > 0.5;
        _2471 = _2477;
    }
    bool _2479 = _2471;
    float _2481 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2483 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2481;
    float _2485 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2489 = 1.0 / _2423;
    float _2491 = _2483 * _2415;
    float _2493 = _2487 * _2439;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2495;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2499;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2505 = _2503 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2507 = _2497 * _2455;
    float _2509 = 1.0 / _2443;
    float _2511 = _2501 * _2467;
    float _2513 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2515 = _2513 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _2517 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2519 = isnan(_1466);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2525 = _2521 || _2523;
    float _2527 = float(_2525);
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2529;
    float _2533 = fma(_2491, _2383, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2535 = fma(_2493, _2397, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2539 = _1466 + _2537;
    float _2541 = 1.0 / _2461;
    float _2543 = _2505 * _2489;
    bool _2545 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2547 = isnan(_1466);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2553 = _2549 || _2551;
    float _2555 = float(_2553);
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2559 = _1466 + _2557;
    bool _2561 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2563 = isnan(_1466);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    float _2573 = fma(_2507, _2539, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    int _2575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2577 = _2575 != 0;
    float _2579 = fma(_2543, _2559, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2581 = _2515 * _2509;
    float _2583 = -_2527;
    float _2585 = _2583 + 1.0;
    bool _2587 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2589 = isnan(_1466);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    float _2599 = -_2571;
    float _2601 = _2599 + 1.0;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2605 = _2603 != 0;
    float _2607 = _2555 * _2585;
    bool _2609 = _1820 != 0.0;
    bool _2611 = isnan(_1820);
    bool _2613 = _2609 || _2611;
    bool _2615 = isnan(0.0);
    bool _2617 = _2613 || _2615;
    float _2619 = -_2597;
    float _2621 = _2619 + 1.0;
    float _2623 = _2531 * _2541;
    float _2625 = -_2555;
    float _2627 = _2625 + 1.0;
    bool _2629 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2631 = isnan(_1466);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2637 = _2633 || _2635;
    float _2639 = float(_2637);
    float _2641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2643 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2645 = isnan(_1466);
    bool _2647 = _2643 || _2645;
    bool _2649 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2651 = _2647 || _2649;
    float _2653 = float(_2651);
    float _2655 = _2571 * _2627;
    bool _2657 = _1818 == 0.0;
    bool _2659 = !_2617;
    bool _2661 = _2657 && _2659;
    float _2663 = -_2639;
    float _2665 = _2663 + 1.0;
    float _2667 = _2639 * _2601;
    bool _2669 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2671 = isnan(_1466);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    float _2681 = -_2653;
    float _2683 = _2681 + 1.0;
    float _2685 = _2597 * _2665;
    bool _2687 = _1822 == 0.0;
    bool _2689 = _2687 && _2661;
    float _2691 = in.m_65.x;
    float _2693 = in.m_65.y;
    float _2695 = in.m_65.z;
    float _2697 = _2653 * _2621;
    bool _2699 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2701 = isnan(_1466);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2707 = _2703 || _2705;
    float _2709 = float(_2707);
    float _2711 = _2679 * _2683;
    float _2713 = -_2679;
    float _2715 = _2713 + 1.0;
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2719 = _1466 + _2717;
    float _2721 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2723 = _1466 + _2721;
    float _2725 = exp2(_2449);
    float _2727 = _2709 * _2715;
    float _2729 = fma(_2511, _2719, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2731 = _2641 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2733 = _2641;
    float _2735 = _2419;
    if (!_2409)
    {
        _2733 = _2419;
    }
    float _2737 = _2733;
    float _2739 = _2533 * _2727;
    float _2741 = -_2709;
    float _2743 = _2741 + 1.0;
    float _2745 = fma(_2731, _2463, -0.5);
    float _2747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2749 = fma(_2581, _2429, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2751 = fma(_2743, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2739);
    float _2753 = -_1544;
    float _2755 = fma(_1748, _2745, _2753);
    int _2757 = as_type<int>(_2745);
    float _2759 = _2737;
    if (_2577)
    {
        float _2761 = -_2419;
        float _2763 = _2761 + 1.0;
        _2757 = as_type<int>(_2763);
    }
    int _2765 = _2757;
    float _2767 = fma(_2623, _2723, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2769 = fma(_2535, _2711, _2751);
    float _2771 = _2292 * 0.5;
    float _2773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2775 = _2691;
    float _2777 = _2695;
    float _2779 = _2693;
    if (!_2689)
    {
        float _2781 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2691);
        _2775 = _2781;
    }
    float _2783 = _2775;
    if (!_2689)
    {
        float _2785 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2695);
        _2777 = _2785;
    }
    float _2787 = _2777;
    if (!_2689)
    {
        float _2789 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2693);
        _2779 = _2789;
    }
    float _2791 = _2779;
    if (!_2577)
    {
        _1984 = _2419;
    }
    float _2793 = _1984;
    float _2795 = fma(_2573, _2697, _2769);
    float _2797 = _2793;
    if (_2577)
    {
        float _2799 = _2425 ? as_type<float>(_2765) : _2419;
        _2797 = _2799;
    }
    float _2801 = _2797;
    float _2803 = _1882 * _2791;
    float _2805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2807 = _2747 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2809 = as_type<int>(_2747);
    if (_2409)
    {
        float _2811 = -_2419;
        float _2813 = _2811 + 1.0;
        _2809 = as_type<int>(_2813);
    }
    int _2815 = _2809;
    float _2817 = -_2791;
    float _2819 = _1876 * _2817;
    float _2821 = fma(_1894, _2783, _2803);
    float _2823 = fma(_2807, _2475, -0.5);
    float _2825 = _1884 * _2791;
    int _2827 = _2815;
    if (_2409)
    {
        float _2829 = _2479 ? as_type<float>(_2815) : _2419;
        _2759 = _2829;
    }
    float _2831 = _2759;
    float _2833 = _2773 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2835 = fma(_1886, _2783, _2819);
    float _2837 = fma(_1906, _2787, _2821);
    float _2839 = -_1750;
    float _2841 = fma(_1652, _2823, _2839);
    float _2843 = fma(_1902, _2783, _2825);
    float _2845 = fma(_1888, _2787, _2835);
    float _2847 = fma(_2579, _2685, _2795);
    if (_2605)
    {
        float _2849 = -_2419;
        float _2851 = _2849 + 1.0;
        _2827 = as_type<int>(_2851);
    }
    int _2853 = _2827;
    float _2855 = _2805 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2857 = fma(_2833, _2831, -0.5);
    float _2859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2861 = -_2725;
    float _2863 = _2861 + 1.0;
    float _2865 = fma(_2855, _2801, -0.5);
    float _2867 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2869 = fma(_1762, _2857, _1746);
    float _2871 = _2837 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2873 = fma(_1632, _2865, _1766);
    float _2875 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2867);
    float _2877 = _2837 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2879 = fma(_2845, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2871);
    float _2881 = _2841 + 0.5;
    float _2883 = _2869 + 0.5;
    float _2885 = fma(_2845, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2877);
    float _2887 = _2755 + 0.5;
    float _2889 = _2873 + 0.5;
    float _2891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2893 = fma(_2729, _2667, _2847);
    float _2895 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2875);
    if (_2605)
    {
        float _2897 = _2417 ? as_type<float>(_2853) : _2419;
        _2735 = _2897;
    }
    float _2899 = _2735;
    out.m_67.x = _2883;
    out.m_67.y = _2887;
    out.m_67.z = _2889;
    out.m_67.w = _2881;
    float _2901 = _2837 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2903 = fma(_2749, _2655, _2893);
    float _2905 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2895);
    float _2907 = fma(_1896, _2787, _2843);
    float _2909 = fma(_2845, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2901);
    float _2911 = fma(_2767, _2607, _2903);
    float _2913 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2915 = _2899 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2917 = _2905 + _2292;
    float _2919 = _2324 + _2292;
    float _2921 = fma(_2907, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2909);
    float _2923 = fma(_2907, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2885);
    float _2925 = fma(_2336, -0.5, _2771);
    float _2927 = _2863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2929 = fma(_2527, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2911);
    float _2931 = _2913 * _2891;
    float _2933 = -_2927;
    float _2935 = _2933 + 1.0;
    float _2937 = _2915 * _2859;
    float _2939 = fma(_2907, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2879);
    float _2941 = _2917 * 0.5;
    float _2943 = _2919 * 0.5;
    float _2945 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2937;
    out.m_69.y = _2931;
    out.m_71.x = _2929;
    out.m_73.x = _2923;
    out.m_73.y = _2939;
    out.m_73.z = _2921;
    out.gl_Position.x = _2324;
    out.gl_Position.y = _2336;
    out.gl_Position.z = _2905;
    out.gl_Position.w = _2292;
    out.m_75.x = _2943;
    out.m_75.y = _2925;
    out.m_75.z = _2941;
    out.m_75.w = _2292;
    out.m_45.x = _2945;
    float _2947 = _2927 * _2356;
    float _2949 = _2367 * _2935;
    float _2951 = _2367 * _2947;
    float _2953 = _2377 * _2947;
    float _2955 = fma(_2373, _2951, _2361);
    float _2957 = fma(_2375, _2951, _2363);
    float _2959 = fma(_2367, _2953, _2365);
    out.m_77.x = _2955;
    out.m_77.y = _2957;
    out.m_77.z = _2959;
    out.m_77.w = _2949;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1458 = false;
    bool _1316 = false;
    bool _1040 = false;
    bool _860 = false;
    bool _626 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3016 = as_type<float>(_112);
        out.gl_Position.z = _3016;
    }
    if (!_100)
    {
        return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = _130;
    if (_126)
    {
        float _136 = float(_96);
        _132 = _136;
    }
    float _138 = _132;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    if (_144)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _106;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3085 = as_type<float>(_150);
        out.gl_Position.z = _3085;
    }
    if (_144)
    {
        return out;
    }
    float _152 = in.m_49.w;
    float _154 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
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
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _276 = _272;
    float _294;
    if (!_274)
    {
        float _278 = in.m_51.x;
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
        float _298 = float(_96);
        float _300 = 1.0 / _298;
        float _302 = _130 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _304 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = 1.0 / _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _328;
    float _332 = 1.0 / _320;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    bool _338 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_304);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    bool _354 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _356 = isnan(_304);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = 1.0 / _316;
    float _368 = _336 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _372 = _304 + _370;
    bool _374 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _376 = isnan(_304);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = fma(_352, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = 1.0 / _324;
    float _390 = _372 * _332;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _394 = _304 + _392;
    bool _396 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _398 = isnan(_304);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    bool _408 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _410 = isnan(_304);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = 1.0 / _330;
    float _422 = _308 * _366;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _426 = _304 + _424;
    bool _428 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _430 = isnan(_304);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _444 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _446 = _394 * _388;
    float _448 = -_406;
    float _450 = _448 + 1.0;
    float _452 = fma(_442, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _454 = _418 * _450;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -_418;
    float _462 = _460 + 1.0;
    float _464 = _426 * _420;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _466;
    float _470 = fma(_458, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _472 = _364 * _462;
    float _474 = -_364;
    float _476 = _474 + 1.0;
    float _478 = fma(_468, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _480 = -_384;
    float _482 = _480 + 1.0;
    float _484 = _384 * _476;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = _348 * _482;
    float _492 = -_348;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _500 = fma(_488, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _502 = _438 * _494;
    float _504 = -_438;
    float _506 = _504 + 1.0;
    float _508 = fma(_498, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _510 = _470 * _502;
    float _512 = _478 * _502;
    float _514 = _386 * _502;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _516;
    float _520 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].x, _510);
    float _522 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].y, _512);
    float _524 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].z, _514);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = fma(_518, _390, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _532 = fma(_452, _490, _520);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _538;
    float _542 = fma(_528, _446, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _548 = fma(_530, _484, _532);
    float _550 = fma(_536, _390, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _552 = fma(_500, _490, _522);
    float _554 = fma(_540, _390, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _560 = fma(_508, _490, _524);
    float _562 = fma(_546, _446, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _564 = fma(_550, _484, _552);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _570;
    float _574 = fma(_558, _446, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _576 = fma(_554, _484, _560);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _578;
    float _582 = fma(_568, _464, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _584 = fma(_572, _464, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _586 = fma(_542, _472, _548);
    float _588 = fma(_580, _464, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _590 = fma(_574, _472, _564);
    float _592 = fma(_562, _472, _576);
    float _594 = fma(_582, _454, _586);
    float _596 = fma(_584, _454, _590);
    float _598 = fma(_588, _454, _592);
    float _600 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[148].x, _594);
    float _602 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[148].y, _596);
    float _604 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[148].z, _598);
    bool _606 = !_444;
    float _624;
    if (!_606)
    {
        float _608 = in.m_51.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_96);
        float _630 = 1.0 / _628;
        float _632 = _130 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = in.m_49.x;
    float _638 = in.m_49.y;
    float _640 = in.m_49.z;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _644 = _634 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _648 = _634 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _658;
    float _662 = 1.0 / _652;
    bool _664 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _666 = 1.0 / _656;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _668;
    float _672 = _604 * _640;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _676 = _634 + _674;
    float _678 = 1.0 / _660;
    float _680 = _602 * _638;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _682;
    float _686 = _676 * _662;
    bool _688 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _690 = isnan(_634);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _700;
    float _704 = fma(_684, _686, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _706 = _644 * _666;
    bool _708 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _710 = isnan(_634);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = fma(_702, _686, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _722 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _724 = isnan(_634);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = fma(_670, _686, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _736 = _648 * _678;
    float _738 = -_698;
    float _740 = _738 + 1.0;
    float _742 = -_732;
    float _744 = _742 + 1.0;
    float _746 = _718 * _740;
    bool _748 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _750 = isnan(_634);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _764 = -_718;
    float _766 = _764 + 1.0;
    float _768 = _758 * _744;
    float _770 = _732 * _766;
    float _772 = -_758;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _780 = _704 * _768;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _786 = _720 * _768;
    float _788 = _734 * _768;
    float _790 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[107].x, _780);
    float _792 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[107].y, _786);
    float _794 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[107].z, _788);
    float _796 = fma(_762, _706, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _798 = fma(_778, _706, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _800 = fma(_784, _706, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _810;
    float _814 = fma(_796, _770, _790);
    float _816 = fma(_804, _736, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _818 = fma(_808, _736, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _820 = fma(_812, _736, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _822 = fma(_798, _770, _792);
    float _824 = fma(_800, _770, _794);
    float _826 = fma(_816, _746, _814);
    float _828 = _600 * _636;
    float _830 = fma(_818, _746, _822);
    float _832 = fma(_820, _746, _824);
    float _834 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[110].x, _826);
    float _836 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[110].y, _830);
    float _838 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[110].z, _832);
    bool _840 = !_664;
    float _858;
    if (!_840)
    {
        float _842 = in.m_51.x;
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _846 = _842 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _850 = _848 * _844;
        float _852 = floor(_850);
        float _854 = -_852;
        float _856 = _850 + _854;
        _858 = _856;
        _860 = true;
    }
    else
    {
        float _862 = float(_96);
        float _864 = 1.0 / _862;
        float _866 = _130 * _864;
        _858 = _866;
    }
    _860 = false;
    float _868 = _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _872 = _868 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _878 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _880 = isnan(_868);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _898 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _900 = isnan(_868);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = 1.0 / _876;
    float _912 = -_888;
    float _914 = _912 + 1.0;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _916;
    bool _920 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _922 = isnan(_868);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = _908 * _914;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    bool _938 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _940 = 1.0 / _892;
    float _942 = _930 * _936;
    float _944 = -_930;
    float _946 = _944 + 1.0;
    float _948 = 1.0 / _896;
    float _950 = _918 * _910;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = fma(_950, _872, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _958 = _954 * _940;
    bool _960 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _962 = isnan(_868);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _978 = _868 + _976;
    float _980 = _956 * _942;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _984 = _868 + _982;
    float _986 = -_970;
    float _988 = _986 + 1.0;
    float _990 = fma(_958, _978, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _992 = _974 * _948;
    float _994 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[115].x, _980);
    float _996 = _888 * _988;
    float _998 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1000 = fma(_992, _984, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1002 = fma(_990, _932, _994);
    float _1004 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1006 = fma(_1000, _996, _1002);
    float _1008 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1006);
    float _1014 = _998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1014;
    out.m_53.y = _1016;
    out.m_53.z = _1010;
    out.m_53.w = _1018;
    bool _1020 = !_938;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_51.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        float _1042 = float(_96);
        float _1044 = 1.0 / _1042;
        float _1046 = _130 * _1044;
        _1038 = _1046;
    }
    _1040 = false;
    float _1048 = _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1052 = _1048 + _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1060 = _1048 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1078 = 1.0 / _1068;
    bool _1080 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1082 = 1.0 / _1064;
    float _1084 = 1.0 / _1072;
    float _1086 = 1.0 / _1076;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1090 = _1048 + _1088;
    float _1092 = _1052 * _1082;
    bool _1094 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1096 = isnan(_1048);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = _1090 * _1078;
    bool _1108 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1110 = isnan(_1048);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = _1056 * _1084;
    bool _1122 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1124 = isnan(_1048);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1118;
    float _1136 = _1134 + 1.0;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1138;
    float _1142 = _1104 * _1136;
    float _1144 = _1060 * _1086;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1150;
    float _1154 = -_1104;
    float _1156 = _1154 + 1.0;
    float _1158 = fma(_1140, _1120, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1160 = fma(_1148, _1120, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1162 = fma(_1152, _1120, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1164 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1166 = isnan(_1048);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -_1132;
    float _1178 = _1176 + 1.0;
    float _1180 = _1132 * _1156;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1186 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1188 = isnan(_1048);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = _1174 * _1178;
    float _1200 = -_1174;
    float _1202 = _1200 + 1.0;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1212 = fma(_1184, _1144, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1214 = _1196 * _1202;
    float _1216 = fma(_1206, _1144, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1218 = fma(_1210, _1144, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1220 = -_1196;
    float _1222 = _1220 + 1.0;
    float _1224 = _1158 * _1214;
    float _1226 = _1160 * _1214;
    float _1228 = _1162 * _1214;
    float _1230 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1224);
    float _1232 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1226);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1234;
    float _1238 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1228);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1244;
    float _1248 = fma(_1216, _1198, _1230);
    float _1250 = fma(_1218, _1198, _1232);
    float _1252 = fma(_1212, _1198, _1238);
    float _1254 = fma(_1236, _1092, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1256 = fma(_1242, _1092, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1258 = fma(_1246, _1092, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1272 = fma(_1254, _1180, _1248);
    float _1274 = fma(_1262, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1276 = fma(_1266, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1278 = fma(_1270, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1280 = fma(_1256, _1180, _1250);
    float _1282 = fma(_1258, _1180, _1252);
    float _1284 = fma(_1274, _1142, _1272);
    float _1286 = fma(_1276, _1142, _1280);
    float _1288 = fma(_1278, _1142, _1282);
    float _1290 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1284);
    float _1292 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1286);
    float _1294 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1288);
    bool _1296 = !_1080;
    float _1314;
    if (!_1296)
    {
        float _1298 = in.m_51.x;
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1302 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1304 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _1306 = _1304 * _1300;
        float _1308 = floor(_1306);
        float _1310 = -_1308;
        float _1312 = _1306 + _1310;
        _1314 = _1312;
        _1316 = true;
    }
    else
    {
        float _1318 = float(_96);
        float _1320 = 1.0 / _1318;
        float _1322 = _130 * _1320;
        _1314 = _1322;
    }
    _1316 = false;
    float _1324 = _1314;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1328 = _1324 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1334 = _1324 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1336 = isnan(_1324);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1350 = _1324 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1352 = isnan(_1324);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1358 = _1354 || _1356;
    float _1360 = float(_1358);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1362;
    bool _1366 = _1324 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1368 = isnan(_1324);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = 1.0 / _1332;
    float _1380 = -_1344;
    float _1382 = _1380 + 1.0;
    bool _1384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1386 = -_1376;
    float _1388 = _1386 + 1.0;
    float _1390 = 1.0 / _1348;
    float _1392 = _1344 * _1388;
    float _1394 = _1364 * _1378;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1398 = _1396 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1400 = fma(_1394, _1328, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1402 = _1360 * _1382;
    float _1404 = -_1360;
    float _1406 = _1404 + 1.0;
    float _1408 = _1398 * _1390;
    float _1410 = _1400 * _1402;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1414 = _1324 + _1412;
    float _1416 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1410);
    float _1420 = fma(_1408, _1414, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1422 = _1292 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1424 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1426 = fma(_1420, _1392, _1418);
    float _1428 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1426);
    float _1434 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1436 = _1432 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_55.x = _1428;
    out.m_55.y = _1430;
    out.m_55.z = _1434;
    out.m_55.w = _1436;
    bool _1438 = !_1384;
    float _1456;
    if (!_1438)
    {
        float _1440 = in.m_51.x;
        float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1444 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[14].y, _130);
        float _1448 = _1446 * _1442;
        float _1450 = floor(_1448);
        float _1452 = -_1450;
        float _1454 = _1448 + _1452;
        _1456 = _1454;
        _1458 = true;
    }
    else
    {
        float _1460 = float(_96);
        float _1462 = 1.0 / _1460;
        float _1464 = _130 * _1462;
        _1456 = _1464;
    }
    _1458 = false;
    float _1466 = _1456;
    float _1468 = in.m_51.z;
    float _1470 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1472 = in.m_51.x;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1476 = _1474 != 0;
    float _1478 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1480 = in.m_51.y;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1484 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1488 = _1486 != 0;
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1492 = _1490 != 0;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1496 = _1494 != 0;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1500 = !_1492;
    int _1502 = _1500 ? 0 : 1;
    bool _1504 = !_1496;
    int _1506 = _1504 ? 0 : 1;
    int _1508 = abs(_1502);
    float _1510 = _1468 * 2.0;
    float _1512 = float(_1508);
    float _1514 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1516 = _1472 * 2.0;
    float _1518 = floor(_1510);
    float _1520 = -_1482;
    float _1522 = fma(_1514, 2.0, _1520);
    float _1524 = _1472 + _1480;
    float _1526 = _1480 * 2.0;
    float _1528 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1530 = _1524 + (-1.0);
    float _1532 = floor(_1516);
    float _1534 = fma(_1528, -2.0, _1498);
    float _1536 = _1528;
    float _1538 = _1530;
    if (!_1476)
    {
        _1536 = _1480;
    }
    float _1540 = _1536;
    float _1542 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1544 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1534);
    float _1546 = _1540;
    if (!_1476)
    {
        _1538 = _1468;
    }
    float _1548 = _1538;
    float _1550 = floor(_1526);
    bool _1552 = _1518 > 0.0;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1556 = _1518 >= 0.0;
    bool _1558 = isnan(_1518);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan(0.0);
    bool _1564 = _1560 || _1562;
    float _1566 = _1548;
    float _1568 = _1518;
    if (_1476)
    {
        _1566 = _1480;
    }
    float _1570 = _1566;
    if (!_1476)
    {
        _1568 = _1468;
    }
    float _1572 = _1568;
    float _1574 = _1572;
    if (_1476)
    {
        _1546 = _1472;
    }
    float _1576 = _1546;
    float _1578 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1554);
    if (_1476)
    {
        _1574 = _1480;
    }
    float _1580 = _1574;
    float _1582 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1584 = log2(_1582);
    bool _1586 = _1532 > 0.0;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1590 = _1532 >= 0.0;
    bool _1592 = isnan(_1532);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan(0.0);
    bool _1598 = _1594 || _1596;
    float _1600 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1602 = _1564 ? 0 : 1;
    bool _1604 = !_1488;
    int _1606 = _1604 ? 0 : 1;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1610 = _1550 > 0.0;
    bool _1612 = _1550 >= 0.0;
    bool _1614 = isnan(_1550);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan(0.0);
    bool _1620 = _1616 || _1618;
    float _1622 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1608);
    float _1624 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1626 = ~_1602;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    float _1632 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1622);
    int _1634 = abs(_1606);
    float _1636 = -_1588;
    float _1638 = fma(_1624, 2.0, _1636);
    int _1640 = _1630;
    if (!_1552)
    {
        int _1642 = ~_1602;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1650 = _1598 ? 0 : 1;
    float _1652 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1578);
    float _1654 = float(_1634);
    float _1656 = fma(_1600, -2.0, _1648);
    float _1658 = float(_1646);
    float _1660 = _1472 + (-0.5);
    int _1662 = ~_1650;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    int _1668 = _1666;
    if (!_1586)
    {
        int _1670 = ~_1650;
        int _1672 = _1670 + 1;
        _1668 = _1672;
    }
    int _1674 = _1668;
    float _1676 = _1584 * _130;
    float _1678 = _1654 * _1658;
    int _1680 = _1620 ? 0 : 1;
    float _1682 = in.m_57.x;
    float _1684 = in.m_57.y;
    float _1686 = in.m_57.z;
    float _1688 = _1678 * (-2.0);
    float _1690 = exp2(_1676);
    int _1692 = ~_1680;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    int _1698 = _1696;
    if (!_1610)
    {
        int _1700 = ~_1680;
        int _1702 = _1700 + 1;
        _1698 = _1702;
    }
    int _1704 = _1698;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1708 = 1.0 + _1706;
    float _1710 = 1.0 / _1708;
    bool _1712 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1714 = isnan(1.0);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1720 = _1716 || _1718;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1724 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1726 = isnan(0.0);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1732 = _1728 || _1730;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1736 = float(_1674);
    float _1738 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1722);
    float _1740 = -_1690;
    float _1742 = _1740 + 1.0;
    float _1744 = -_130;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1522);
    float _1748 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1738);
    float _1750 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1656);
    float _1752 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1734);
    float _1754 = _1732 ? _1742 : 0.0;
    float _1756 = fma(_1688, _1682, _1682);
    float _1758 = fma(_1542, _1688, _1542);
    int _1760 = abs(_1506);
    float _1762 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1752);
    float _1764 = -_130;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1638);
    float _1768 = _1512 * _1736;
    float _1770 = _1480 + _1468;
    if (_1720)
    {
        float _1772 = _1754 * _1710;
        _134 = _1772;
    }
    float _1774 = _134;
    float _1776 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1756);
    float _1778 = float(_1760);
    float _1780 = _1770 + (-1.0);
    float _1782 = float(_1704);
    float _1784 = _1768 * (-2.0);
    float _1786 = fma(_1758, _1774, _1776);
    float _1788 = _1778 * _1782;
    float _1790 = _1480 + (-0.5);
    float _1792 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1794 = fma(_1784, _1684, _1684);
    float _1796 = _1472 + _1468;
    float _1798 = _1788 * (-2.0);
    float _1800 = fma(_1792, _1784, _1792);
    float _1802 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1794);
    float _1804 = _1796 + (-1.0);
    float _1806 = fma(_1798, _1686, _1686);
    float _1808 = fma(_1800, _1774, _1802);
    float _1810 = _1786 * 0.15915493667125701904296875;
    float _1812 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1814 = _1808 * 0.15915493667125701904296875;
    float _1816 = _1468 + (-0.5);
    float _1818 = in.m_59.x;
    float _1820 = in.m_59.y;
    float _1822 = in.m_59.z;
    float _1824 = fma(_1812, _1798, _1812);
    float _1826 = _1810 * 6.283185482025146484375;
    float _1828 = sin(_1826);
    float _1830 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1832 = fma(_1824, _1774, _1830);
    float _1834 = _1810 * 6.283185482025146484375;
    float _1836 = cos(_1834);
    float _1838 = _1814 * 6.283185482025146484375;
    float _1840 = sin(_1838);
    float _1842 = _1832 * 0.15915493667125701904296875;
    float _1844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1818);
    float _1846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1820);
    float _1848 = _1814 * 6.283185482025146484375;
    float _1850 = cos(_1848);
    float _1852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1822);
    float _1854 = _1470 * _1844;
    float _1856 = _1478 * _1846;
    float _1858 = _1484 * _1852;
    float _1860 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1862 = _1842 * 6.283185482025146484375;
    float _1864 = cos(_1862);
    float _1866 = _1828 * _1840;
    float _1868 = _1836 * _1840;
    float _1870 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1860);
    float _1872 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1870);
    float _1874 = _1842 * 6.283185482025146484375;
    float _1876 = sin(_1874);
    float _1878 = _1836 * _1850;
    float _1880 = _1828 * _1850;
    float _1882 = _1836 * _1864;
    float _1884 = _1828 * _1864;
    float _1886 = _1850 * _1864;
    float _1888 = _1840 * _1864;
    float _1890 = _1872 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1892 = _1884 * _1856;
    float _1894 = fma(_1876, _1878, _1866);
    float _1896 = fma(_1876, _1866, _1878);
    float _1898 = _1882 * _1856;
    float _1900 = -_1868;
    float _1902 = fma(_1876, _1880, _1900);
    float _1904 = -_1880;
    float _1906 = fma(_1876, _1868, _1904);
    float _1908 = -_1856;
    float _1910 = _1876 * _1908;
    float _1912 = fma(_1894, _1854, _1898);
    float _1914 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1916 = fma(_1902, _1854, _1892);
    float _1918 = fma(_1886, _1854, _1910);
    float _1920 = fma(_1906, _1858, _1912);
    float _1922 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1914);
    float _1924 = fma(_1896, _1858, _1916);
    float _1926 = fma(_1888, _1858, _1918);
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1930 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1922);
    float _1932 = _1920 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1934 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1936 = fma(_1926, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1928);
    float _1938 = _1930 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1940 = fma(_1926, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1932);
    float _1942 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1934);
    float _1944 = fma(_1924, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1936);
    float _1946 = fma(_1924, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1940);
    float _1948 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1942);
    float _1950 = _1938 + _1944;
    float _1952 = _1890 + _1946;
    float _1954 = _1948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1958 = _1950 + _1956;
    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1962 = _1952 + _1960;
    float _1964 = _1958 * _1958;
    float _1966 = fma(_1962, _1962, _1964);
    float _1968 = _1920 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1970 = sqrt(_1966);
    float _1972 = fma(_1926, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1968);
    float _1974 = fma(_1924, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1972);
    float _1976 = _1954 + _1974;
    bool _1978 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1980 = _1954;
    float _1982 = _1948;
    float _1984 = _1820;
    if (!_1978)
    {
        _1980 = _1952;
    }
    float _1986 = _1980;
    float _1988 = _1986;
    if (!_1978)
    {
        _276 = _1950;
    }
    float _1990 = _276;
    float _1992 = _1990;
    if (!_1978)
    {
        _1982 = _1976;
    }
    float _1994 = _1982;
    bool _1996 = !_1978;
    float _1998 = _1994;
    if (!_1996)
    {
        float _2000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2004 = _1970 + _2002;
        float _2006 = _1976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2008 = rsqrt(_1966);
        float _2010 = _2004 * _2000;
        float _2012 = _2010 * 0.15915493667125701904296875;
        float _2014 = _2012 * 6.283185482025146484375;
        float _2016 = cos(_2014);
        float _2018 = _2012 * 6.283185482025146484375;
        float _2020 = sin(_2018);
        float _2022 = _2016 + (-1.0);
        float _2024 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2026 = fma(_2020, _2006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2028 = fma(_1976, _2016, _2024);
        float _2030 = _2008 * _2026;
        float _2032 = fma(_1962, _2030, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2034 = fma(_1958, _2030, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1998 = _2028;
        _1988 = _2032;
        _1992 = _2034;
    }
    float _2036 = _1998;
    float _2038 = _1988;
    float _2040 = _1992;
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2044 = _2036 + _2042;
    float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2048 = _2038 + _2046;
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2052 = _2040 + _2050;
    float _2054 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2056 = _2044 * _2044;
    float _2058 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2060 = fma(_2048, _2048, _2056);
    float _2062 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2058);
    float _2064 = fma(_2052, _2052, _2060);
    float _2066 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2062);
    float _2068 = rsqrt(_2064);
    float _2070 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2072 = sqrt(_2064);
    float _2074 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2076 = _2048 * _2074;
    float _2078 = _2052 * _2074;
    float _2080 = _2076 * _2076;
    float _2082 = _2078 * _2078;
    float _2084 = _2080 + _2082;
    float _2086 = sqrt(_2084);
    bool _2088 = _2086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2092 = _2086 + _2090;
    float _2094 = _2052;
    float _2096 = _2084;
    float _2098 = _2092;
    float _2100 = _2056;
    if (_2088)
    {
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2094 = _2102;
    }
    float _2104 = _2094;
    if (_2088)
    {
        float _2106 = rsqrt(_2084);
        _2096 = _2106;
    }
    float _2108 = _2096;
    float _2110 = _2108;
    if (_2088)
    {
        float _2112 = _2092 * _2104;
        _2098 = _2112;
    }
    float _2114 = _2098;
    if (_2088)
    {
        float _2116 = _2114 * 0.15915493667125701904296875;
        _2100 = _2116;
    }
    float _2118 = _2100;
    float _2120 = _2104;
    float _2122 = _2118;
    if (_2088)
    {
        float _2124 = _2118 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        _2120 = _2126;
    }
    float _2128 = _2120;
    float _2130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2132 = precise::max(0.0, _2130);
    float _2134 = _1924;
    float _2136 = _2132;
    if (_2088)
    {
        float _2138 = _2118 * 6.283185482025146484375;
        float _2140 = cos(_2138);
        _2134 = _2140;
    }
    float _2142 = _2134;
    float _2144 = -_2074;
    float _2146 = -_2132;
    float _2148 = fma(_2044, _2144, _2146);
    float _2150 = _2148;
    if (_2088)
    {
        float _2152 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2136 = _2152;
    }
    float _2154 = _2136;
    float _2156 = _2128;
    float _2158 = _2154;
    if (_2088)
    {
        float _2160 = fma(_2128, _2154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = _2162;
    float _2166 = _2142;
    if (_2088)
    {
        float _2168 = _2142 + (-1.0);
        _2158 = _2168;
    }
    float _2170 = _2158;
    float _2172 = 0.0;
    float _2174 = _2170;
    if (_2088)
    {
        float _2176 = _2108 * _2162;
        _2172 = _2176;
    }
    float _2178 = _2172;
    if (!_2088)
    {
        _2164 = _2076;
    }
    float _2180 = _2164;
    float _2182 = _2180;
    if (_2088)
    {
        float _2184 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2122 = _2184;
    }
    float _2186 = _2122;
    if (_2088)
    {
        float _2188 = _2076 * _2178;
        _2182 = _2188;
    }
    float _2190 = _2182;
    if (!_2088)
    {
        _2174 = _2078;
    }
    float _2192 = _2174;
    float _2194 = _2192;
    if (_2088)
    {
        float _2196 = _2078 * _2178;
        _2194 = _2196;
    }
    float _2198 = _2194;
    if (!_2088)
    {
        _2110 = _2080;
    }
    float _2200 = _2110;
    float _2202 = _2200;
    if (_2088)
    {
        float _2204 = fma(_2148, _2142, _2186);
        _2150 = _2204;
    }
    float _2206 = _2150;
    if (_2088)
    {
        float _2208 = _2190 * _2190;
        _2202 = _2208;
    }
    float _2210 = _2202;
    if (!_2088)
    {
        _2166 = _2082;
    }
    float _2212 = _2166;
    float _2214 = _2212;
    if (_2088)
    {
        float _2216 = _2198 * _2198;
        _2214 = _2216;
    }
    float _2218 = _2214;
    float _2220 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2222 = fma(_2206, _2206, _2210);
    float _2224 = _2222 + _2218;
    float _2226 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2220);
    float _2228 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2232 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2230);
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2226);
    float _2238 = rsqrt(_2224);
    float _2240 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2228);
    float _2242 = -_2234;
    float _2244 = _2242 + 1.0;
    float _2246 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2248 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2250 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2240);
    float _2252 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2254 = abs(_2244);
    float _2256 = log2(_2254);
    float _2258 = _2250 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2260 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2248);
    float _2262 = -_2252;
    float _2264 = fma(_2262, _2054, 1.0);
    float _2266 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2268 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2260);
    float _2270 = _2238 * _2190;
    float _2272 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2266);
    float _2274 = _2238 * _2206;
    float _2276 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2278 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2280 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2272);
    float _2282 = _2238 * _2198;
    float _2284 = log2(_2264);
    float _2286 = -_2278;
    float _2288 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2286);
    float _2290 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2292 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2280);
    float _2294 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2296 = -_2282;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2288);
    float _2300 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2302 = exp2(_2290);
    float _2304 = fma(_2298, -0.5, 0.5);
    float _2306 = fma(_2298, 0.5, 0.5);
    float _2308 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2300);
    float _2310 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2294);
    float _2312 = _2274 + 1.0;
    float _2314 = fma(_2306, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2316 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2308);
    float _2318 = 1.0 / _2292;
    float _2320 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2310);
    float _2322 = fma(_2306, _2314, -0.212114393711090087890625);
    float _2324 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2316);
    float _2326 = _2284 * 0.693147182464599609375;
    float _2328 = fma(_2306, _2322, 1.570728778839111328125);
    float _2330 = sqrt(_2304);
    float _2332 = -_2274;
    float _2334 = fma(_2302, _2312, _2332);
    float _2336 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2320);
    float _2338 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2340 = fma(_2334, 0.5, 0.5);
    float _2342 = _2324 * _2318;
    float _2344 = _2336 * _2318;
    float _2346 = fma(_2342, 0.5, 0.5);
    float _2348 = fma(_2344, -0.5, 0.5);
    float _2350 = _2330 * 0.636619746685028076171875;
    float _2352 = -_2328;
    float _2354 = fma(_2350, _2352, 1.0);
    float3 _6647 = float3(_2346, _2348, _2338);
    float _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6647, float3(0.0), isnan(_6647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6647, float3(0.0), isnan(_6647)), level(0.0)).x;
    float3 _6658 = float3(_2346, _2348, _2338);
    float4 _2359 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6658, float3(0.0), isnan(_6658)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6658, float3(0.0), isnan(_6658)), level(0.0)).xyzw;
    float _2361 = _2359.x;
    float _2363 = _2359.y;
    float _2365 = _2359.z;
    float _2367 = _2359.w;
    float2 _6675 = float2(_2354, _2340);
    float3 _2371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6675, float2(0.0), isnan(_6675)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6675, float2(0.0), isnan(_6675)), level(0.0)).xyz;
    float _2373 = _2371.x;
    float _2375 = _2371.y;
    float _2377 = _2371.z;
    float _2379 = in.m_61.y;
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2383 = _1466 + _2381;
    float _2385 = in.m_51.w;
    float _2387 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2389 = _2387 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2393 = _2391 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2395 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2397 = _1466 + _2395;
    int _2399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2401 = _2399 != 0;
    float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2405 = _2403 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2409 = _2407 != 0;
    float _2411 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2413 = _2411 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2415 = 1.0 / _2389;
    bool _2417 = _1480 > 0.5;
    float _2419 = in.m_61.x;
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2423 = _2421 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2425 = _1468 > 0.5;
    float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2429 = _1466 + _2427;
    int _2431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2433 = _2431 != 0;
    float _2435 = -_2379;
    float _2437 = _2435 + 1.0;
    float _2439 = 1.0 / _2393;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _2445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2447 = _2445 != 0;
    float _2449 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2451 = _2385 > 0.5;
    out.m_63.x = _2038;
    out.m_63.y = _2036;
    out.m_63.z = _2040;
    int _2453 = _2417 ? as_type<int>(_2437) : as_type<int>(_2379);
    float _2455 = 1.0 / _2405;
    int _2457 = _2425 ? as_type<int>(_2437) : as_type<int>(_2379);
    float _2459 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2461 = _2459 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2463 = _2433 ? as_type<float>(_2453) : _2379;
    float _2465 = _2447 ? as_type<float>(_2457) : _2379;
    float _2467 = 1.0 / _2413;
    float _2469 = _2379;
    bool _2471 = _2451;
    if (_2401)
    {
        float _2473 = _2451 ? _2437 : _2379;
        _2469 = _2473;
    }
    float _2475 = _2469;
    if (_2409)
    {
        bool _2477 = _1472 > 0.5;
        _2471 = _2477;
    }
    bool _2479 = _2471;
    float _2481 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2483 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2481;
    float _2485 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2489 = 1.0 / _2423;
    float _2491 = _2483 * _2415;
    float _2493 = _2487 * _2439;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2495;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2499;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2505 = _2503 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2507 = _2497 * _2455;
    float _2509 = 1.0 / _2443;
    float _2511 = _2501 * _2467;
    float _2513 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2515 = _2513 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _2517 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2519 = isnan(_1466);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2525 = _2521 || _2523;
    float _2527 = float(_2525);
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2529;
    float _2533 = fma(_2491, _2383, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2535 = fma(_2493, _2397, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2539 = _1466 + _2537;
    float _2541 = 1.0 / _2461;
    float _2543 = _2505 * _2489;
    bool _2545 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2547 = isnan(_1466);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2553 = _2549 || _2551;
    float _2555 = float(_2553);
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2559 = _1466 + _2557;
    bool _2561 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2563 = isnan(_1466);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    float _2573 = fma(_2507, _2539, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    int _2575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2577 = _2575 != 0;
    float _2579 = fma(_2543, _2559, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2581 = _2515 * _2509;
    float _2583 = -_2527;
    float _2585 = _2583 + 1.0;
    bool _2587 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2589 = isnan(_1466);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    float _2599 = -_2571;
    float _2601 = _2599 + 1.0;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2605 = _2603 != 0;
    float _2607 = _2555 * _2585;
    bool _2609 = _1820 != 0.0;
    bool _2611 = isnan(_1820);
    bool _2613 = _2609 || _2611;
    bool _2615 = isnan(0.0);
    bool _2617 = _2613 || _2615;
    float _2619 = -_2597;
    float _2621 = _2619 + 1.0;
    float _2623 = _2531 * _2541;
    float _2625 = -_2555;
    float _2627 = _2625 + 1.0;
    bool _2629 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2631 = isnan(_1466);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2637 = _2633 || _2635;
    float _2639 = float(_2637);
    float _2641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2643 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2645 = isnan(_1466);
    bool _2647 = _2643 || _2645;
    bool _2649 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2651 = _2647 || _2649;
    float _2653 = float(_2651);
    float _2655 = _2571 * _2627;
    bool _2657 = _1818 == 0.0;
    bool _2659 = !_2617;
    bool _2661 = _2657 && _2659;
    float _2663 = -_2639;
    float _2665 = _2663 + 1.0;
    float _2667 = _2639 * _2601;
    bool _2669 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2671 = isnan(_1466);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    float _2681 = -_2653;
    float _2683 = _2681 + 1.0;
    float _2685 = _2597 * _2665;
    bool _2687 = _1822 == 0.0;
    bool _2689 = _2687 && _2661;
    float _2691 = in.m_65.x;
    float _2693 = in.m_65.y;
    float _2695 = in.m_65.z;
    float _2697 = _2653 * _2621;
    bool _2699 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2701 = isnan(_1466);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2707 = _2703 || _2705;
    float _2709 = float(_2707);
    float _2711 = _2679 * _2683;
    float _2713 = -_2679;
    float _2715 = _2713 + 1.0;
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2719 = _1466 + _2717;
    float _2721 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2723 = _1466 + _2721;
    float _2725 = exp2(_2449);
    float _2727 = _2709 * _2715;
    float _2729 = fma(_2511, _2719, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2731 = _2641 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2733 = _2641;
    float _2735 = _2419;
    if (!_2409)
    {
        _2733 = _2419;
    }
    float _2737 = _2733;
    float _2739 = _2533 * _2727;
    float _2741 = -_2709;
    float _2743 = _2741 + 1.0;
    float _2745 = fma(_2731, _2463, -0.5);
    float _2747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2749 = fma(_2581, _2429, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2751 = fma(_2743, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2739);
    float _2753 = -_1544;
    float _2755 = fma(_1748, _2745, _2753);
    int _2757 = as_type<int>(_2745);
    float _2759 = _2737;
    if (_2577)
    {
        float _2761 = -_2419;
        float _2763 = _2761 + 1.0;
        _2757 = as_type<int>(_2763);
    }
    int _2765 = _2757;
    float _2767 = fma(_2623, _2723, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2769 = fma(_2535, _2711, _2751);
    float _2771 = _2292 * 0.5;
    float _2773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2775 = _2691;
    float _2777 = _2695;
    float _2779 = _2693;
    if (!_2689)
    {
        float _2781 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2691);
        _2775 = _2781;
    }
    float _2783 = _2775;
    if (!_2689)
    {
        float _2785 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2695);
        _2777 = _2785;
    }
    float _2787 = _2777;
    if (!_2689)
    {
        float _2789 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2693);
        _2779 = _2789;
    }
    float _2791 = _2779;
    if (!_2577)
    {
        _1984 = _2419;
    }
    float _2793 = _1984;
    float _2795 = fma(_2573, _2697, _2769);
    float _2797 = _2793;
    if (_2577)
    {
        float _2799 = _2425 ? as_type<float>(_2765) : _2419;
        _2797 = _2799;
    }
    float _2801 = _2797;
    float _2803 = _1882 * _2791;
    float _2805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2807 = _2747 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2809 = as_type<int>(_2747);
    if (_2409)
    {
        float _2811 = -_2419;
        float _2813 = _2811 + 1.0;
        _2809 = as_type<int>(_2813);
    }
    int _2815 = _2809;
    float _2817 = -_2791;
    float _2819 = _1876 * _2817;
    float _2821 = fma(_1894, _2783, _2803);
    float _2823 = fma(_2807, _2475, -0.5);
    float _2825 = _1884 * _2791;
    int _2827 = _2815;
    if (_2409)
    {
        float _2829 = _2479 ? as_type<float>(_2815) : _2419;
        _2759 = _2829;
    }
    float _2831 = _2759;
    float _2833 = _2773 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2835 = fma(_1886, _2783, _2819);
    float _2837 = fma(_1906, _2787, _2821);
    float _2839 = -_1750;
    float _2841 = fma(_1652, _2823, _2839);
    float _2843 = fma(_1902, _2783, _2825);
    float _2845 = fma(_1888, _2787, _2835);
    float _2847 = fma(_2579, _2685, _2795);
    if (_2605)
    {
        float _2849 = -_2419;
        float _2851 = _2849 + 1.0;
        _2827 = as_type<int>(_2851);
    }
    int _2853 = _2827;
    float _2855 = _2805 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2857 = fma(_2833, _2831, -0.5);
    float _2859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2861 = -_2725;
    float _2863 = _2861 + 1.0;
    float _2865 = fma(_2855, _2801, -0.5);
    float _2867 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2869 = fma(_1762, _2857, _1746);
    float _2871 = _2837 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2873 = fma(_1632, _2865, _1766);
    float _2875 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2867);
    float _2877 = _2837 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2879 = fma(_2845, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2871);
    float _2881 = _2841 + 0.5;
    float _2883 = _2869 + 0.5;
    float _2885 = fma(_2845, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2877);
    float _2887 = _2755 + 0.5;
    float _2889 = _2873 + 0.5;
    float _2891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2893 = fma(_2729, _2667, _2847);
    float _2895 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2875);
    if (_2605)
    {
        float _2897 = _2417 ? as_type<float>(_2853) : _2419;
        _2735 = _2897;
    }
    float _2899 = _2735;
    out.m_67.x = _2883;
    out.m_67.y = _2887;
    out.m_67.z = _2889;
    out.m_67.w = _2881;
    float _2901 = _2837 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2903 = fma(_2749, _2655, _2893);
    float _2905 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2895);
    float _2907 = fma(_1896, _2787, _2843);
    float _2909 = fma(_2845, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2901);
    float _2911 = fma(_2767, _2607, _2903);
    float _2913 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2915 = _2899 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2917 = _2905 + _2292;
    float _2919 = _2324 + _2292;
    float _2921 = fma(_2907, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2909);
    float _2923 = fma(_2907, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2885);
    float _2925 = fma(_2336, -0.5, _2771);
    float _2927 = _2863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2929 = fma(_2527, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2911);
    float _2931 = _2913 * _2891;
    float _2933 = -_2927;
    float _2935 = _2933 + 1.0;
    float _2937 = _2915 * _2859;
    float _2939 = fma(_2907, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2879);
    float _2941 = _2917 * 0.5;
    float _2943 = _2919 * 0.5;
    float _2945 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2937;
    out.m_69.y = _2931;
    out.m_71.x = _2929;
    out.m_73.x = _2923;
    out.m_73.y = _2939;
    out.m_73.z = _2921;
    out.gl_Position.x = _2324;
    out.gl_Position.y = _2336;
    out.gl_Position.z = _2905;
    out.gl_Position.w = _2292;
    out.m_75.x = _2943;
    out.m_75.y = _2925;
    out.m_75.z = _2941;
    out.m_75.w = _2292;
    out.m_45.x = _2945;
    float _2947 = _2927 * _2356;
    float _2949 = _2367 * _2935;
    float _2951 = _2367 * _2947;
    float _2953 = _2377 * _2947;
    float _2955 = fma(_2373, _2951, _2361);
    float _2957 = fma(_2375, _2951, _2363);
    float _2959 = fma(_2367, _2953, _2365);
    out.m_77.x = _2955;
    out.m_77.y = _2957;
    out.m_77.z = _2959;
    out.m_77.w = _2949;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1458 = false;
    bool _1316 = false;
    bool _1040 = false;
    bool _860 = false;
    bool _626 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3016 = as_type<float>(_112);
        out.gl_Position.z = _3016;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = _130;
    if (_126)
    {
        float _136 = float(_96);
        _132 = _136;
    }
    float _138 = _132;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    if (_144)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _106;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3085 = as_type<float>(_150);
        out.gl_Position.z = _3085;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_49.w;
    float _154 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
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
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _276 = _272;
    float _294;
    if (!_274)
    {
        float _278 = in.m_51.x;
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
        float _298 = float(_96);
        float _300 = 1.0 / _298;
        float _302 = _130 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _304 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = 1.0 / _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _328;
    float _332 = 1.0 / _320;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    bool _338 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_304);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    bool _354 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _356 = isnan(_304);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = 1.0 / _316;
    float _368 = _336 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _372 = _304 + _370;
    bool _374 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _376 = isnan(_304);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = fma(_352, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = 1.0 / _324;
    float _390 = _372 * _332;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _394 = _304 + _392;
    bool _396 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _398 = isnan(_304);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    bool _408 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _410 = isnan(_304);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = 1.0 / _330;
    float _422 = _308 * _366;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _426 = _304 + _424;
    bool _428 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _430 = isnan(_304);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _444 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _446 = _394 * _388;
    float _448 = -_406;
    float _450 = _448 + 1.0;
    float _452 = fma(_442, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _454 = _418 * _450;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -_418;
    float _462 = _460 + 1.0;
    float _464 = _426 * _420;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _466;
    float _470 = fma(_458, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _472 = _364 * _462;
    float _474 = -_364;
    float _476 = _474 + 1.0;
    float _478 = fma(_468, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _480 = -_384;
    float _482 = _480 + 1.0;
    float _484 = _384 * _476;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = _348 * _482;
    float _492 = -_348;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _500 = fma(_488, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _502 = _438 * _494;
    float _504 = -_438;
    float _506 = _504 + 1.0;
    float _508 = fma(_498, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _510 = _470 * _502;
    float _512 = _478 * _502;
    float _514 = _386 * _502;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _516;
    float _520 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].x, _510);
    float _522 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].y, _512);
    float _524 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[143].z, _514);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = fma(_518, _390, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _532 = fma(_452, _490, _520);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _538;
    float _542 = fma(_528, _446, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _548 = fma(_530, _484, _532);
    float _550 = fma(_536, _390, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _552 = fma(_500, _490, _522);
    float _554 = fma(_540, _390, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _560 = fma(_508, _490, _524);
    float _562 = fma(_546, _446, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _564 = fma(_550, _484, _552);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _570;
    float _574 = fma(_558, _446, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _576 = fma(_554, _484, _560);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _578;
    float _582 = fma(_568, _464, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _584 = fma(_572, _464, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _586 = fma(_542, _472, _548);
    float _588 = fma(_580, _464, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _590 = fma(_574, _472, _564);
    float _592 = fma(_562, _472, _576);
    float _594 = fma(_582, _454, _586);
    float _596 = fma(_584, _454, _590);
    float _598 = fma(_588, _454, _592);
    float _600 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[148].x, _594);
    float _602 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[148].y, _596);
    float _604 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[148].z, _598);
    bool _606 = !_444;
    float _624;
    if (!_606)
    {
        float _608 = in.m_51.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_96);
        float _630 = 1.0 / _628;
        float _632 = _130 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = in.m_49.x;
    float _638 = in.m_49.y;
    float _640 = in.m_49.z;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _644 = _634 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _648 = _634 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _658;
    float _662 = 1.0 / _652;
    bool _664 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _666 = 1.0 / _656;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _668;
    float _672 = _604 * _640;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _676 = _634 + _674;
    float _678 = 1.0 / _660;
    float _680 = _602 * _638;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _682;
    float _686 = _676 * _662;
    bool _688 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _690 = isnan(_634);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _700;
    float _704 = fma(_684, _686, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _706 = _644 * _666;
    bool _708 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _710 = isnan(_634);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = fma(_702, _686, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _722 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _724 = isnan(_634);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = fma(_670, _686, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _736 = _648 * _678;
    float _738 = -_698;
    float _740 = _738 + 1.0;
    float _742 = -_732;
    float _744 = _742 + 1.0;
    float _746 = _718 * _740;
    bool _748 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _750 = isnan(_634);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _764 = -_718;
    float _766 = _764 + 1.0;
    float _768 = _758 * _744;
    float _770 = _732 * _766;
    float _772 = -_758;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _780 = _704 * _768;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _786 = _720 * _768;
    float _788 = _734 * _768;
    float _790 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[107].x, _780);
    float _792 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[107].y, _786);
    float _794 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[107].z, _788);
    float _796 = fma(_762, _706, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _798 = fma(_778, _706, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _800 = fma(_784, _706, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _810;
    float _814 = fma(_796, _770, _790);
    float _816 = fma(_804, _736, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _818 = fma(_808, _736, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _820 = fma(_812, _736, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _822 = fma(_798, _770, _792);
    float _824 = fma(_800, _770, _794);
    float _826 = fma(_816, _746, _814);
    float _828 = _600 * _636;
    float _830 = fma(_818, _746, _822);
    float _832 = fma(_820, _746, _824);
    float _834 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[110].x, _826);
    float _836 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[110].y, _830);
    float _838 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[110].z, _832);
    bool _840 = !_664;
    float _858;
    if (!_840)
    {
        float _842 = in.m_51.x;
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _846 = _842 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _850 = _848 * _844;
        float _852 = floor(_850);
        float _854 = -_852;
        float _856 = _850 + _854;
        _858 = _856;
        _860 = true;
    }
    else
    {
        float _862 = float(_96);
        float _864 = 1.0 / _862;
        float _866 = _130 * _864;
        _858 = _866;
    }
    _860 = false;
    float _868 = _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _872 = _868 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _878 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _880 = isnan(_868);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _898 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _900 = isnan(_868);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = 1.0 / _876;
    float _912 = -_888;
    float _914 = _912 + 1.0;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _916;
    bool _920 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _922 = isnan(_868);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = _908 * _914;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    bool _938 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _940 = 1.0 / _892;
    float _942 = _930 * _936;
    float _944 = -_930;
    float _946 = _944 + 1.0;
    float _948 = 1.0 / _896;
    float _950 = _918 * _910;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = fma(_950, _872, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _958 = _954 * _940;
    bool _960 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _962 = isnan(_868);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _978 = _868 + _976;
    float _980 = _956 * _942;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _984 = _868 + _982;
    float _986 = -_970;
    float _988 = _986 + 1.0;
    float _990 = fma(_958, _978, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _992 = _974 * _948;
    float _994 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[115].x, _980);
    float _996 = _888 * _988;
    float _998 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1000 = fma(_992, _984, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1002 = fma(_990, _932, _994);
    float _1004 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1006 = fma(_1000, _996, _1002);
    float _1008 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1006);
    float _1014 = _998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1014;
    out.m_53.y = _1016;
    out.m_53.z = _1010;
    out.m_53.w = _1018;
    bool _1020 = !_938;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_51.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        float _1042 = float(_96);
        float _1044 = 1.0 / _1042;
        float _1046 = _130 * _1044;
        _1038 = _1046;
    }
    _1040 = false;
    float _1048 = _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1052 = _1048 + _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1060 = _1048 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1078 = 1.0 / _1068;
    bool _1080 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1082 = 1.0 / _1064;
    float _1084 = 1.0 / _1072;
    float _1086 = 1.0 / _1076;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1090 = _1048 + _1088;
    float _1092 = _1052 * _1082;
    bool _1094 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1096 = isnan(_1048);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = _1090 * _1078;
    bool _1108 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1110 = isnan(_1048);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = _1056 * _1084;
    bool _1122 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1124 = isnan(_1048);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1118;
    float _1136 = _1134 + 1.0;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1138;
    float _1142 = _1104 * _1136;
    float _1144 = _1060 * _1086;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1150;
    float _1154 = -_1104;
    float _1156 = _1154 + 1.0;
    float _1158 = fma(_1140, _1120, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1160 = fma(_1148, _1120, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1162 = fma(_1152, _1120, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1164 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1166 = isnan(_1048);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -_1132;
    float _1178 = _1176 + 1.0;
    float _1180 = _1132 * _1156;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1186 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1188 = isnan(_1048);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = _1174 * _1178;
    float _1200 = -_1174;
    float _1202 = _1200 + 1.0;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1212 = fma(_1184, _1144, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1214 = _1196 * _1202;
    float _1216 = fma(_1206, _1144, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1218 = fma(_1210, _1144, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1220 = -_1196;
    float _1222 = _1220 + 1.0;
    float _1224 = _1158 * _1214;
    float _1226 = _1160 * _1214;
    float _1228 = _1162 * _1214;
    float _1230 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1224);
    float _1232 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1226);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1234;
    float _1238 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1228);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1244;
    float _1248 = fma(_1216, _1198, _1230);
    float _1250 = fma(_1218, _1198, _1232);
    float _1252 = fma(_1212, _1198, _1238);
    float _1254 = fma(_1236, _1092, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1256 = fma(_1242, _1092, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1258 = fma(_1246, _1092, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1272 = fma(_1254, _1180, _1248);
    float _1274 = fma(_1262, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1276 = fma(_1266, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1278 = fma(_1270, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1280 = fma(_1256, _1180, _1250);
    float _1282 = fma(_1258, _1180, _1252);
    float _1284 = fma(_1274, _1142, _1272);
    float _1286 = fma(_1276, _1142, _1280);
    float _1288 = fma(_1278, _1142, _1282);
    float _1290 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1284);
    float _1292 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1286);
    float _1294 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1288);
    bool _1296 = !_1080;
    float _1314;
    if (!_1296)
    {
        float _1298 = in.m_51.x;
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1302 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1304 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _1306 = _1304 * _1300;
        float _1308 = floor(_1306);
        float _1310 = -_1308;
        float _1312 = _1306 + _1310;
        _1314 = _1312;
        _1316 = true;
    }
    else
    {
        float _1318 = float(_96);
        float _1320 = 1.0 / _1318;
        float _1322 = _130 * _1320;
        _1314 = _1322;
    }
    _1316 = false;
    float _1324 = _1314;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1328 = _1324 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1334 = _1324 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1336 = isnan(_1324);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1350 = _1324 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1352 = isnan(_1324);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1358 = _1354 || _1356;
    float _1360 = float(_1358);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1362;
    bool _1366 = _1324 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1368 = isnan(_1324);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = 1.0 / _1332;
    float _1380 = -_1344;
    float _1382 = _1380 + 1.0;
    bool _1384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1386 = -_1376;
    float _1388 = _1386 + 1.0;
    float _1390 = 1.0 / _1348;
    float _1392 = _1344 * _1388;
    float _1394 = _1364 * _1378;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1398 = _1396 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1400 = fma(_1394, _1328, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1402 = _1360 * _1382;
    float _1404 = -_1360;
    float _1406 = _1404 + 1.0;
    float _1408 = _1398 * _1390;
    float _1410 = _1400 * _1402;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1414 = _1324 + _1412;
    float _1416 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1410);
    float _1420 = fma(_1408, _1414, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1422 = _1292 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1424 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1426 = fma(_1420, _1392, _1418);
    float _1428 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1426);
    float _1434 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1436 = _1432 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_55.x = _1428;
    out.m_55.y = _1430;
    out.m_55.z = _1434;
    out.m_55.w = _1436;
    bool _1438 = !_1384;
    float _1456;
    if (!_1438)
    {
        float _1440 = in.m_51.x;
        float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1444 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[14].y, _130);
        float _1448 = _1446 * _1442;
        float _1450 = floor(_1448);
        float _1452 = -_1450;
        float _1454 = _1448 + _1452;
        _1456 = _1454;
        _1458 = true;
    }
    else
    {
        float _1460 = float(_96);
        float _1462 = 1.0 / _1460;
        float _1464 = _130 * _1462;
        _1456 = _1464;
    }
    _1458 = false;
    float _1466 = _1456;
    float _1468 = in.m_51.z;
    float _1470 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1472 = in.m_51.x;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1476 = _1474 != 0;
    float _1478 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1480 = in.m_51.y;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1484 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1488 = _1486 != 0;
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1492 = _1490 != 0;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1496 = _1494 != 0;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1500 = !_1492;
    int _1502 = _1500 ? 0 : 1;
    bool _1504 = !_1496;
    int _1506 = _1504 ? 0 : 1;
    int _1508 = abs(_1502);
    float _1510 = _1468 * 2.0;
    float _1512 = float(_1508);
    float _1514 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1516 = _1472 * 2.0;
    float _1518 = floor(_1510);
    float _1520 = -_1482;
    float _1522 = fma(_1514, 2.0, _1520);
    float _1524 = _1472 + _1480;
    float _1526 = _1480 * 2.0;
    float _1528 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1530 = _1524 + (-1.0);
    float _1532 = floor(_1516);
    float _1534 = fma(_1528, -2.0, _1498);
    float _1536 = _1528;
    float _1538 = _1530;
    if (!_1476)
    {
        _1536 = _1480;
    }
    float _1540 = _1536;
    float _1542 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1544 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1534);
    float _1546 = _1540;
    if (!_1476)
    {
        _1538 = _1468;
    }
    float _1548 = _1538;
    float _1550 = floor(_1526);
    bool _1552 = _1518 > 0.0;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1556 = _1518 >= 0.0;
    bool _1558 = isnan(_1518);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan(0.0);
    bool _1564 = _1560 || _1562;
    float _1566 = _1548;
    float _1568 = _1518;
    if (_1476)
    {
        _1566 = _1480;
    }
    float _1570 = _1566;
    if (!_1476)
    {
        _1568 = _1468;
    }
    float _1572 = _1568;
    float _1574 = _1572;
    if (_1476)
    {
        _1546 = _1472;
    }
    float _1576 = _1546;
    float _1578 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1554);
    if (_1476)
    {
        _1574 = _1480;
    }
    float _1580 = _1574;
    float _1582 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1584 = log2(_1582);
    bool _1586 = _1532 > 0.0;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1590 = _1532 >= 0.0;
    bool _1592 = isnan(_1532);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan(0.0);
    bool _1598 = _1594 || _1596;
    float _1600 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1602 = _1564 ? 0 : 1;
    bool _1604 = !_1488;
    int _1606 = _1604 ? 0 : 1;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1610 = _1550 > 0.0;
    bool _1612 = _1550 >= 0.0;
    bool _1614 = isnan(_1550);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan(0.0);
    bool _1620 = _1616 || _1618;
    float _1622 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1608);
    float _1624 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1626 = ~_1602;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    float _1632 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1622);
    int _1634 = abs(_1606);
    float _1636 = -_1588;
    float _1638 = fma(_1624, 2.0, _1636);
    int _1640 = _1630;
    if (!_1552)
    {
        int _1642 = ~_1602;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1650 = _1598 ? 0 : 1;
    float _1652 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1578);
    float _1654 = float(_1634);
    float _1656 = fma(_1600, -2.0, _1648);
    float _1658 = float(_1646);
    float _1660 = _1472 + (-0.5);
    int _1662 = ~_1650;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    int _1668 = _1666;
    if (!_1586)
    {
        int _1670 = ~_1650;
        int _1672 = _1670 + 1;
        _1668 = _1672;
    }
    int _1674 = _1668;
    float _1676 = _1584 * _130;
    float _1678 = _1654 * _1658;
    int _1680 = _1620 ? 0 : 1;
    float _1682 = in.m_57.x;
    float _1684 = in.m_57.y;
    float _1686 = in.m_57.z;
    float _1688 = _1678 * (-2.0);
    float _1690 = exp2(_1676);
    int _1692 = ~_1680;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    int _1698 = _1696;
    if (!_1610)
    {
        int _1700 = ~_1680;
        int _1702 = _1700 + 1;
        _1698 = _1702;
    }
    int _1704 = _1698;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1708 = 1.0 + _1706;
    float _1710 = 1.0 / _1708;
    bool _1712 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1714 = isnan(1.0);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1720 = _1716 || _1718;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1724 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1726 = isnan(0.0);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1732 = _1728 || _1730;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1736 = float(_1674);
    float _1738 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1722);
    float _1740 = -_1690;
    float _1742 = _1740 + 1.0;
    float _1744 = -_130;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1522);
    float _1748 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1738);
    float _1750 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1656);
    float _1752 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1734);
    float _1754 = _1732 ? _1742 : 0.0;
    float _1756 = fma(_1688, _1682, _1682);
    float _1758 = fma(_1542, _1688, _1542);
    int _1760 = abs(_1506);
    float _1762 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1752);
    float _1764 = -_130;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1638);
    float _1768 = _1512 * _1736;
    float _1770 = _1480 + _1468;
    if (_1720)
    {
        float _1772 = _1754 * _1710;
        _134 = _1772;
    }
    float _1774 = _134;
    float _1776 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1756);
    float _1778 = float(_1760);
    float _1780 = _1770 + (-1.0);
    float _1782 = float(_1704);
    float _1784 = _1768 * (-2.0);
    float _1786 = fma(_1758, _1774, _1776);
    float _1788 = _1778 * _1782;
    float _1790 = _1480 + (-0.5);
    float _1792 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1794 = fma(_1784, _1684, _1684);
    float _1796 = _1472 + _1468;
    float _1798 = _1788 * (-2.0);
    float _1800 = fma(_1792, _1784, _1792);
    float _1802 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1794);
    float _1804 = _1796 + (-1.0);
    float _1806 = fma(_1798, _1686, _1686);
    float _1808 = fma(_1800, _1774, _1802);
    float _1810 = _1786 * 0.15915493667125701904296875;
    float _1812 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1814 = _1808 * 0.15915493667125701904296875;
    float _1816 = _1468 + (-0.5);
    float _1818 = in.m_59.x;
    float _1820 = in.m_59.y;
    float _1822 = in.m_59.z;
    float _1824 = fma(_1812, _1798, _1812);
    float _1826 = _1810 * 6.283185482025146484375;
    float _1828 = sin(_1826);
    float _1830 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1832 = fma(_1824, _1774, _1830);
    float _1834 = _1810 * 6.283185482025146484375;
    float _1836 = cos(_1834);
    float _1838 = _1814 * 6.283185482025146484375;
    float _1840 = sin(_1838);
    float _1842 = _1832 * 0.15915493667125701904296875;
    float _1844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1818);
    float _1846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1820);
    float _1848 = _1814 * 6.283185482025146484375;
    float _1850 = cos(_1848);
    float _1852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1822);
    float _1854 = _1470 * _1844;
    float _1856 = _1478 * _1846;
    float _1858 = _1484 * _1852;
    float _1860 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1862 = _1842 * 6.283185482025146484375;
    float _1864 = cos(_1862);
    float _1866 = _1828 * _1840;
    float _1868 = _1836 * _1840;
    float _1870 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1860);
    float _1872 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1870);
    float _1874 = _1842 * 6.283185482025146484375;
    float _1876 = sin(_1874);
    float _1878 = _1836 * _1850;
    float _1880 = _1828 * _1850;
    float _1882 = _1836 * _1864;
    float _1884 = _1828 * _1864;
    float _1886 = _1850 * _1864;
    float _1888 = _1840 * _1864;
    float _1890 = _1872 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1892 = _1884 * _1856;
    float _1894 = fma(_1876, _1878, _1866);
    float _1896 = fma(_1876, _1866, _1878);
    float _1898 = _1882 * _1856;
    float _1900 = -_1868;
    float _1902 = fma(_1876, _1880, _1900);
    float _1904 = -_1880;
    float _1906 = fma(_1876, _1868, _1904);
    float _1908 = -_1856;
    float _1910 = _1876 * _1908;
    float _1912 = fma(_1894, _1854, _1898);
    float _1914 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1916 = fma(_1902, _1854, _1892);
    float _1918 = fma(_1886, _1854, _1910);
    float _1920 = fma(_1906, _1858, _1912);
    float _1922 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1914);
    float _1924 = fma(_1896, _1858, _1916);
    float _1926 = fma(_1888, _1858, _1918);
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1930 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1922);
    float _1932 = _1920 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1934 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1936 = fma(_1926, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1928);
    float _1938 = _1930 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1940 = fma(_1926, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1932);
    float _1942 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1934);
    float _1944 = fma(_1924, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1936);
    float _1946 = fma(_1924, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1940);
    float _1948 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1942);
    float _1950 = _1938 + _1944;
    float _1952 = _1890 + _1946;
    float _1954 = _1948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1958 = _1950 + _1956;
    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1962 = _1952 + _1960;
    float _1964 = _1958 * _1958;
    float _1966 = fma(_1962, _1962, _1964);
    float _1968 = _1920 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1970 = sqrt(_1966);
    float _1972 = fma(_1926, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1968);
    float _1974 = fma(_1924, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1972);
    float _1976 = _1954 + _1974;
    bool _1978 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1980 = _1954;
    float _1982 = _1948;
    float _1984 = _1820;
    if (!_1978)
    {
        _1980 = _1952;
    }
    float _1986 = _1980;
    float _1988 = _1986;
    if (!_1978)
    {
        _276 = _1950;
    }
    float _1990 = _276;
    float _1992 = _1990;
    if (!_1978)
    {
        _1982 = _1976;
    }
    float _1994 = _1982;
    bool _1996 = !_1978;
    float _1998 = _1994;
    if (!_1996)
    {
        float _2000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2004 = _1970 + _2002;
        float _2006 = _1976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2008 = rsqrt(_1966);
        float _2010 = _2004 * _2000;
        float _2012 = _2010 * 0.15915493667125701904296875;
        float _2014 = _2012 * 6.283185482025146484375;
        float _2016 = cos(_2014);
        float _2018 = _2012 * 6.283185482025146484375;
        float _2020 = sin(_2018);
        float _2022 = _2016 + (-1.0);
        float _2024 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2026 = fma(_2020, _2006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2028 = fma(_1976, _2016, _2024);
        float _2030 = _2008 * _2026;
        float _2032 = fma(_1962, _2030, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2034 = fma(_1958, _2030, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1998 = _2028;
        _1988 = _2032;
        _1992 = _2034;
    }
    float _2036 = _1998;
    float _2038 = _1988;
    float _2040 = _1992;
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2044 = _2036 + _2042;
    float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2048 = _2038 + _2046;
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2052 = _2040 + _2050;
    float _2054 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2056 = _2044 * _2044;
    float _2058 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2060 = fma(_2048, _2048, _2056);
    float _2062 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2058);
    float _2064 = fma(_2052, _2052, _2060);
    float _2066 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2062);
    float _2068 = rsqrt(_2064);
    float _2070 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2072 = sqrt(_2064);
    float _2074 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2076 = _2048 * _2074;
    float _2078 = _2052 * _2074;
    float _2080 = _2076 * _2076;
    float _2082 = _2078 * _2078;
    float _2084 = _2080 + _2082;
    float _2086 = sqrt(_2084);
    bool _2088 = _2086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2092 = _2086 + _2090;
    float _2094 = _2052;
    float _2096 = _2084;
    float _2098 = _2092;
    float _2100 = _2056;
    if (_2088)
    {
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2094 = _2102;
    }
    float _2104 = _2094;
    if (_2088)
    {
        float _2106 = rsqrt(_2084);
        _2096 = _2106;
    }
    float _2108 = _2096;
    float _2110 = _2108;
    if (_2088)
    {
        float _2112 = _2092 * _2104;
        _2098 = _2112;
    }
    float _2114 = _2098;
    if (_2088)
    {
        float _2116 = _2114 * 0.15915493667125701904296875;
        _2100 = _2116;
    }
    float _2118 = _2100;
    float _2120 = _2104;
    float _2122 = _2118;
    if (_2088)
    {
        float _2124 = _2118 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        _2120 = _2126;
    }
    float _2128 = _2120;
    float _2130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2132 = precise::max(0.0, _2130);
    float _2134 = _1924;
    float _2136 = _2132;
    if (_2088)
    {
        float _2138 = _2118 * 6.283185482025146484375;
        float _2140 = cos(_2138);
        _2134 = _2140;
    }
    float _2142 = _2134;
    float _2144 = -_2074;
    float _2146 = -_2132;
    float _2148 = fma(_2044, _2144, _2146);
    float _2150 = _2148;
    if (_2088)
    {
        float _2152 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2136 = _2152;
    }
    float _2154 = _2136;
    float _2156 = _2128;
    float _2158 = _2154;
    if (_2088)
    {
        float _2160 = fma(_2128, _2154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = _2162;
    float _2166 = _2142;
    if (_2088)
    {
        float _2168 = _2142 + (-1.0);
        _2158 = _2168;
    }
    float _2170 = _2158;
    float _2172 = 0.0;
    float _2174 = _2170;
    if (_2088)
    {
        float _2176 = _2108 * _2162;
        _2172 = _2176;
    }
    float _2178 = _2172;
    if (!_2088)
    {
        _2164 = _2076;
    }
    float _2180 = _2164;
    float _2182 = _2180;
    if (_2088)
    {
        float _2184 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2122 = _2184;
    }
    float _2186 = _2122;
    if (_2088)
    {
        float _2188 = _2076 * _2178;
        _2182 = _2188;
    }
    float _2190 = _2182;
    if (!_2088)
    {
        _2174 = _2078;
    }
    float _2192 = _2174;
    float _2194 = _2192;
    if (_2088)
    {
        float _2196 = _2078 * _2178;
        _2194 = _2196;
    }
    float _2198 = _2194;
    if (!_2088)
    {
        _2110 = _2080;
    }
    float _2200 = _2110;
    float _2202 = _2200;
    if (_2088)
    {
        float _2204 = fma(_2148, _2142, _2186);
        _2150 = _2204;
    }
    float _2206 = _2150;
    if (_2088)
    {
        float _2208 = _2190 * _2190;
        _2202 = _2208;
    }
    float _2210 = _2202;
    if (!_2088)
    {
        _2166 = _2082;
    }
    float _2212 = _2166;
    float _2214 = _2212;
    if (_2088)
    {
        float _2216 = _2198 * _2198;
        _2214 = _2216;
    }
    float _2218 = _2214;
    float _2220 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2222 = fma(_2206, _2206, _2210);
    float _2224 = _2222 + _2218;
    float _2226 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2220);
    float _2228 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2232 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2230);
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2226);
    float _2238 = rsqrt(_2224);
    float _2240 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2228);
    float _2242 = -_2234;
    float _2244 = _2242 + 1.0;
    float _2246 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2248 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2250 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2240);
    float _2252 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2254 = abs(_2244);
    float _2256 = log2(_2254);
    float _2258 = _2250 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2260 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2248);
    float _2262 = -_2252;
    float _2264 = fma(_2262, _2054, 1.0);
    float _2266 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2268 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2260);
    float _2270 = _2238 * _2190;
    float _2272 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2266);
    float _2274 = _2238 * _2206;
    float _2276 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2278 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2280 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2272);
    float _2282 = _2238 * _2198;
    float _2284 = log2(_2264);
    float _2286 = -_2278;
    float _2288 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2286);
    float _2290 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2292 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2280);
    float _2294 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2296 = -_2282;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2288);
    float _2300 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2302 = exp2(_2290);
    float _2304 = fma(_2298, -0.5, 0.5);
    float _2306 = fma(_2298, 0.5, 0.5);
    float _2308 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2300);
    float _2310 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2294);
    float _2312 = _2274 + 1.0;
    float _2314 = fma(_2306, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2316 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2308);
    float _2318 = 1.0 / _2292;
    float _2320 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2310);
    float _2322 = fma(_2306, _2314, -0.212114393711090087890625);
    float _2324 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2316);
    float _2326 = _2284 * 0.693147182464599609375;
    float _2328 = fma(_2306, _2322, 1.570728778839111328125);
    float _2330 = sqrt(_2304);
    float _2332 = -_2274;
    float _2334 = fma(_2302, _2312, _2332);
    float _2336 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2320);
    float _2338 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2340 = fma(_2334, 0.5, 0.5);
    float _2342 = _2324 * _2318;
    float _2344 = _2336 * _2318;
    float _2346 = fma(_2342, 0.5, 0.5);
    float _2348 = fma(_2344, -0.5, 0.5);
    float _2350 = _2330 * 0.636619746685028076171875;
    float _2352 = -_2328;
    float _2354 = fma(_2350, _2352, 1.0);
    float3 _6647 = float3(_2346, _2348, _2338);
    float _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6647, float3(0.0), isnan(_6647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6647, float3(0.0), isnan(_6647)), level(0.0)).x;
    float3 _6658 = float3(_2346, _2348, _2338);
    float4 _2359 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6658, float3(0.0), isnan(_6658)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6658, float3(0.0), isnan(_6658)), level(0.0)).xyzw;
    float _2361 = _2359.x;
    float _2363 = _2359.y;
    float _2365 = _2359.z;
    float _2367 = _2359.w;
    float2 _6675 = float2(_2354, _2340);
    float3 _2371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6675, float2(0.0), isnan(_6675)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6675, float2(0.0), isnan(_6675)), level(0.0)).xyz;
    float _2373 = _2371.x;
    float _2375 = _2371.y;
    float _2377 = _2371.z;
    float _2379 = in.m_61.y;
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2383 = _1466 + _2381;
    float _2385 = in.m_51.w;
    float _2387 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2389 = _2387 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2393 = _2391 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2395 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2397 = _1466 + _2395;
    int _2399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2401 = _2399 != 0;
    float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2405 = _2403 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2409 = _2407 != 0;
    float _2411 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2413 = _2411 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2415 = 1.0 / _2389;
    bool _2417 = _1480 > 0.5;
    float _2419 = in.m_61.x;
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2423 = _2421 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2425 = _1468 > 0.5;
    float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2429 = _1466 + _2427;
    int _2431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2433 = _2431 != 0;
    float _2435 = -_2379;
    float _2437 = _2435 + 1.0;
    float _2439 = 1.0 / _2393;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _2445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2447 = _2445 != 0;
    float _2449 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2451 = _2385 > 0.5;
    out.m_63.x = _2038;
    out.m_63.y = _2036;
    out.m_63.z = _2040;
    int _2453 = _2417 ? as_type<int>(_2437) : as_type<int>(_2379);
    float _2455 = 1.0 / _2405;
    int _2457 = _2425 ? as_type<int>(_2437) : as_type<int>(_2379);
    float _2459 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2461 = _2459 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2463 = _2433 ? as_type<float>(_2453) : _2379;
    float _2465 = _2447 ? as_type<float>(_2457) : _2379;
    float _2467 = 1.0 / _2413;
    float _2469 = _2379;
    bool _2471 = _2451;
    if (_2401)
    {
        float _2473 = _2451 ? _2437 : _2379;
        _2469 = _2473;
    }
    float _2475 = _2469;
    if (_2409)
    {
        bool _2477 = _1472 > 0.5;
        _2471 = _2477;
    }
    bool _2479 = _2471;
    float _2481 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2483 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2481;
    float _2485 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2489 = 1.0 / _2423;
    float _2491 = _2483 * _2415;
    float _2493 = _2487 * _2439;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2495;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2499;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2505 = _2503 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2507 = _2497 * _2455;
    float _2509 = 1.0 / _2443;
    float _2511 = _2501 * _2467;
    float _2513 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2515 = _2513 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _2517 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2519 = isnan(_1466);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2525 = _2521 || _2523;
    float _2527 = float(_2525);
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2529;
    float _2533 = fma(_2491, _2383, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2535 = fma(_2493, _2397, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2539 = _1466 + _2537;
    float _2541 = 1.0 / _2461;
    float _2543 = _2505 * _2489;
    bool _2545 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2547 = isnan(_1466);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2553 = _2549 || _2551;
    float _2555 = float(_2553);
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2559 = _1466 + _2557;
    bool _2561 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2563 = isnan(_1466);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    float _2573 = fma(_2507, _2539, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    int _2575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2577 = _2575 != 0;
    float _2579 = fma(_2543, _2559, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2581 = _2515 * _2509;
    float _2583 = -_2527;
    float _2585 = _2583 + 1.0;
    bool _2587 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2589 = isnan(_1466);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    float _2599 = -_2571;
    float _2601 = _2599 + 1.0;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2605 = _2603 != 0;
    float _2607 = _2555 * _2585;
    bool _2609 = _1820 != 0.0;
    bool _2611 = isnan(_1820);
    bool _2613 = _2609 || _2611;
    bool _2615 = isnan(0.0);
    bool _2617 = _2613 || _2615;
    float _2619 = -_2597;
    float _2621 = _2619 + 1.0;
    float _2623 = _2531 * _2541;
    float _2625 = -_2555;
    float _2627 = _2625 + 1.0;
    bool _2629 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2631 = isnan(_1466);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2637 = _2633 || _2635;
    float _2639 = float(_2637);
    float _2641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2643 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2645 = isnan(_1466);
    bool _2647 = _2643 || _2645;
    bool _2649 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2651 = _2647 || _2649;
    float _2653 = float(_2651);
    float _2655 = _2571 * _2627;
    bool _2657 = _1818 == 0.0;
    bool _2659 = !_2617;
    bool _2661 = _2657 && _2659;
    float _2663 = -_2639;
    float _2665 = _2663 + 1.0;
    float _2667 = _2639 * _2601;
    bool _2669 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2671 = isnan(_1466);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    float _2681 = -_2653;
    float _2683 = _2681 + 1.0;
    float _2685 = _2597 * _2665;
    bool _2687 = _1822 == 0.0;
    bool _2689 = _2687 && _2661;
    float _2691 = in.m_65.x;
    float _2693 = in.m_65.y;
    float _2695 = in.m_65.z;
    float _2697 = _2653 * _2621;
    bool _2699 = _1466 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2701 = isnan(_1466);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2707 = _2703 || _2705;
    float _2709 = float(_2707);
    float _2711 = _2679 * _2683;
    float _2713 = -_2679;
    float _2715 = _2713 + 1.0;
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2719 = _1466 + _2717;
    float _2721 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2723 = _1466 + _2721;
    float _2725 = exp2(_2449);
    float _2727 = _2709 * _2715;
    float _2729 = fma(_2511, _2719, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2731 = _2641 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2733 = _2641;
    float _2735 = _2419;
    if (!_2409)
    {
        _2733 = _2419;
    }
    float _2737 = _2733;
    float _2739 = _2533 * _2727;
    float _2741 = -_2709;
    float _2743 = _2741 + 1.0;
    float _2745 = fma(_2731, _2463, -0.5);
    float _2747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2749 = fma(_2581, _2429, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2751 = fma(_2743, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2739);
    float _2753 = -_1544;
    float _2755 = fma(_1748, _2745, _2753);
    int _2757 = as_type<int>(_2745);
    float _2759 = _2737;
    if (_2577)
    {
        float _2761 = -_2419;
        float _2763 = _2761 + 1.0;
        _2757 = as_type<int>(_2763);
    }
    int _2765 = _2757;
    float _2767 = fma(_2623, _2723, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2769 = fma(_2535, _2711, _2751);
    float _2771 = _2292 * 0.5;
    float _2773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2775 = _2691;
    float _2777 = _2695;
    float _2779 = _2693;
    if (!_2689)
    {
        float _2781 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2691);
        _2775 = _2781;
    }
    float _2783 = _2775;
    if (!_2689)
    {
        float _2785 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2695);
        _2777 = _2785;
    }
    float _2787 = _2777;
    if (!_2689)
    {
        float _2789 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2693);
        _2779 = _2789;
    }
    float _2791 = _2779;
    if (!_2577)
    {
        _1984 = _2419;
    }
    float _2793 = _1984;
    float _2795 = fma(_2573, _2697, _2769);
    float _2797 = _2793;
    if (_2577)
    {
        float _2799 = _2425 ? as_type<float>(_2765) : _2419;
        _2797 = _2799;
    }
    float _2801 = _2797;
    float _2803 = _1882 * _2791;
    float _2805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2807 = _2747 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2809 = as_type<int>(_2747);
    if (_2409)
    {
        float _2811 = -_2419;
        float _2813 = _2811 + 1.0;
        _2809 = as_type<int>(_2813);
    }
    int _2815 = _2809;
    float _2817 = -_2791;
    float _2819 = _1876 * _2817;
    float _2821 = fma(_1894, _2783, _2803);
    float _2823 = fma(_2807, _2475, -0.5);
    float _2825 = _1884 * _2791;
    int _2827 = _2815;
    if (_2409)
    {
        float _2829 = _2479 ? as_type<float>(_2815) : _2419;
        _2759 = _2829;
    }
    float _2831 = _2759;
    float _2833 = _2773 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2835 = fma(_1886, _2783, _2819);
    float _2837 = fma(_1906, _2787, _2821);
    float _2839 = -_1750;
    float _2841 = fma(_1652, _2823, _2839);
    float _2843 = fma(_1902, _2783, _2825);
    float _2845 = fma(_1888, _2787, _2835);
    float _2847 = fma(_2579, _2685, _2795);
    if (_2605)
    {
        float _2849 = -_2419;
        float _2851 = _2849 + 1.0;
        _2827 = as_type<int>(_2851);
    }
    int _2853 = _2827;
    float _2855 = _2805 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2857 = fma(_2833, _2831, -0.5);
    float _2859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2861 = -_2725;
    float _2863 = _2861 + 1.0;
    float _2865 = fma(_2855, _2801, -0.5);
    float _2867 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2869 = fma(_1762, _2857, _1746);
    float _2871 = _2837 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2873 = fma(_1632, _2865, _1766);
    float _2875 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2867);
    float _2877 = _2837 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2879 = fma(_2845, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2871);
    float _2881 = _2841 + 0.5;
    float _2883 = _2869 + 0.5;
    float _2885 = fma(_2845, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2877);
    float _2887 = _2755 + 0.5;
    float _2889 = _2873 + 0.5;
    float _2891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2893 = fma(_2729, _2667, _2847);
    float _2895 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2875);
    if (_2605)
    {
        float _2897 = _2417 ? as_type<float>(_2853) : _2419;
        _2735 = _2897;
    }
    float _2899 = _2735;
    out.m_67.x = _2883;
    out.m_67.y = _2887;
    out.m_67.z = _2889;
    out.m_67.w = _2881;
    float _2901 = _2837 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2903 = fma(_2749, _2655, _2893);
    float _2905 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2895);
    float _2907 = fma(_1896, _2787, _2843);
    float _2909 = fma(_2845, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2901);
    float _2911 = fma(_2767, _2607, _2903);
    float _2913 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2915 = _2899 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2917 = _2905 + _2292;
    float _2919 = _2324 + _2292;
    float _2921 = fma(_2907, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2909);
    float _2923 = fma(_2907, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2885);
    float _2925 = fma(_2336, -0.5, _2771);
    float _2927 = _2863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2929 = fma(_2527, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2911);
    float _2931 = _2913 * _2891;
    float _2933 = -_2927;
    float _2935 = _2933 + 1.0;
    float _2937 = _2915 * _2859;
    float _2939 = fma(_2907, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2879);
    float _2941 = _2917 * 0.5;
    float _2943 = _2919 * 0.5;
    float _2945 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2937;
    out.m_69.y = _2931;
    out.m_71.x = _2929;
    out.m_73.x = _2923;
    out.m_73.y = _2939;
    out.m_73.z = _2921;
    out.gl_Position.x = _2324;
    out.gl_Position.y = _2336;
    out.gl_Position.z = _2905;
    out.gl_Position.w = _2292;
    out.m_75.x = _2943;
    out.m_75.y = _2925;
    out.m_75.z = _2941;
    out.m_75.w = _2292;
    out.m_45.x = _2945;
    float _2947 = _2927 * _2356;
    float _2949 = _2367 * _2935;
    float _2951 = _2367 * _2947;
    float _2953 = _2377 * _2947;
    float _2955 = fma(_2373, _2951, _2361);
    float _2957 = fma(_2375, _2951, _2363);
    float _2959 = fma(_2367, _2953, _2365);
    out.m_77.x = _2955;
    out.m_77.y = _2957;
    out.m_77.z = _2959;
    out.m_77.w = _2949;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

