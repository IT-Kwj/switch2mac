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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_12 [[id(6)]];
    sampler fp_t_tcb_12Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _130 = false;
    bool _128 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _666 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_666, float2(0.0), isnan(_666))).x;
    float _60 = in.m_44.y;
    float _62 = -_58;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = -_70;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = -_70;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _82 = -_70;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _86 = !_76;
    int _89 = _86 ? 0 : 1;
    int _91 = 2;
    if (!_76)
    {
        _91 = 1;
    }
    int _93 = _91;
    int _95 = _93;
    if (!_80)
    {
        _95 = _89;
    }
    int _97 = _95;
    int _99 = _97 + 1;
    uint _102 = uint(_99);
    if (!_84)
    {
        _102 = uint(_97);
    }
    uint _104 = _102;
    float _106 = _70 * _60;
    uint _108 = min(_104, 2u);
    int _110 = int(_108) << 2;
    float _112 = in.m_44.x;
    uint _114 = uint(int(uint(_110) >> uint(2)));
    uint _116 = uint(int(uint(int(_114)) >> uint(2)));
    int _118 = int(_114) & 3;
    float _120 = (*spvDescriptorSet0.fp_c1)._m0[int(_116)][_118];
    float _122 = _70 * _112;
    bool _124 = as_type<int>(_120) == 416;
    if (!_124)
    {
        bool _126 = as_type<int>(_120) == 688;
        _128 = _126;
        if (!_128)
        {
            _130 = true;
        }
    }
    float _164;
    float _166;
    float _168;
    float _170;
    if (!_128)
    {
        if (!_130)
        {
            float _132 = _106 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _134 = _106 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _136 = _106 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _138 = _106 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _140 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[1].x, _132);
            float _142 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[0].x, _134);
            float _144 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[2].x, _136);
            float _146 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[3].x, _138);
            float _148 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _140);
            float _150 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _142);
            float _152 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _144);
            float _154 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _146);
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _162 = _154 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _164 = _162;
            _166 = _158;
            _168 = _156;
            _170 = _160;
        }
    }
    if ((false || _130) || _128)
    {
        if ((!_130) || _128)
        {
            _128 = false;
            float _172 = _106 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _174 = _106 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _176 = _106 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _178 = _106 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _180 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[5].x, _172);
            float _182 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[4].x, _174);
            float _184 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[6].x, _176);
            float _186 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[7].x, _178);
            float _188 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _180);
            float _190 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _182);
            float _192 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _184);
            float _194 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _186);
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _202 = _194 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _164 = _202;
            _166 = _198;
            _168 = _196;
            _170 = _200;
        }
        if (false || _130)
        {
            _130 = false;
            float _204 = _106 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _206 = _106 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _208 = _106 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _210 = _106 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _212 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[9].x, _204);
            float _214 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[8].x, _206);
            float _216 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[10].x, _208);
            float _218 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[11].x, _210);
            float _220 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _212);
            float _222 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _214);
            float _224 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _216);
            float _226 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _218);
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _234 = _226 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _164 = _234;
            _166 = _230;
            _168 = _228;
            _170 = _232;
        }
    }
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float _242 = _170;
    float _244 = -_106;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _248 = -_122;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _252 = -_106;
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _256 = _246 * _246;
    float _258 = -_70;
    float _260 = _258 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _262 = _254 * _254;
    float _264 = _106 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _266 = fma(_250, _250, _256);
    float _268 = -_122;
    float _270 = _268 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _272 = _106 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _274 = _106 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _276 = fma(_260, _260, _266);
    float _278 = -_70;
    float _280 = _278 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _282 = fma(_270, _270, _262);
    float _284 = _106 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _286 = _106 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _288 = fma(_280, _280, _282);
    float _290 = sqrt(_276);
    float _292 = _106 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _294 = _106 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _296 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[18].x, _284);
    float _298 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[33].x, _286);
    float _300 = _106 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _302 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[27].x, _292);
    float _304 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[28].x, _294);
    float _306 = sqrt(_288);
    float _308 = _106 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _310 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _298);
    float _312 = _106 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _314 = _106 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _316 = _106 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _318 = _106 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _320 = _106 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _322 = _290 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _324 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[25].x, _300);
    bool _326 = _290 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _328 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _304);
    bool _330 = !_322;
    int _332 = _330 ? 0 : 1;
    float _334 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _324);
    float _336 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[19].x, _312);
    float _338 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[20].x, _316);
    bool _340 = _306 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _342 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[17].x, _318);
    bool _344 = _306 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _346 = 1.0 / _236;
    bool _348 = !_340;
    int _350 = _348 ? 0 : 1;
    float _352 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _302);
    int _354 = 2;
    int _356 = 2;
    if (!_322)
    {
        _354 = 1;
    }
    int _358 = _354;
    float _360 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _336);
    int _362 = _358;
    if (!_326)
    {
        _362 = _332;
    }
    int _364 = _362;
    float _366 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[21].x, _272);
    float _368 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _338);
    float _370 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _342);
    if (!_340)
    {
        _356 = 1;
    }
    int _372 = _356;
    float _374 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _366);
    int _376 = _372;
    if (!_344)
    {
        _376 = _350;
    }
    int _378 = _376;
    float _380 = float(_364);
    float _382 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[24].x, _274);
    float _384 = float(_378);
    float _386 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[30].x, _264);
    float _388 = precise::min(_380, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _390 = _106 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _392 = precise::min(_384, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _394 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _386);
    bool _396 = _388 != 1.0;
    bool _398 = isnan(_388);
    bool _400 = _396 || _398;
    bool _402 = isnan(1.0);
    bool _404 = _400 || _402;
    float _406 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _382);
    bool _408 = _392 != 1.0;
    bool _410 = isnan(_392);
    bool _412 = _408 || _410;
    bool _414 = isnan(1.0);
    bool _416 = _412 || _414;
    float _418 = _394 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _420 = _106 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _422 = _388 != 0.0;
    bool _424 = isnan(_388);
    bool _426 = _422 || _424;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    float _432 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[29].x, _390);
    bool _434 = _392 != 0.0;
    bool _436 = isnan(_392);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    float _444 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _296);
    float _446 = _374 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _448 = _106 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _450 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[31].x, _420);
    float _452 = _106 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _454 = _446;
    float _456 = _418;
    if (_404)
    {
        float _458 = _406 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _454 = _458;
    }
    float _460 = _454;
    float _462 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[23].x, _308);
    float _464 = _460;
    if (_416)
    {
        float _466 = _310 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _456 = _466;
    }
    float _468 = _456;
    float _470 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _450);
    float _472 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[22].x, _314);
    float _474 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[16].x, _448);
    float _476 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[26].x, _320);
    float _478 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[32].x, _452);
    float _480 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _462);
    float _482 = _328 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _484 = _482;
    float _486 = _468;
    if (_416)
    {
        float _488 = _470 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _484 = _488;
    }
    float _490 = _484;
    float _492 = _490;
    if (!_430)
    {
        float _494 = _444 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _464 = _494;
    }
    float _496 = _464;
    if (!_442)
    {
        float _498 = _334 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _492 = _498;
    }
    float _500 = _492;
    float _502 = float(int(_104));
    float2 _1543 = float2(_54, _56);
    float2 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1543, float2(0.0), isnan(_1543))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1543, float2(0.0), isnan(_1543))).xy;
    float _508 = _506.x;
    float _510 = _506.y;
    float _512 = rint(_392);
    float _514 = precise::max(_512, 0.0);
    uint _516 = uint(_514);
    uint _518 = clamp(_516, 0u, 65535u);
    float _520 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _432);
    float _522 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _478);
    float _524 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _472);
    float _526 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _476);
    float _528 = _346 * _238;
    float _530 = _346 * _240;
    float _532 = _346 * _242;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = rint(_388);
    float _538 = precise::max(_536, 0.0);
    uint _540 = uint(_538);
    uint _542 = clamp(_540, 0u, 65535u);
    float _544 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _474);
    if (!_442)
    {
        float _546 = _352 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _486 = _546;
    }
    float _548 = _486;
    float _550 = _520 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _552 = _360 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _554 = _550;
    float _556 = _552;
    if (_416)
    {
        float _558 = _522 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _554 = _558;
    }
    float _560 = _554;
    float _562 = _560;
    if (_404)
    {
        float _564 = _524 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _556 = _564;
    }
    float _566 = _556;
    float _568 = _566;
    if (!_442)
    {
        float _570 = _526 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _562 = _570;
    }
    float _572 = _562;
    float _574 = rint(_502);
    float _576 = precise::max(_574, 0.0);
    uint _578 = uint(_576);
    uint _580 = clamp(_578, 0u, 65535u);
    float _582 = _368 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _584 = _582;
    if (!_430)
    {
        float _586 = _544 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _568 = _586;
    }
    float _588 = _568;
    if (_404)
    {
        float _590 = _480 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _584 = _590;
    }
    float _592 = _584;
    float _594 = 0.0 + _548;
    float _596 = precise::clamp(_594, 0.0, 1.0);
    float _598 = _592;
    if (!_430)
    {
        float _600 = _370 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _598 = _600;
    }
    float _602 = _598;
    float _604 = 0.0 + _496;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float3 _1714 = float3(_500, _572, float(int(_518)));
    float3 _1718 = select(_1714, float3(0.0), isnan(_1714));
    float _608 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1718.xy, uint(rint(_1718.z)), _596);
    float3 _1727 = float3(_588, _602, float(int(_542)));
    float3 _1729 = select(_1727, float3(0.0), isnan(_1727));
    float _610 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1729.xy, uint(rint(_1729.z)), _606);
    float3 _1738 = float3(_528, _530, float(int(_580)));
    float3 _1740 = select(_1738, float3(0.0), isnan(_1738));
    float _612 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1740.xy, uint(rint(_1740.z)), _534);
    float _614 = fma(_508, 2.0, -1.0);
    float _616 = fma(_510, 2.0, -1.0);
    float _618 = _614 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _620 = _616 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _622 = fma(_618, 2.0, _54);
    float _624 = fma(_620, 2.0, _56);
    float2 _1767 = float2(_622, _624);
    float _626 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1767, float2(0.0), isnan(_1767))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1767, float2(0.0), isnan(_1767))).x;
    float _628 = -_70;
    float _630 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _632 = _628 + _630;
    float _634 = -_70;
    float _636 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _638 = _634 + _636;
    float _640 = _632 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _642 = precise::clamp(_640, 0.0, 1.0);
    float _644 = _638 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _646 = precise::clamp(_644, 0.0, 1.0);
    float _648 = _608 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _650 = fma(_610, (*spvDescriptorSet0.fp_c3)._m0[49].z, _648);
    float _652 = _612 + _642;
    float _654 = _650 + _646;
    out.m_47.x = _626;
    out.m_47.y = _652;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _654;
    return out;
}

