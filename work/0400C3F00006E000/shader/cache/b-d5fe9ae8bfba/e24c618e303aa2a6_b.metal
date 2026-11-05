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
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _128 = false;
    bool _126 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _727 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_727, float2(0.0), isnan(_727))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_727, float2(0.0), isnan(_727))).x;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float _62 = -_56;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _58;
    float _74 = -_70;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = _70 * _60;
    float _82 = -_70;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _86 = -_70;
    bool _88 = _86 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _90 = !_78;
    int _93 = _90 ? 0 : 1;
    int _95 = 2;
    if (!_78)
    {
        _95 = 1;
    }
    int _97 = _95;
    int _99 = _97;
    if (!_84)
    {
        _99 = _93;
    }
    int _101 = _99;
    int _103 = _101 + 1;
    uint _106 = uint(_103);
    if (!_88)
    {
        _106 = uint(_101);
    }
    uint _108 = _106;
    uint _110 = min(_108, 2u);
    int _112 = int(_110) << 2;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    uint _116 = uint(int(uint(int(_114)) >> uint(2)));
    int _118 = int(_114) & 3;
    float _120 = (*spvDescriptorSet0.fp_c1)._m0[int(_116)][_118];
    bool _122 = as_type<int>(_120) == 416;
    if (!_122)
    {
        bool _124 = as_type<int>(_120) == 688;
        _126 = _124;
        if (!_126)
        {
            _128 = true;
        }
    }
    float _162;
    float _164;
    float _166;
    float _168;
    if (!_126)
    {
        if (!_128)
        {
            float _130 = _80 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _132 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _134 = _80 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _136 = _80 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _138 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
            float _140 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _132);
            float _142 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _134);
            float _144 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _136);
            float _146 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
            float _148 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _140);
            float _150 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _142);
            float _152 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _144);
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _162 = _160;
            _164 = _154;
            _166 = _156;
            _168 = _158;
        }
    }
    if ((false || _128) || _126)
    {
        if ((!_128) || _126)
        {
            _126 = false;
            float _170 = _80 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _172 = _80 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _174 = _80 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _176 = _80 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _178 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[6].x, _170);
            float _180 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, _172);
            float _182 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[5].x, _174);
            float _184 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[7].x, _176);
            float _186 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _178);
            float _188 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _180);
            float _190 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _182);
            float _192 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _184);
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _162 = _200;
            _164 = _194;
            _166 = _196;
            _168 = _198;
        }
        if (false || _128)
        {
            _128 = false;
            float _202 = _80 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _204 = _80 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _206 = _80 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _208 = _80 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _210 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[10].x, _202);
            float _212 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[8].x, _204);
            float _214 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[9].x, _206);
            float _216 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].x, _208);
            float _218 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _210);
            float _220 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _212);
            float _222 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _214);
            float _224 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _216);
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _162 = _232;
            _164 = _226;
            _166 = _228;
            _168 = _230;
        }
    }
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float _242 = 1.0 / _234;
    float _244 = float(int(_108));
    float _246 = rint(_244);
    float _248 = precise::max(_246, 0.0);
    uint _250 = uint(_248);
    uint _252 = clamp(_250, 0u, 65535u);
    float _254 = _242 * _236;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _242 * _238;
    float _260 = _242 * _240;
    float _262 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _256;
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _266 = _262 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _268 = fma(_264, -0.5, _258);
    float _270 = fma(_266, 0.5, _260);
    float3 _1171 = float3(_268, _270, float(int(_252)));
    float3 _1175 = select(_1171, float3(0.0), isnan(_1171));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1175.xy, uint(rint(_1175.z)), _256);
    float _274 = -_80;
    float _276 = _274 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _278 = -_72;
    float _280 = _278 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _282 = -_70;
    float _284 = _282 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _286 = _80 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _288 = _276 * _276;
    float _290 = -_70;
    float _292 = _290 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _294 = _80 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _296 = _80 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _298 = fma(_280, _280, _288);
    float _300 = -_72;
    float _302 = _300 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _304 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _294);
    float _306 = _80 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _308 = fma(_292, _292, _298);
    float _310 = -_80;
    float _312 = _310 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _314 = _80 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _316 = _80 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _318 = _80 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _320 = _80 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _322 = sqrt(_308);
    float _324 = _312 * _312;
    float _326 = _80 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _328 = _80 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _330 = fma(_302, _302, _324);
    float _332 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _286);
    float _334 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _296);
    float _336 = _80 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _338 = fma(_284, _284, _330);
    float _340 = _80 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _342 = _80 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _344 = _80 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _346 = _80 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _348 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _304);
    float _350 = sqrt(_338);
    bool _352 = _322 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _354 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _306);
    bool _356 = _322 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _358 = _80 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _360 = !_352;
    int _362 = _360 ? 0 : 1;
    float _364 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _332);
    float _366 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _314);
    float _368 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _358);
    float _370 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _316);
    float _372 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _318);
    float _374 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _340);
    float _376 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _320);
    float _378 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _326);
    int _380 = 2;
    if (!_352)
    {
        _380 = 1;
    }
    int _382 = _380;
    float _384 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _328);
    int _386 = _382;
    if (!_356)
    {
        _386 = _362;
    }
    int _388 = _386;
    float _390 = _80 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _392 = _350 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _394 = _80 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _396 = float(_388);
    float _398 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _390);
    bool _400 = _350 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _402 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _336);
    float _404 = precise::min(_396, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _406 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _342);
    bool _408 = !_392;
    int _410 = _408 ? 0 : 1;
    float _412 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _344);
    bool _414 = _404 != 1.0;
    bool _416 = isnan(_404);
    bool _418 = _414 || _416;
    bool _420 = isnan(1.0);
    bool _422 = _418 || _420;
    float _424 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _346);
    float _426 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _394);
    int _428 = 2;
    if (!_392)
    {
        _428 = 1;
    }
    int _430 = _428;
    float _432 = _348 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _434 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _398);
    int _436 = _430;
    float _438 = _432;
    if (!_400)
    {
        _436 = _410;
    }
    int _440 = _436;
    float _442 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _354);
    float _444 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _334);
    float _446 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _372);
    float _448 = float(_440);
    float _450 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _384);
    if (_422)
    {
        float _452 = _364 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _438 = _452;
    }
    float _454 = _438;
    float _456 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _368);
    float _458 = _434 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _460 = precise::min(_448, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _462 = _442 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _464 = _458;
    float _466 = _462;
    float _468 = _454;
    if (_422)
    {
        float _470 = _444 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _464 = _470;
    }
    float _472 = _464;
    float _474 = _472;
    if (_422)
    {
        float _476 = _456 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _466 = _476;
    }
    float _478 = _466;
    bool _480 = _404 != 0.0;
    bool _482 = isnan(_404);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _412);
    bool _492 = _460 != 1.0;
    bool _494 = isnan(_460);
    bool _496 = _492 || _494;
    bool _498 = isnan(1.0);
    bool _500 = _496 || _498;
    float _502 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _374);
    bool _504 = _460 != 0.0;
    bool _506 = isnan(_460);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    float _514 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _402);
    float _516 = _450 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _518 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _424);
    float _520 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _406);
    float _522 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _376);
    float _524 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _426);
    float _526 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _366);
    float _528 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _530 = _478;
    float _532 = _516;
    if (!_488)
    {
        float _534 = _446 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _530 = _534;
    }
    float _536 = _530;
    float _538 = _514 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _540 = _538;
    if (_500)
    {
        float _542 = _490 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _532 = _542;
    }
    float _544 = _532;
    float _546 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _378);
    float _548 = _544;
    if (!_512)
    {
        float _550 = _502 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _548 = _550;
    }
    float _552 = _548;
    float _554 = 0.0 + _536;
    float _556 = precise::clamp(_554, 0.0, 1.0);
    if (_500)
    {
        float _558 = _518 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _540 = _558;
    }
    float _560 = _540;
    float _562 = _520 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _564 = _560;
    float _566 = _562;
    if (!_512)
    {
        float _568 = _522 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _564 = _568;
    }
    float _570 = _564;
    float _572 = fma(_264, 0.5, _258);
    if (_500)
    {
        float _574 = _524 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _566 = _574;
    }
    float _576 = _566;
    float _578 = _576;
    if (!_488)
    {
        float _580 = _526 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _468 = _580;
    }
    float _582 = _468;
    float _584 = rint(_404);
    float _586 = precise::max(_584, 0.0);
    uint _588 = uint(_586);
    uint _590 = clamp(_588, 0u, 65535u);
    float _592 = _556 * _528;
    if (!_512)
    {
        float _594 = _546 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _578 = _594;
    }
    float _596 = _578;
    float _598 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _370);
    float _600 = fma(_266, -0.5, _260);
    float _602 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _604 = fma(_592, 0.5, _582);
    float _606 = 0.0 + _596;
    float _608 = precise::clamp(_606, 0.0, 1.0);
    float _610 = fma(_592, -0.5, _582);
    if (!_488)
    {
        float _612 = _598 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _474 = _612;
    }
    float _614 = _474;
    float _616 = rint(_460);
    float _618 = precise::max(_616, 0.0);
    uint _620 = uint(_618);
    uint _622 = clamp(_620, 0u, 65535u);
    float _624 = _556 * _602;
    float _626 = _528 * _608;
    float _628 = _602 * _608;
    float _630 = fma(_624, 0.5, _614);
    float _632 = fma(_624, -0.5, _614);
    float _634 = fma(_626, 0.5, _552);
    float _636 = fma(_626, -0.5, _552);
    float _638 = fma(_628, 0.5, _570);
    float _640 = fma(_628, -0.5, _570);
    float3 _1850 = float3(_572, _270, float(int(_252)));
    float3 _1852 = select(_1850, float3(0.0), isnan(_1850));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1852.xy, uint(rint(_1852.z)), _256);
    float3 _1861 = float3(_572, _600, float(int(_252)));
    float3 _1863 = select(_1861, float3(0.0), isnan(_1861));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1863.xy, uint(rint(_1863.z)), _256);
    float3 _1872 = float3(_268, _600, float(int(_252)));
    float3 _1874 = select(_1872, float3(0.0), isnan(_1872));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1874.xy, uint(rint(_1874.z)), _256);
    float3 _1883 = float3(_610, _630, float(int(_590)));
    float3 _1885 = select(_1883, float3(0.0), isnan(_1883));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1885.xy, uint(rint(_1885.z)), _556);
    float3 _1894 = float3(_604, _630, float(int(_590)));
    float3 _1896 = select(_1894, float3(0.0), isnan(_1894));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1896.xy, uint(rint(_1896.z)), _556);
    float3 _1905 = float3(_604, _632, float(int(_590)));
    float3 _1907 = select(_1905, float3(0.0), isnan(_1905));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1907.xy, uint(rint(_1907.z)), _556);
    float3 _1916 = float3(_610, _632, float(int(_590)));
    float3 _1918 = select(_1916, float3(0.0), isnan(_1916));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1918.xy, uint(rint(_1918.z)), _556);
    float3 _1927 = float3(_636, _638, float(int(_622)));
    float3 _1929 = select(_1927, float3(0.0), isnan(_1927));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1929.xy, uint(rint(_1929.z)), _608);
    float3 _1938 = float3(_634, _638, float(int(_622)));
    float3 _1940 = select(_1938, float3(0.0), isnan(_1938));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1940.xy, uint(rint(_1940.z)), _608);
    float3 _1949 = float3(_634, _640, float(int(_622)));
    float3 _1951 = select(_1949, float3(0.0), isnan(_1949));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1951.xy, uint(rint(_1951.z)), _608);
    float3 _1960 = float3(_636, _640, float(int(_622)));
    float3 _1962 = select(_1960, float3(0.0), isnan(_1960));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1962.xy, uint(rint(_1962.z)), _608);
    float2 _1968 = float2(_52, _54);
    float _664 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1968, float2(0.0), isnan(_1968))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1968, float2(0.0), isnan(_1968))).x;
    float _666 = -_70;
    float _668 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _670 = _666 + _668;
    float _672 = -_70;
    float _674 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _676 = _672 + _674;
    float _678 = _670 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _680 = precise::clamp(_678, 0.0, 1.0);
    float _682 = _642 + _272;
    float _684 = _682 + _644;
    float _686 = _684 + _646;
    float _688 = _650 + _648;
    float _690 = fma(_686, 0.25, _680);
    float _692 = _688 + _652;
    float _694 = _658 + _656;
    float _696 = _692 + _654;
    float _698 = _696 * 0.25;
    float _700 = _694 + _660;
    float _702 = _700 + _662;
    float _704 = _702 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _706 = _704 * 0.25;
    float _708 = fma(_698, (*spvDescriptorSet0.fp_c3)._m0[49].z, _706);
    float _710 = _676 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _712 = precise::clamp(_710, 0.0, 1.0);
    float _714 = _708 + _712;
    out.m_45.x = _664;
    out.m_45.y = _690;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _714;
    return out;
}

