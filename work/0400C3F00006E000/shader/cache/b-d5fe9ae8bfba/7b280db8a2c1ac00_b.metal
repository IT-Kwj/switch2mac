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
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _112 = false;
    bool _110 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _627 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_627, float2(0.0), isnan(_627))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_627, float2(0.0), isnan(_627))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _58;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = _64 * _56;
    float _76 = -_64;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _80 = !_72;
    uint _83 = uint(_80 ? 0 : 1);
    uint _85 = 2u;
    if (!_72)
    {
        _85 = 1u;
    }
    uint _87 = _85;
    uint _89 = _87;
    if (!_78)
    {
        _89 = _83;
    }
    uint _91 = _89;
    uint _93 = min(_91, 2u);
    int _96 = int(_93) << 2;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.fp_c1)._m0[int(_100)][_102];
    bool _106 = as_type<int>(_104) == 336;
    if (!_106)
    {
        bool _108 = as_type<int>(_104) == 608;
        _110 = _108;
        if (!_110)
        {
            _112 = true;
        }
    }
    float _146;
    float _148;
    float _150;
    float _152;
    if (!_110)
    {
        if (!_112)
        {
            float _114 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _116 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _118 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _120 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _122 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _114);
            float _124 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _116);
            float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _118);
            float _128 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _120);
            float _130 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _128);
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _146 = _144;
            _148 = _138;
            _150 = _140;
            _152 = _142;
        }
    }
    if ((false || _112) || _110)
    {
        if ((!_112) || _110)
        {
            _110 = false;
            float _154 = _74 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _156 = _74 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _158 = _74 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _160 = _74 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _162 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, _154);
            float _164 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].x, _156);
            float _166 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].x, _158);
            float _168 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].x, _160);
            float _170 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _168);
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _146 = _184;
            _148 = _178;
            _150 = _180;
            _152 = _182;
        }
        if (false || _112)
        {
            _112 = false;
            float _186 = _74 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _188 = _74 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _190 = _74 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _192 = _74 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _194 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].x, _186);
            float _196 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].x, _188);
            float _198 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].x, _190);
            float _200 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].x, _192);
            float _202 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _200);
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _146 = _216;
            _148 = _210;
            _150 = _212;
            _152 = _214;
        }
    }
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = -_74;
    float _228 = _226 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _230 = -_66;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _234 = -_74;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _238 = -_66;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _242 = _228 * _228;
    float _244 = -_64;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _248 = _74 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _250 = _74 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _252 = fma(_232, _232, _242);
    float _254 = _236 * _236;
    float _256 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].x, _248);
    float _258 = fma(_246, _246, _252);
    float _260 = -_64;
    float _262 = _260 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _264 = fma(_240, _240, _254);
    float _266 = 1.0 / _218;
    float _268 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].x, _250);
    float _270 = fma(_262, _262, _264);
    float _272 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _256);
    float _274 = _74 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _276 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _268);
    float _278 = _74 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _280 = _272 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _282 = sqrt(_258);
    float _284 = _74 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _286 = _74 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _288 = _74 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _290 = _74 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _292 = _74 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _294 = _74 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _296 = _74 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _298 = sqrt(_270);
    float _300 = _74 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _302 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].x, _278);
    float _304 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].x, _286);
    float _306 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].x, _288);
    float _308 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].x, _290);
    float _310 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].x, _292);
    float _312 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].x, _294);
    bool _314 = _282 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _316 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].x, _296);
    bool _318 = _282 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _320 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].x, _300);
    bool _322 = !_314;
    int _324 = _322 ? 0 : 1;
    float _326 = _266 * _220;
    float _328 = _266 * _222;
    float _330 = _266 * _224;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    bool _334 = _298 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _336 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _316);
    bool _338 = _298 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _340 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _306);
    bool _342 = !_334;
    int _344 = _342 ? 0 : 1;
    float _346 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _320);
    int _348 = 2;
    int _350 = 2;
    float _352 = _280;
    if (!_314)
    {
        _348 = 1;
    }
    int _354 = _348;
    float _356 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _302);
    int _358 = _354;
    if (!_318)
    {
        _358 = _324;
    }
    int _360 = _358;
    float _362 = _74 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _364 = float(int(_91));
    float _366 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _308);
    float _368 = float(_360);
    float _370 = _74 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_334)
    {
        _350 = 1;
    }
    int _372 = _350;
    float _374 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].x, _362);
    int _376 = _372;
    if (!_338)
    {
        _376 = _344;
    }
    int _378 = _376;
    float _380 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].x, _370);
    float _382 = precise::min(_368, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _384 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _374);
    float _386 = float(_378);
    float _388 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _380);
    bool _390 = _382 != 1.0;
    bool _392 = isnan(_382);
    bool _394 = _390 || _392;
    bool _396 = isnan(1.0);
    bool _398 = _394 || _396;
    float _400 = _384 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _402 = precise::min(_386, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _404 = _74 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _406 = _74 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _408 = _382 != 0.0;
    bool _410 = isnan(_382);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    float _418 = rint(_364);
    float _420 = precise::max(_418, 0.0);
    uint _422 = uint(_420);
    uint _424 = clamp(_422, 0u, 65535u);
    bool _426 = _402 != 1.0;
    bool _428 = isnan(_402);
    bool _430 = _426 || _428;
    bool _432 = isnan(1.0);
    bool _434 = _430 || _432;
    float _436 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].x, _406);
    bool _438 = _402 != 0.0;
    bool _440 = isnan(_402);
    bool _442 = _438 || _440;
    bool _444 = isnan(0.0);
    bool _446 = _442 || _444;
    float _448 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _304);
    float _450 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _310);
    float _452 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _436);
    float _454 = _400;
    if (_398)
    {
        float _456 = _388 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _454 = _456;
    }
    float _458 = _454;
    float _460 = _74 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _462 = rint(_382);
    float _464 = precise::max(_462, 0.0);
    uint _466 = uint(_464);
    uint _468 = clamp(_466, 0u, 65535u);
    float _470 = _366 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _472 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _312);
    float _474 = _458;
    float _476 = _470;
    if (!_416)
    {
        float _478 = _356 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _474 = _478;
    }
    float _480 = _474;
    if (_398)
    {
        float _482 = _450 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _476 = _482;
    }
    float _484 = _476;
    float _486 = _484;
    if (_434)
    {
        float _488 = _276 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _352 = _488;
    }
    float _490 = _352;
    float _492 = _74 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _494 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].x, _274);
    float _496 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].x, _284);
    float _498 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].x, _404);
    float _500 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].x, _492);
    float _502 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].x, _460);
    float _504 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _494);
    float _506 = rint(_402);
    float _508 = precise::max(_506, 0.0);
    uint _510 = uint(_508);
    uint _512 = clamp(_510, 0u, 65535u);
    float _514 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _498);
    float _516 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _502);
    float _518 = _490;
    if (!_446)
    {
        float _520 = _336 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _518 = _520;
    }
    float _522 = _518;
    float _524 = _340 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _526 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _496);
    float _528 = _524;
    if (_398)
    {
        float _530 = _504 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _528 = _530;
    }
    float _532 = _528;
    float _534 = _452 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _536 = _514 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _538 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _500);
    float _540 = _534;
    float _542 = _536;
    float _544 = _532;
    if (_434)
    {
        float _546 = _516 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _540 = _546;
    }
    float _548 = _540;
    float _550 = _548;
    if (_434)
    {
        float _552 = _346 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _542 = _552;
    }
    float _554 = _542;
    float _556 = _554;
    if (!_446)
    {
        float _558 = _526 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _550 = _558;
    }
    float _560 = _550;
    if (!_446)
    {
        float _562 = _448 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _556 = _562;
    }
    float _564 = _556;
    float _566 = 0.0 + _522;
    float _568 = precise::clamp(_566, 0.0, 1.0);
    if (!_416)
    {
        float _570 = _538 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _486 = _570;
    }
    float _572 = _486;
    if (!_416)
    {
        float _574 = _472 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _544 = _574;
    }
    float _576 = _544;
    float _578 = 0.0 + _480;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    float3 _1643 = float3(_560, _564, float(int(_512)));
    float3 _1647 = select(_1643, float3(0.0), isnan(_1643));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1647.xy, uint(rint(_1647.z)), _568);
    float3 _1656 = float3(_576, _572, float(int(_468)));
    float3 _1658 = select(_1656, float3(0.0), isnan(_1656));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1658.xy, uint(rint(_1658.z)), _580);
    float3 _1667 = float3(_326, _328, float(int(_424)));
    float3 _1669 = select(_1667, float3(0.0), isnan(_1667));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1669.xy, uint(rint(_1669.z)), _332);
    float _588 = -_64;
    float _590 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _592 = _588 + _590;
    float _594 = -_64;
    float _596 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _598 = _594 + _596;
    float _600 = _592 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = _582 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _606 = fma(_584, (*spvDescriptorSet0.fp_c3)._m0[49].z, _604);
    float _608 = _598 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float _612 = _586 + _602;
    float _614 = _606 + _610;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _612;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _614;
    return out;
}

