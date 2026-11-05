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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
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
    float2 _795 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_795, float2(0.0), isnan(_795)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _812 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_812, float2(0.0), isnan(_812))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_812, float2(0.0), isnan(_812))).x;
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
    float _154 = _144 * _72;
    float _156 = -_144;
    bool _158 = _156 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _160 = _144 * _70;
    float _162 = -_144;
    bool _164 = _162 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _166 = rsqrt(_138);
    int _169 = 2;
    if (!_152)
    {
        _169 = 1;
    }
    int _171 = _169;
    float _173 = _114 * _146;
    float _175 = _126 * _146;
    float _177 = _106 * _146;
    float _179 = _130 * _166;
    float _181 = _110 * _166;
    float _183 = _118 * _166;
    float _185 = _173 * _179;
    float _187 = _175 * _181;
    float _189 = _177 * _183;
    float _191 = -_185;
    float _193 = fma(_175, _183, _191);
    float _195 = -_187;
    float _197 = fma(_177, _179, _195);
    float _199 = -_189;
    float _201 = fma(_173, _181, _199);
    float _203 = _193 * _193;
    float _205 = fma(_197, _197, _203);
    float _207 = fma(_201, _201, _205);
    bool _209 = !_152;
    int _211 = _209 ? 0 : 1;
    float _213 = rsqrt(_207);
    int _215 = _171;
    if (!_158)
    {
        _215 = _211;
    }
    int _217 = _215;
    int _219 = _217 + 1;
    uint _222 = uint(_219);
    if (!_164)
    {
        _222 = uint(_217);
    }
    uint _224 = _222;
    uint _226 = min(_224, 2u);
    int _228 = int(_226) << 2;
    float _230 = _193 * _213;
    float _232 = _197 * _213;
    float _234 = _201 * _213;
    uint _236 = uint(int(uint(_228) >> uint(2)));
    uint _238 = uint(int(uint(int(_236)) >> uint(2)));
    int _240 = int(_236) & 3;
    float _242 = (*spvDescriptorSet0.fp_c1)._m0[int(_238)][_240];
    float _244 = _230 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _246 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].x, _244);
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].z, _246);
    float _250 = abs(_248);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = abs(_256);
    float _260 = log2(_258);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _264 = exp2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _268 = fma(_232, _266, _154);
    float _270 = fma(_230, _266, _160);
    float _272 = fma(_234, _266, _144);
    bool _274 = as_type<int>(_242) == 1264;
    if (!_274)
    {
        bool _276 = as_type<int>(_242) == 1536;
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
            _316 = _308;
            _318 = _306;
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
            _316 = _348;
            _318 = _346;
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
            _316 = _380;
            _318 = _378;
            _320 = _382;
        }
    }
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = -_160;
    float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _398 = -_154;
    float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _402 = -_160;
    float _404 = _402 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _406 = _396 * _396;
    float _408 = -_144;
    float _410 = _408 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _412 = _404 * _404;
    float _414 = 1.0 / _386;
    float _416 = fma(_400, _400, _406);
    float _418 = -_154;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _422 = _160 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _424 = _160 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _426 = fma(_410, _410, _416);
    float _428 = -_144;
    float _430 = _428 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _432 = fma(_420, _420, _412);
    float _434 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[33].x, _422);
    float _436 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[18].x, _424);
    float _438 = _160 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _440 = fma(_430, _430, _432);
    float _442 = sqrt(_426);
    float _444 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[33].z, _434);
    float _446 = _160 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _448 = _160 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _450 = _160 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _452 = _160 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _454 = _160 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _456 = sqrt(_440);
    float _458 = _160 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _460 = _160 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _462 = _160 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _464 = _160 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _466 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[20].x, _448);
    float _468 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[23].x, _450);
    float _470 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[25].x, _454);
    bool _472 = _442 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _474 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[26].x, _458);
    bool _476 = _442 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _478 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[27].x, _460);
    bool _480 = !_472;
    int _482 = _480 ? 0 : 1;
    float _484 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[28].x, _462);
    float _486 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[29].x, _464);
    float _488 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[27].z, _478);
    bool _490 = _456 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _492 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[28].z, _484);
    bool _494 = _456 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _496 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[29].z, _486);
    bool _498 = !_490;
    int _500 = _498 ? 0 : 1;
    float _502 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[20].z, _466);
    int _504 = 2;
    int _506 = 2;
    if (!_472)
    {
        _504 = 1;
    }
    int _508 = _504;
    float _510 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[25].z, _470);
    int _512 = _508;
    if (!_476)
    {
        _512 = _482;
    }
    int _514 = _512;
    float _516 = _160 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _518 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[26].z, _474);
    float _520 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[23].z, _468);
    float _522 = float(_514);
    float _524 = _160 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_490)
    {
        _506 = 1;
    }
    int _526 = _506;
    float _528 = _414 * _388;
    int _530 = _526;
    if (!_494)
    {
        _530 = _500;
    }
    int _532 = _530;
    float _534 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[21].x, _516);
    float _536 = precise::min(_522, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _538 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[24].x, _524);
    float _540 = float(_532);
    float _542 = _160 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _544 = _536 != 1.0;
    bool _546 = isnan(_536);
    bool _548 = _544 || _546;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    float _554 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[21].z, _534);
    float _556 = precise::min(_540, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _558 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[30].x, _542);
    float _560 = _160 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _562 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[24].z, _538);
    bool _564 = _556 != 1.0;
    bool _566 = isnan(_556);
    bool _568 = _564 || _566;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    float _574 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[30].z, _558);
    float _576 = _160 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _578 = _160 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _580 = _556 != 0.0;
    bool _582 = isnan(_556);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = _554 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _592 = _574 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _594 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[16].x, _560);
    bool _596 = _536 != 0.0;
    bool _598 = isnan(_536);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _590;
    float _608 = _592;
    if (_552)
    {
        float _610 = _562 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _606 = _610;
    }
    float _612 = _606;
    float _614 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[18].z, _436);
    float _616 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[19].x, _438);
    float _618 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[22].x, _446);
    float _620 = _612;
    if (_572)
    {
        float _622 = _444 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _608 = _622;
    }
    float _624 = _608;
    float _626 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[17].x, _452);
    float _628 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[31].x, _576);
    float _630 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[32].x, _578);
    float _632 = _414 * _390;
    float _634 = float(int(_224));
    float _636 = rint(_556);
    float _638 = precise::max(_636, 0.0);
    uint _640 = uint(_638);
    uint _642 = clamp(_640, 0u, 65535u);
    float _644 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[19].z, _616);
    float _646 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[22].z, _618);
    float _648 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[31].z, _628);
    float _650 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[32].z, _630);
    float _652 = _624;
    if (!_588)
    {
        float _654 = _488 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _652 = _654;
    }
    float _656 = _652;
    float _658 = _644 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _660 = _658;
    if (!_604)
    {
        float _662 = _614 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _620 = _662;
    }
    float _664 = _620;
    float _666 = rint(_536);
    float _668 = precise::max(_666, 0.0);
    uint _670 = uint(_668);
    uint _672 = clamp(_670, 0u, 65535u);
    if (_552)
    {
        float _674 = _646 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _660 = _674;
    }
    float _676 = _660;
    float _678 = _492 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _680 = _496 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _682 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[17].z, _626);
    float _684 = _678;
    float _686 = _680;
    float _688 = _676;
    if (_572)
    {
        float _690 = _648 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _684 = _690;
    }
    float _692 = _684;
    float _694 = _692;
    if (_572)
    {
        float _696 = _650 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _686 = _696;
    }
    float _698 = _686;
    float _700 = _502 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _702 = rint(_634);
    float _704 = precise::max(_702, 0.0);
    uint _706 = uint(_704);
    uint _708 = clamp(_706, 0u, 65535u);
    float _710 = _698;
    float _712 = _700;
    if (!_588)
    {
        float _714 = _510 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _694 = _714;
    }
    float _716 = _694;
    float _718 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[16].z, _594);
    if (!_588)
    {
        float _720 = _518 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _710 = _720;
    }
    float _722 = _710;
    float _724 = 0.0 + _656;
    float _726 = precise::clamp(_724, 0.0, 1.0);
    if (_552)
    {
        float _728 = _520 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _712 = _728;
    }
    float _730 = _712;
    float _732 = _730;
    if (!_604)
    {
        float _734 = _682 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _732 = _734;
    }
    float _736 = _732;
    if (!_604)
    {
        float _738 = _718 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _688 = _738;
    }
    float _740 = _688;
    float _742 = 0.0 + _664;
    float _744 = precise::clamp(_742, 0.0, 1.0);
    float3 _2056 = float3(_716, _722, float(int(_642)));
    float3 _2060 = select(_2056, float3(0.0), isnan(_2056));
    float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2060.xy, uint(rint(_2060.z)), _726);
    float _748 = _414 * _392;
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float3 _2074 = float3(_740, _736, float(int(_672)));
    float3 _2076 = select(_2074, float3(0.0), isnan(_2074));
    float _752 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2076.xy, uint(rint(_2076.z)), _744);
    float3 _2085 = float3(_632, _528, float(int(_708)));
    float3 _2087 = select(_2085, float3(0.0), isnan(_2085));
    float _754 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2087.xy, uint(rint(_2087.z)), _750);
    float _756 = -_144;
    float _758 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _760 = _756 + _758;
    float _762 = -_144;
    float _764 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _766 = _762 + _764;
    float _768 = _760 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _770 = precise::clamp(_768, 0.0, 1.0);
    float _772 = _746 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _774 = fma(_752, (*spvDescriptorSet0.fp_c3)._m0[49].z, _772);
    float _776 = _766 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _778 = precise::clamp(_776, 0.0, 1.0);
    float _780 = _754 + _770;
    float _782 = _774 + _778;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _780;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _782;
    return out;
}

