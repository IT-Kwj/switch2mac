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
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
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
    bool _120 = false;
    bool _118 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _738 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_738, float2(0.0), isnan(_738))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_738, float2(0.0), isnan(_738))).x;
    float _60 = in.m_44.y;
    float _62 = -_58;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = in.m_44.x;
    float _74 = _70 * _60;
    float _76 = -_70;
    bool _80 = _76 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _82 = -_70;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _86 = !_80;
    uint _89 = uint(_86 ? 0 : 1);
    uint _91 = 2u;
    if (!_80)
    {
        _91 = 1u;
    }
    uint _93 = _91;
    uint _95 = _93;
    if (!_84)
    {
        _95 = _89;
    }
    uint _97 = _95;
    uint _99 = min(_97, 2u);
    int _102 = int(_99) << 2;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.fp_c1)._m0[int(_106)][_108];
    float _112 = _70 * _72;
    bool _114 = as_type<int>(_110) == 368;
    if (!_114)
    {
        bool _116 = as_type<int>(_110) == 640;
        _118 = _116;
        if (!_118)
        {
            _120 = true;
        }
    }
    float _154;
    float _156;
    float _158;
    float _160;
    if (!_118)
    {
        if (!_120)
        {
            float _122 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _130 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[3].x, _128);
            float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _136);
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _154 = _152;
            _156 = _150;
            _158 = _146;
            _160 = _148;
        }
    }
    if ((false || _120) || _118)
    {
        if ((!_120) || _118)
        {
            _118 = false;
            float _162 = _74 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _74 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _74 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _74 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _170 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[7].x, _168);
            float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _176);
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _154 = _192;
            _156 = _190;
            _158 = _186;
            _160 = _188;
        }
        if (false || _120)
        {
            _120 = false;
            float _194 = _74 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _74 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _74 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _74 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _202 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[11].x, _200);
            float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _208);
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _154 = _224;
            _156 = _222;
            _158 = _218;
            _160 = _220;
        }
    }
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _74 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _236 = -_74;
    float _238 = _236 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _240 = -_74;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _244 = -_112;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _248 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[21].x, _234);
    float _250 = _238 * _238;
    float2 _1147 = float2(_54, _56);
    float2 _254 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1147, float2(0.0), isnan(_1147))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1147, float2(0.0), isnan(_1147))).xy;
    float _256 = _254.x;
    float _258 = _254.y;
    float _260 = -_112;
    float _262 = _260 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _264 = _242 * _242;
    float _266 = fma(_246, _246, _250);
    float _268 = -_70;
    float _270 = _268 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _272 = 1.0 / _226;
    float _274 = fma(_262, _262, _264);
    float _276 = -_70;
    float _278 = _276 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _280 = fma(_270, _270, _266);
    float _282 = float(int(_97));
    float _284 = _74 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _286 = fma(_278, _278, _274);
    float _288 = _74 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _290 = _74 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _292 = sqrt(_280);
    float _294 = _74 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _296 = _74 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _298 = _74 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _300 = _74 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _302 = _74 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _304 = _74 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _306 = _74 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _308 = sqrt(_286);
    float _310 = _74 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _312 = _74 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _314 = _74 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _316 = _74 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _318 = _74 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _320 = _74 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _322 = _74 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _324 = rint(_282);
    float _326 = precise::max(_324, 0.0);
    uint _328 = uint(_326);
    uint _330 = clamp(_328, 0u, 65535u);
    bool _332 = _292 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _334 = _272 * _228;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    bool _338 = _292 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _340 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[19].x, _284);
    float _342 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[22].x, _288);
    float _344 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[20].x, _290);
    bool _346 = _308 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _348 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[23].x, _294);
    bool _350 = _308 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _352 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[24].x, _296);
    float _354 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[16].x, _298);
    float _356 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[17].x, _300);
    float _358 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[18].x, _302);
    float _360 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[25].x, _304);
    float _362 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[26].x, _306);
    float _364 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[27].x, _310);
    float _366 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[28].x, _312);
    float _368 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[29].x, _314);
    float _370 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[30].x, _316);
    float _372 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[31].x, _318);
    float _374 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[32].x, _320);
    float _376 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[33].x, _322);
    float _378 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _336;
    float _380 = _272 * _230;
    float _382 = _272 * _232;
    bool _384 = !_346;
    int _386 = _384 ? 0 : 1;
    float _388 = _378 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    bool _390 = !_332;
    int _392 = _390 ? 0 : 1;
    float _394 = _378 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _396 = fma(_388, -0.5, _380);
    float _398 = fma(_394, 0.5, _382);
    int _400 = 2;
    int _402 = 2;
    if (!_346)
    {
        _400 = 1;
    }
    int _404 = _400;
    int _406 = _404;
    if (!_332)
    {
        _402 = 1;
    }
    int _408 = _402;
    int _410 = _408;
    if (!_350)
    {
        _406 = _386;
    }
    int _412 = _406;
    if (!_338)
    {
        _410 = _392;
    }
    int _414 = _410;
    float3 _1472 = float3(_396, _398, float(int(_330)));
    float3 _1476 = select(_1472, float3(0.0), isnan(_1472));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1476.xy, uint(rint(_1476.z)), _336);
    float _418 = float(_414);
    float _420 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _340);
    float _422 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _344);
    float _424 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _248);
    float _426 = precise::min(_418, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _428 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _342);
    float _430 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _348);
    float _432 = float(_412);
    float _434 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _352);
    bool _436 = _426 != 1.0;
    bool _438 = isnan(_426);
    bool _440 = _436 || _438;
    bool _442 = isnan(1.0);
    bool _444 = _440 || _442;
    float _446 = _420 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _448 = _422 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _450 = _424 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _452 = precise::min(_432, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _454 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _358);
    float _456 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _370);
    float _458 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _376);
    bool _460 = _452 != 1.0;
    bool _462 = isnan(_452);
    bool _464 = _460 || _462;
    bool _466 = isnan(1.0);
    bool _468 = _464 || _466;
    float _470 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _354);
    bool _472 = _452 != 0.0;
    bool _474 = isnan(_452);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _364);
    float _484 = _456 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _486 = _446;
    float _488 = _448;
    float _490 = _450;
    float _492 = _484;
    if (_444)
    {
        float _494 = _428 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _486 = _494;
    }
    float _496 = _486;
    float _498 = _496;
    if (_444)
    {
        float _500 = _430 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _488 = _500;
    }
    float _502 = _488;
    float _504 = _502;
    if (_444)
    {
        float _506 = _434 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _490 = _506;
    }
    float _508 = _490;
    bool _510 = _426 != 0.0;
    bool _512 = isnan(_426);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    float _520 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _356);
    float _522 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _368);
    float _524 = fma(_388, 0.5, _380);
    float _526 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _366);
    float _528 = _508;
    if (_468)
    {
        float _530 = _458 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _492 = _530;
    }
    float _532 = _492;
    float _534 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _536 = _532;
    if (!_480)
    {
        float _538 = _482 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _536 = _538;
    }
    float _540 = _536;
    float _542 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _374);
    float _544 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _546 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _372);
    float _548 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _362);
    float _550 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _360);
    if (!_518)
    {
        float _552 = _454 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _528 = _552;
    }
    float _554 = _528;
    if (!_518)
    {
        float _556 = _470 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _498 = _556;
    }
    float _558 = _498;
    if (!_518)
    {
        float _560 = _520 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _504 = _560;
    }
    float _562 = _504;
    float _564 = 0.0 + _540;
    float _566 = precise::clamp(_564, 0.0, 1.0);
    float _568 = 0.0 + _554;
    float _570 = precise::clamp(_568, 0.0, 1.0);
    float _572 = _522 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _574 = _526 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _576 = _572;
    float _578 = _574;
    if (_468)
    {
        float _580 = _542 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _576 = _580;
    }
    float _582 = _576;
    float _584 = _570 * _534;
    float _586 = _570 * _544;
    float _588 = _582;
    if (_468)
    {
        float _590 = _546 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _578 = _590;
    }
    float _592 = _578;
    float _594 = _592;
    if (!_480)
    {
        float _596 = _548 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _588 = _596;
    }
    float _598 = _588;
    float _600 = fma(_394, -0.5, _382);
    if (!_480)
    {
        float _602 = _550 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _594 = _602;
    }
    float _604 = _594;
    float _606 = fma(_584, 0.5, _558);
    float _608 = _534 * _566;
    float _610 = fma(_584, -0.5, _558);
    float _612 = fma(_586, 0.5, _562);
    float _614 = fma(_586, -0.5, _562);
    float _616 = fma(_608, 0.5, _604);
    float _618 = fma(_608, -0.5, _604);
    float _620 = rint(_426);
    float _622 = precise::max(_620, 0.0);
    uint _624 = uint(_622);
    uint _626 = clamp(_624, 0u, 65535u);
    float _628 = _544 * _566;
    float _630 = rint(_452);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    uint _636 = clamp(_634, 0u, 65535u);
    float _638 = fma(_628, 0.5, _598);
    float _640 = fma(_628, -0.5, _598);
    float3 _1857 = float3(_524, _398, float(int(_330)));
    float3 _1859 = select(_1857, float3(0.0), isnan(_1857));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1859.xy, uint(rint(_1859.z)), _336);
    float _644 = fma(_256, 2.0, -1.0);
    float _646 = fma(_258, 2.0, -1.0);
    float _648 = _644 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _650 = _646 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _652 = fma(_648, 2.0, _54);
    float _654 = fma(_650, 2.0, _56);
    float3 _1889 = float3(_524, _600, float(int(_330)));
    float3 _1891 = select(_1889, float3(0.0), isnan(_1889));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1891.xy, uint(rint(_1891.z)), _336);
    float3 _1900 = float3(_396, _600, float(int(_330)));
    float3 _1902 = select(_1900, float3(0.0), isnan(_1900));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1902.xy, uint(rint(_1902.z)), _336);
    float3 _1911 = float3(_610, _612, float(int(_626)));
    float3 _1913 = select(_1911, float3(0.0), isnan(_1911));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1913.xy, uint(rint(_1913.z)), _570);
    float3 _1922 = float3(_606, _612, float(int(_626)));
    float3 _1924 = select(_1922, float3(0.0), isnan(_1922));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1924.xy, uint(rint(_1924.z)), _570);
    float3 _1933 = float3(_606, _614, float(int(_626)));
    float3 _1935 = select(_1933, float3(0.0), isnan(_1933));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1935.xy, uint(rint(_1935.z)), _570);
    float3 _1944 = float3(_618, _638, float(int(_636)));
    float3 _1946 = select(_1944, float3(0.0), isnan(_1944));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1946.xy, uint(rint(_1946.z)), _566);
    float3 _1955 = float3(_616, _638, float(int(_636)));
    float3 _1957 = select(_1955, float3(0.0), isnan(_1955));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1957.xy, uint(rint(_1957.z)), _566);
    float3 _1966 = float3(_616, _640, float(int(_636)));
    float3 _1968 = select(_1966, float3(0.0), isnan(_1966));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1968.xy, uint(rint(_1968.z)), _566);
    float3 _1977 = float3(_610, _614, float(int(_626)));
    float3 _1979 = select(_1977, float3(0.0), isnan(_1977));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1979.xy, uint(rint(_1979.z)), _570);
    float3 _1988 = float3(_618, _640, float(int(_636)));
    float3 _1990 = select(_1988, float3(0.0), isnan(_1988));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1990.xy, uint(rint(_1990.z)), _566);
    float2 _1996 = float2(_652, _654);
    float _676 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1996, float2(0.0), isnan(_1996))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1996, float2(0.0), isnan(_1996))).x;
    float _678 = -_70;
    float _680 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _682 = _678 + _680;
    float _684 = -_70;
    float _686 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _688 = _684 + _686;
    float _690 = _682 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = _642 + _416;
    float _696 = _694 + _656;
    float _698 = _662 + _660;
    float _700 = _696 + _658;
    float _702 = _668 + _666;
    float _704 = _698 + _664;
    float _706 = fma(_700, 0.25, _692);
    float _708 = _702 + _670;
    float _710 = _704 + _672;
    float _712 = _708 + _674;
    float _714 = _710 * 0.25;
    float _716 = _712 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _718 = _716 * 0.25;
    float _720 = fma(_714, (*spvDescriptorSet0.fp_c3)._m0[49].z, _718);
    float _722 = _688 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = _720 + _724;
    out.m_47.x = _676;
    out.m_47.y = _706;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _726;
    return out;
}

