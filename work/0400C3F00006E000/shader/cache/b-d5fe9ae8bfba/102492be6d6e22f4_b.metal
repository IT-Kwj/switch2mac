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
    bool _126 = false;
    bool _124 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _662 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_662, float2(0.0), isnan(_662))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_662, float2(0.0), isnan(_662))).x;
    float _60 = in.m_44.y;
    float _62 = -_58;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _60;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_66;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _80 = -_66;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _84 = !_74;
    int _87 = _84 ? 0 : 1;
    int _89 = 2;
    if (!_74)
    {
        _89 = 1;
    }
    int _91 = _89;
    int _93 = _91;
    if (!_78)
    {
        _93 = _87;
    }
    int _95 = _93;
    int _97 = _95 + 1;
    uint _100 = uint(_97);
    if (!_82)
    {
        _100 = uint(_95);
    }
    uint _102 = _100;
    uint _104 = min(_102, 2u);
    int _106 = int(_104) << 2;
    float _108 = in.m_44.x;
    uint _110 = uint(int(uint(_106) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.fp_c1)._m0[int(_112)][_114];
    float _118 = _66 * _108;
    bool _120 = as_type<int>(_116) == 384;
    if (!_120)
    {
        bool _122 = as_type<int>(_116) == 656;
        _124 = _122;
        if (!_124)
        {
            _126 = true;
        }
    }
    float _160;
    float _162;
    float _164;
    float _166;
    if (!_124)
    {
        if (!_126)
        {
            float _128 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _130 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _132 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
            float _138 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].x, _130);
            float _140 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _160 = _158;
            _162 = _154;
            _164 = _152;
            _166 = _156;
        }
    }
    if ((false || _126) || _124)
    {
        if ((!_126) || _124)
        {
            _124 = false;
            float _168 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _170 = _68 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _172 = _68 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _68 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[5].x, _168);
            float _178 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[4].x, _170);
            float _180 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _194;
            _164 = _192;
            _166 = _196;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _68 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _202 = _68 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _204 = _68 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _68 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[9].x, _200);
            float _210 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[8].x, _202);
            float _212 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _160 = _230;
            _162 = _226;
            _164 = _224;
            _166 = _228;
        }
    }
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = -_68;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _244 = -_118;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _248 = -_68;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _252 = _242 * _242;
    float _254 = -_66;
    float _256 = _254 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _258 = _250 * _250;
    float _260 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _262 = fma(_246, _246, _252);
    float _264 = -_118;
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _268 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _270 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _272 = fma(_256, _256, _262);
    float _274 = -_66;
    float _276 = _274 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _278 = fma(_266, _266, _258);
    float _280 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _282 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _284 = fma(_276, _276, _278);
    float _286 = sqrt(_272);
    float _288 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _290 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _292 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[18].x, _280);
    float _294 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[33].x, _282);
    float _296 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _298 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[27].x, _288);
    float _300 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[28].x, _290);
    float _302 = sqrt(_284);
    float _304 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _306 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _294);
    float _308 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _310 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _312 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _314 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _316 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _318 = _286 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _320 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[25].x, _296);
    bool _322 = _286 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _324 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _300);
    bool _326 = !_318;
    int _328 = _326 ? 0 : 1;
    float _330 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _320);
    float _332 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[19].x, _308);
    float _334 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[20].x, _312);
    bool _336 = _302 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _338 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[17].x, _314);
    bool _340 = _302 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _342 = 1.0 / _232;
    bool _344 = !_336;
    int _346 = _344 ? 0 : 1;
    float _348 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _298);
    int _350 = 2;
    int _352 = 2;
    if (!_318)
    {
        _350 = 1;
    }
    int _354 = _350;
    float _356 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _332);
    int _358 = _354;
    if (!_322)
    {
        _358 = _328;
    }
    int _360 = _358;
    float _362 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[21].x, _268);
    float _364 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _334);
    float _366 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _338);
    if (!_336)
    {
        _352 = 1;
    }
    int _368 = _352;
    float _370 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _362);
    int _372 = _368;
    if (!_340)
    {
        _372 = _346;
    }
    int _374 = _372;
    float _376 = float(_360);
    float _378 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[24].x, _270);
    float _380 = float(_374);
    float _382 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[30].x, _260);
    float _384 = precise::min(_376, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _386 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _388 = precise::min(_380, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _390 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _382);
    bool _392 = _384 != 1.0;
    bool _394 = isnan(_384);
    bool _396 = _392 || _394;
    bool _398 = isnan(1.0);
    bool _400 = _396 || _398;
    float _402 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _378);
    bool _404 = _388 != 1.0;
    bool _406 = isnan(_388);
    bool _408 = _404 || _406;
    bool _410 = isnan(1.0);
    bool _412 = _408 || _410;
    float _414 = _390 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _416 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _418 = _384 != 0.0;
    bool _420 = isnan(_384);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[29].x, _386);
    bool _430 = _388 != 0.0;
    bool _432 = isnan(_388);
    bool _434 = _430 || _432;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    float _440 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _292);
    float _442 = _370 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _444 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _446 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[31].x, _416);
    float _448 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _450 = _442;
    float _452 = _414;
    if (_400)
    {
        float _454 = _402 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _450 = _454;
    }
    float _456 = _450;
    float _458 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[23].x, _304);
    float _460 = _456;
    if (_412)
    {
        float _462 = _306 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _452 = _462;
    }
    float _464 = _452;
    float _466 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _446);
    float _468 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[22].x, _310);
    float _470 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[16].x, _444);
    float _472 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[26].x, _316);
    float _474 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[32].x, _448);
    float _476 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _458);
    float _478 = _324 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _480 = _478;
    float _482 = _464;
    if (_412)
    {
        float _484 = _466 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _480 = _484;
    }
    float _486 = _480;
    float _488 = _486;
    if (!_426)
    {
        float _490 = _440 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _460 = _490;
    }
    float _492 = _460;
    if (!_438)
    {
        float _494 = _330 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _488 = _494;
    }
    float _496 = _488;
    float _498 = float(int(_102));
    float2 _1535 = float2(_54, _56);
    float2 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1535, float2(0.0), isnan(_1535))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1535, float2(0.0), isnan(_1535))).xy;
    float _504 = _502.x;
    float _506 = _502.y;
    float _508 = rint(_388);
    float _510 = precise::max(_508, 0.0);
    uint _512 = uint(_510);
    uint _514 = clamp(_512, 0u, 65535u);
    float _516 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _428);
    float _518 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _474);
    float _520 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _468);
    float _522 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _472);
    float _524 = _342 * _234;
    float _526 = _342 * _236;
    float _528 = _342 * _238;
    float _530 = precise::clamp(_528, 0.0, 1.0);
    float _532 = rint(_384);
    float _534 = precise::max(_532, 0.0);
    uint _536 = uint(_534);
    uint _538 = clamp(_536, 0u, 65535u);
    float _540 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _470);
    if (!_438)
    {
        float _542 = _348 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _482 = _542;
    }
    float _544 = _482;
    float _546 = _516 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _548 = _356 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _550 = _546;
    float _552 = _548;
    if (_412)
    {
        float _554 = _518 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _550 = _554;
    }
    float _556 = _550;
    float _558 = _556;
    if (_400)
    {
        float _560 = _520 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _552 = _560;
    }
    float _562 = _552;
    float _564 = _562;
    if (!_438)
    {
        float _566 = _522 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _558 = _566;
    }
    float _568 = _558;
    float _570 = rint(_498);
    float _572 = precise::max(_570, 0.0);
    uint _574 = uint(_572);
    uint _576 = clamp(_574, 0u, 65535u);
    float _578 = _364 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _580 = _578;
    if (!_426)
    {
        float _582 = _540 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _564 = _582;
    }
    float _584 = _564;
    if (_400)
    {
        float _586 = _476 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _580 = _586;
    }
    float _588 = _580;
    float _590 = 0.0 + _544;
    float _592 = precise::clamp(_590, 0.0, 1.0);
    float _594 = _588;
    if (!_426)
    {
        float _596 = _366 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _594 = _596;
    }
    float _598 = _594;
    float _600 = 0.0 + _492;
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float3 _1706 = float3(_496, _568, float(int(_514)));
    float3 _1710 = select(_1706, float3(0.0), isnan(_1706));
    float _604 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1710.xy, uint(rint(_1710.z)), _592);
    float3 _1719 = float3(_584, _598, float(int(_538)));
    float3 _1721 = select(_1719, float3(0.0), isnan(_1719));
    float _606 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1721.xy, uint(rint(_1721.z)), _602);
    float3 _1730 = float3(_524, _526, float(int(_576)));
    float3 _1732 = select(_1730, float3(0.0), isnan(_1730));
    float _608 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1732.xy, uint(rint(_1732.z)), _530);
    float _610 = fma(_504, 2.0, -1.0);
    float _612 = fma(_506, 2.0, -1.0);
    float _614 = _610 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _616 = _612 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _618 = fma(_614, 2.0, _54);
    float _620 = fma(_616, 2.0, _56);
    float2 _1759 = float2(_618, _620);
    float _622 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1759, float2(0.0), isnan(_1759))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1759, float2(0.0), isnan(_1759))).x;
    float _624 = -_66;
    float _626 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _628 = _624 + _626;
    float _630 = -_66;
    float _632 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _634 = _630 + _632;
    float _636 = _628 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _638 = precise::clamp(_636, 0.0, 1.0);
    float _640 = _634 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _642 = precise::clamp(_640, 0.0, 1.0);
    float _644 = _604 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _646 = fma(_606, (*spvDescriptorSet0.fp_c3)._m0[49].z, _644);
    float _648 = _608 + _638;
    float _650 = _646 + _642;
    out.m_47.x = _622;
    out.m_47.y = _648;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _650;
    return out;
}

