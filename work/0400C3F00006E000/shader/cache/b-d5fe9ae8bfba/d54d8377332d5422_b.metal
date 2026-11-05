#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _280 = false;
    bool _278 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _877 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_877, float2(0.0), isnan(_877)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _894 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_894, float2(0.0), isnan(_894))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_894, float2(0.0), isnan(_894))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _70 * _86;
    float _102 = _72 * _86;
    float _104 = -_100;
    float _106 = fma(_92, _74, _104);
    float _108 = -_100;
    float _110 = fma(_98, _76, _108);
    float _112 = -_102;
    float _114 = fma(_92, _78, _112);
    float _116 = -_102;
    float _118 = fma(_98, _80, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_86;
    float _126 = _124 + _92;
    float _128 = -_86;
    float _130 = _128 + _98;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = -_68;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[46].z, _142);
    float _146 = rsqrt(_136);
    float _148 = -_144;
    bool _152 = _148 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _154 = -_144;
    bool _156 = _154 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _158 = -_144;
    bool _160 = _158 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _162 = rsqrt(_138);
    float _164 = _114 * _146;
    float _166 = _126 * _146;
    float _168 = _106 * _146;
    float _170 = _130 * _162;
    float _172 = _110 * _162;
    float _174 = _118 * _162;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = _168 * _174;
    float _182 = -_176;
    float _184 = fma(_166, _174, _182);
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = -_180;
    float _192 = fma(_164, _172, _190);
    bool _194 = !_152;
    int _197 = _194 ? 0 : 1;
    float _199 = _184 * _184;
    float _201 = _144 * _70;
    int _203 = 2;
    if (!_152)
    {
        _203 = 1;
    }
    int _205 = _203;
    float _207 = fma(_188, _188, _199);
    int _209 = _205;
    if (!_156)
    {
        _209 = _197;
    }
    int _211 = _209;
    float _213 = fma(_192, _192, _207);
    int _215 = _211 + 1;
    uint _218 = uint(_215);
    if (!_160)
    {
        _218 = uint(_211);
    }
    uint _220 = _218;
    float _222 = rsqrt(_213);
    uint _224 = min(_220, 2u);
    int _226 = int(_224) << 2;
    float _228 = _184 * _222;
    float _230 = _188 * _222;
    float _232 = _192 * _222;
    float _234 = _228 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _236 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[35].x, _234);
    uint _238 = uint(int(uint(_226) >> uint(2)));
    uint _240 = uint(int(uint(int(_238)) >> uint(2)));
    int _242 = int(_238) & 3;
    float _244 = (*spvDescriptorSet0.fp_c1)._m0[int(_240)][_242];
    float _246 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].z, _236);
    float _248 = abs(_246);
    float _250 = -_248;
    float _252 = _250 + 1.0;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _144 * _72;
    float _258 = abs(_254);
    float _260 = log2(_258);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _264 = exp2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _268 = fma(_230, _266, _256);
    float _270 = fma(_228, _266, _201);
    float _272 = fma(_232, _266, _144);
    bool _274 = as_type<int>(_244) == 1264;
    if (!_274)
    {
        bool _276 = as_type<int>(_244) == 1536;
        _278 = _276;
        if (!_278)
        {
            _280 = true;
        }
    }
    float _314;
    float _316;
    float _318;
    float _320;
    if (!_278)
    {
        if (!_280)
        {
            float _282 = _270 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _284 = _270 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _286 = _270 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _288 = _270 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _290 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].x, _282);
            float _292 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[1].x, _284);
            float _294 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].x, _286);
            float _296 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[3].x, _288);
            float _298 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, _290);
            float _300 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].z, _292);
            float _302 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].z, _294);
            float _304 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].z, _296);
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _314 = _312;
            _316 = _306;
            _318 = _308;
            _320 = _310;
        }
    }
    if ((false || _280) || _278)
    {
        if ((!_280) || _278)
        {
            _278 = false;
            float _322 = _270 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _324 = _270 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _326 = _270 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _328 = _270 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _330 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[4].x, _322);
            float _332 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[5].x, _324);
            float _334 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[6].x, _326);
            float _336 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[7].x, _328);
            float _338 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].z, _330);
            float _340 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].z, _332);
            float _342 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].z, _334);
            float _344 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].z, _336);
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _314 = _352;
            _316 = _346;
            _318 = _348;
            _320 = _350;
        }
        if (false || _280)
        {
            _280 = false;
            float _354 = _270 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _356 = _270 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _358 = _270 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _360 = _270 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _362 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[8].x, _354);
            float _364 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[9].x, _356);
            float _366 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[10].x, _358);
            float _368 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[11].x, _360);
            float _370 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].z, _362);
            float _372 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].z, _364);
            float _374 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].z, _366);
            float _376 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].z, _368);
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _314 = _384;
            _316 = _378;
            _318 = _380;
            _320 = _382;
        }
    }
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = -_201;
    float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _398 = -_256;
    float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _402 = -_201;
    float _404 = _402 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _406 = _201 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _408 = _396 * _396;
    float _410 = -_144;
    float _412 = _410 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _414 = _404 * _404;
    float _416 = -_144;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _420 = fma(_400, _400, _408);
    float _422 = _201 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _424 = _201 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _426 = _201 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _428 = fma(_412, _412, _420);
    float _430 = -_256;
    float _432 = _430 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _434 = _201 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _436 = _201 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _438 = _201 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _440 = fma(_432, _432, _414);
    float _442 = sqrt(_428);
    float _444 = _201 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _446 = fma(_418, _418, _440);
    float _448 = _201 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _450 = _201 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _452 = _201 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _454 = _201 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _456 = _201 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _458 = sqrt(_446);
    float _460 = _201 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _462 = _201 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _464 = _201 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _466 = _201 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _468 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[19].x, _422);
    float _470 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[20].x, _426);
    bool _472 = _442 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _474 = 1.0 / _386;
    bool _476 = _442 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _478 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[21].x, _436);
    bool _480 = !_472;
    int _482 = _480 ? 0 : 1;
    float _484 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[22].x, _424);
    float _486 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[23].x, _434);
    float _488 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[24].x, _438);
    float _490 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[19].z, _468);
    bool _492 = _458 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _494 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[20].z, _470);
    float _496 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[21].z, _478);
    float _498 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[29].x, _456);
    int _500 = 2;
    if (!_472)
    {
        _500 = 1;
    }
    int _502 = _500;
    float _504 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[22].z, _484);
    bool _506 = _458 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _508 = _201 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    int _510 = _502;
    if (!_476)
    {
        _510 = _482;
    }
    int _512 = _510;
    float _514 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[26].x, _406);
    bool _516 = !_492;
    int _518 = _516 ? 0 : 1;
    float _520 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[23].z, _486);
    float _522 = float(_512);
    float _524 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[24].z, _488);
    float _526 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[16].x, _444);
    float _528 = precise::min(_522, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _530 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[17].x, _448);
    int _532 = 2;
    if (!_492)
    {
        _532 = 1;
    }
    int _534 = _532;
    float _536 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[18].x, _450);
    int _538 = _534;
    if (!_506)
    {
        _538 = _518;
    }
    int _540 = _538;
    float _542 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[25].x, _452);
    bool _544 = _528 != 1.0;
    bool _546 = isnan(_528);
    bool _548 = _544 || _546;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    float _554 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[27].x, _508);
    float _556 = float(_540);
    float _558 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[28].x, _454);
    float _560 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[30].x, _460);
    float _562 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[31].x, _462);
    float _564 = precise::min(_556, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _566 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[32].x, _464);
    float _568 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[33].x, _466);
    float _570 = _490 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _572 = _494 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _574 = _496 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _576 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[29].z, _498);
    float _578 = _570;
    float _580 = _572;
    float _582 = _574;
    if (_552)
    {
        float _584 = _504 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _578 = _584;
    }
    float _586 = _578;
    float _588 = _586;
    if (_552)
    {
        float _590 = _520 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _580 = _590;
    }
    float _592 = _580;
    float _594 = _592;
    if (_552)
    {
        float _596 = _524 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _582 = _596;
    }
    float _598 = _582;
    bool _600 = _564 != 1.0;
    bool _602 = isnan(_564);
    bool _604 = _600 || _602;
    bool _606 = isnan(1.0);
    bool _608 = _604 || _606;
    float _610 = _576 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    bool _612 = _528 != 0.0;
    bool _614 = isnan(_528);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = _474 * _388;
    bool _624 = _564 != 0.0;
    bool _626 = isnan(_564);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = _474 * _390;
    float _636 = _474 * _392;
    float _638 = precise::clamp(_636, 0.0, 1.0);
    float _640 = float(int(_220));
    float _642 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[30].z, _560);
    float _644 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[28].z, _558);
    float _646 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[33].z, _568);
    float _648 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[18].z, _536);
    float _650 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[31].z, _562);
    float _652 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[27].z, _554);
    float _654 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[32].z, _566);
    float _656 = _642 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _658 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[26].z, _514);
    float _660 = rint(_640);
    float _662 = precise::max(_660, 0.0);
    uint _664 = uint(_662);
    uint _666 = clamp(_664, 0u, 65535u);
    float _668 = _644 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _670 = _656;
    float _672 = _598;
    float _674 = _668;
    float _676 = _610;
    if (_608)
    {
        float _678 = _646 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _670 = _678;
    }
    float _680 = _670;
    float _682 = _680;
    if (!_620)
    {
        float _684 = _648 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _672 = _684;
    }
    float _686 = _672;
    if (_608)
    {
        float _688 = _650 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _674 = _688;
    }
    float _690 = _674;
    float _692 = _690;
    if (!_632)
    {
        float _694 = _652 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _682 = _694;
    }
    float _696 = _682;
    if (_608)
    {
        float _698 = _654 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _676 = _698;
    }
    float _700 = _676;
    float _702 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _638;
    float _704 = _700;
    if (!_632)
    {
        float _706 = _658 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _704 = _706;
    }
    float _708 = _704;
    float _710 = rint(_528);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    uint _716 = clamp(_714, 0u, 65535u);
    float _718 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[16].z, _526);
    float _720 = 0.0 + _686;
    float _722 = precise::clamp(_720, 0.0, 1.0);
    float _724 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _726 = 0.0 + _696;
    float _728 = precise::clamp(_726, 0.0, 1.0);
    float _730 = _702 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _732 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    if (!_620)
    {
        float _734 = _718 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _588 = _734;
    }
    float _736 = _588;
    float _738 = rint(_564);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    uint _744 = clamp(_742, 0u, 65535u);
    float _746 = _702 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _748 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[17].z, _530);
    float _750 = _724 * _728;
    float _752 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[25].z, _542);
    float _754 = fma(_730, 0.5, _622);
    float _756 = fma(_730, -0.5, _622);
    float _758 = _722 * _732;
    float _760 = fma(_746, 0.5, _634);
    float _762 = fma(_746, -0.5, _634);
    if (!_620)
    {
        float _764 = _748 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _594 = _764;
    }
    float _766 = _594;
    float _768 = _722 * _724;
    float _770 = fma(_750, 0.5, _708);
    if (!_632)
    {
        float _772 = _752 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _692 = _772;
    }
    float _774 = _692;
    float _776 = _732 * _728;
    float _778 = fma(_750, -0.5, _708);
    float _780 = fma(_758, 0.5, _736);
    float _782 = fma(_758, -0.5, _736);
    float _784 = fma(_768, 0.5, _766);
    float _786 = fma(_768, -0.5, _766);
    float _788 = fma(_776, 0.5, _774);
    float _790 = fma(_776, -0.5, _774);
    float3 _2217 = float3(_756, _760, float(int(_666)));
    float3 _2221 = select(_2217, float3(0.0), isnan(_2217));
    float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2221.xy, uint(rint(_2221.z)), _638);
    float3 _2230 = float3(_754, _760, float(int(_666)));
    float3 _2232 = select(_2230, float3(0.0), isnan(_2230));
    float _794 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2232.xy, uint(rint(_2232.z)), _638);
    float3 _2241 = float3(_754, _762, float(int(_666)));
    float3 _2243 = select(_2241, float3(0.0), isnan(_2241));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2243.xy, uint(rint(_2243.z)), _638);
    float3 _2252 = float3(_756, _762, float(int(_666)));
    float3 _2254 = select(_2252, float3(0.0), isnan(_2252));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2254.xy, uint(rint(_2254.z)), _638);
    float3 _2263 = float3(_782, _784, float(int(_716)));
    float3 _2265 = select(_2263, float3(0.0), isnan(_2263));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2265.xy, uint(rint(_2265.z)), _722);
    float3 _2274 = float3(_780, _784, float(int(_716)));
    float3 _2276 = select(_2274, float3(0.0), isnan(_2274));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2276.xy, uint(rint(_2276.z)), _722);
    float3 _2285 = float3(_790, _770, float(int(_744)));
    float3 _2287 = select(_2285, float3(0.0), isnan(_2285));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2287.xy, uint(rint(_2287.z)), _728);
    float3 _2296 = float3(_788, _770, float(int(_744)));
    float3 _2298 = select(_2296, float3(0.0), isnan(_2296));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2298.xy, uint(rint(_2298.z)), _728);
    float3 _2307 = float3(_780, _786, float(int(_716)));
    float3 _2309 = select(_2307, float3(0.0), isnan(_2307));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2309.xy, uint(rint(_2309.z)), _722);
    float3 _2318 = float3(_788, _778, float(int(_744)));
    float3 _2320 = select(_2318, float3(0.0), isnan(_2318));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2320.xy, uint(rint(_2320.z)), _728);
    float3 _2329 = float3(_782, _786, float(int(_716)));
    float3 _2331 = select(_2329, float3(0.0), isnan(_2329));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2331.xy, uint(rint(_2331.z)), _722);
    float3 _2340 = float3(_790, _778, float(int(_744)));
    float3 _2342 = select(_2340, float3(0.0), isnan(_2340));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2342.xy, uint(rint(_2342.z)), _728);
    float _816 = _794 + _792;
    float _818 = _816 + _796;
    float _820 = -_144;
    float _822 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _824 = _820 + _822;
    float _826 = -_144;
    float _828 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _830 = _826 + _828;
    float _832 = _818 + _798;
    float _834 = _824 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _836 = precise::clamp(_834, 0.0, 1.0);
    float _838 = _830 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _840 = precise::clamp(_838, 0.0, 1.0);
    float _842 = _802 + _800;
    float _844 = fma(_832, 0.25, _836);
    float _846 = _806 + _804;
    float _848 = _842 + _808;
    float _850 = _846 + _810;
    float _852 = _848 + _812;
    float _854 = _850 + _814;
    float _856 = _852 * 0.25;
    float _858 = _854 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _860 = _858 * 0.25;
    float _862 = fma(_856, (*spvDescriptorSet0.fp_c3)._m0[49].z, _860);
    float _864 = _862 + _840;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _844;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _864;
    return out;
}

