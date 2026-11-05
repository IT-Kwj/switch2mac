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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
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
    bool _126 = false;
    bool _124 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _641 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_641, float2(0.0), isnan(_641))).x;
    float2 _652 = float2(_52, _54);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_652, float2(0.0), isnan(_652))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_652, float2(0.0), isnan(_652))).x;
    float _60 = in.m_42.y;
    float _62 = in.m_42.x;
    float _64 = -_56;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[46].z, _66);
    float _70 = -_68;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_68;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _80 = -_68;
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
    float _108 = _68 * _62;
    float _110 = _68 * _60;
    uint _112 = uint(int(uint(_106) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.fp_c1)._m0[int(_114)][_116];
    bool _120 = as_type<int>(_118) == 416;
    if (!_120)
    {
        bool _122 = as_type<int>(_118) == 688;
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
            float _128 = _110 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _110 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _110 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _110 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _160 = _158;
            _162 = _152;
            _164 = _154;
            _166 = _156;
        }
    }
    if ((false || _126) || _124)
    {
        if ((!_126) || _124)
        {
            _124 = false;
            float _168 = _110 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _110 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _192;
            _164 = _194;
            _166 = _196;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _110 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _110 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _110 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _110 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _160 = _230;
            _162 = _224;
            _164 = _226;
            _166 = _228;
        }
    }
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = -_110;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _244 = -_108;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _248 = -_110;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _252 = -_108;
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _256 = _242 * _242;
    float _258 = -_68;
    float _260 = _258 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _262 = _110 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _264 = _110 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _266 = fma(_246, _246, _256);
    float _268 = _250 * _250;
    float _270 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].x, _262);
    float _272 = fma(_260, _260, _266);
    float _274 = -_68;
    float _276 = _274 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _278 = fma(_254, _254, _268);
    float _280 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].x, _264);
    float _282 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _270);
    float _284 = fma(_276, _276, _278);
    float _286 = sqrt(_272);
    float _288 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _280);
    float _290 = _282 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _292 = _110 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _294 = _110 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _296 = _110 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _298 = _110 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _300 = _110 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _302 = sqrt(_284);
    float _304 = _110 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _306 = _110 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _308 = _110 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _310 = _110 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _312 = _110 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _314 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].x, _292);
    float _316 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].x, _296);
    bool _318 = _286 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _320 = 1.0 / _232;
    bool _322 = _286 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _324 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].x, _306);
    bool _326 = !_318;
    int _328 = _326 ? 0 : 1;
    float _330 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].x, _298);
    float _332 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].x, _300);
    float _334 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].x, _308);
    bool _336 = _302 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _338 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].x, _310);
    bool _340 = _302 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _342 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].x, _312);
    bool _344 = !_336;
    int _346 = _344 ? 0 : 1;
    float _348 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _314);
    int _350 = 2;
    int _352 = 2;
    float _354 = _290;
    if (!_318)
    {
        _350 = 1;
    }
    int _356 = _350;
    float _358 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _334);
    int _360 = _356;
    if (!_322)
    {
        _360 = _328;
    }
    int _362 = _360;
    float _364 = _110 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _366 = _320 * _234;
    float _368 = _320 * _236;
    float _370 = float(_362);
    float _372 = _110 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_336)
    {
        _352 = 1;
    }
    int _374 = _352;
    float _376 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].x, _364);
    int _378 = _374;
    if (!_340)
    {
        _378 = _346;
    }
    int _380 = _378;
    float _382 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].x, _372);
    float _384 = precise::min(_370, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _386 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _376);
    float _388 = float(_380);
    float _390 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _382);
    bool _392 = _384 != 1.0;
    bool _394 = isnan(_384);
    bool _396 = _392 || _394;
    bool _398 = isnan(1.0);
    bool _400 = _396 || _398;
    float _402 = _386 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _404 = precise::min(_388, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _406 = _110 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _408 = _110 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _410 = _384 != 0.0;
    bool _412 = isnan(_384);
    bool _414 = _410 || _412;
    bool _416 = isnan(0.0);
    bool _418 = _414 || _416;
    float _420 = _320 * _238;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    bool _424 = _404 != 1.0;
    bool _426 = isnan(_404);
    bool _428 = _424 || _426;
    bool _430 = isnan(1.0);
    bool _432 = _428 || _430;
    float _434 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].x, _408);
    bool _436 = _404 != 0.0;
    bool _438 = isnan(_404);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _330);
    float _448 = float(int(_102));
    float _450 = rint(_384);
    float _452 = precise::max(_450, 0.0);
    uint _454 = uint(_452);
    uint _456 = clamp(_454, 0u, 65535u);
    float _458 = _402;
    if (_400)
    {
        float _460 = _390 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _458 = _460;
    }
    float _462 = _458;
    float _464 = _110 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _466 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _434);
    float _468 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _338);
    float _470 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _342);
    float _472 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _316);
    float _474 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _324);
    float _476 = _462;
    if (_432)
    {
        float _478 = _288 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _354 = _478;
    }
    float _480 = _354;
    float _482 = _110 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _484 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].x, _464);
    float _486 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].x, _294);
    float _488 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].x, _304);
    float _490 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].x, _482);
    float _492 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].x, _406);
    float _494 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _486);
    float _496 = _348 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _498 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _484);
    float _500 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _492);
    float _502 = _496;
    float _504 = _480;
    if (_400)
    {
        float _506 = _494 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _502 = _506;
    }
    float _508 = _502;
    float _510 = _508;
    if (!_444)
    {
        float _512 = _358 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _504 = _512;
    }
    float _514 = _504;
    float _516 = rint(_404);
    float _518 = precise::max(_516, 0.0);
    uint _520 = uint(_518);
    uint _522 = clamp(_520, 0u, 65535u);
    float _524 = _446 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _526 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _488);
    float _528 = _524;
    if (_400)
    {
        float _530 = _498 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _528 = _530;
    }
    float _532 = _528;
    float _534 = _500 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _536 = _466 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _538 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _332);
    float _540 = _534;
    float _542 = _536;
    float _544 = _532;
    if (_432)
    {
        float _546 = _468 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _540 = _546;
    }
    float _548 = _540;
    float _550 = rint(_448);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    uint _556 = clamp(_554, 0u, 65535u);
    float _558 = _548;
    if (_432)
    {
        float _560 = _470 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _542 = _560;
    }
    float _562 = _542;
    float _564 = _562;
    if (!_418)
    {
        float _566 = _472 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _476 = _566;
    }
    float _568 = _476;
    if (!_444)
    {
        float _570 = _526 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _558 = _570;
    }
    float _572 = _558;
    float _574 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _490);
    if (!_444)
    {
        float _576 = _474 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _564 = _576;
    }
    float _578 = _564;
    float _580 = 0.0 + _514;
    float _582 = precise::clamp(_580, 0.0, 1.0);
    if (!_418)
    {
        float _584 = _538 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _510 = _584;
    }
    float _586 = _510;
    if (!_418)
    {
        float _588 = _574 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _544 = _588;
    }
    float _590 = _544;
    float _592 = 0.0 + _568;
    float _594 = precise::clamp(_592, 0.0, 1.0);
    float3 _1681 = float3(_572, _578, float(int(_522)));
    float3 _1685 = select(_1681, float3(0.0), isnan(_1681));
    float _596 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1685.xy, uint(rint(_1685.z)), _582);
    float3 _1694 = float3(_590, _586, float(int(_456)));
    float3 _1696 = select(_1694, float3(0.0), isnan(_1694));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1696.xy, uint(rint(_1696.z)), _594);
    float3 _1705 = float3(_366, _368, float(int(_556)));
    float3 _1707 = select(_1705, float3(0.0), isnan(_1705));
    float _600 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1707.xy, uint(rint(_1707.z)), _422);
    float _602 = -_68;
    float _604 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _606 = _602 + _604;
    float _608 = -_68;
    float _610 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _612 = _608 + _610;
    float _614 = _606 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _616 = precise::clamp(_614, 0.0, 1.0);
    float _618 = _612 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _620 = precise::clamp(_618, 0.0, 1.0);
    float _622 = _596 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _624 = fma(_598, (*spvDescriptorSet0.fp_c3)._m0[49].z, _622);
    float _626 = _600 + _616;
    float _628 = _624 + _620;
    out.m_45.x = _58;
    out.m_45.y = _626;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _628;
    return out;
}

