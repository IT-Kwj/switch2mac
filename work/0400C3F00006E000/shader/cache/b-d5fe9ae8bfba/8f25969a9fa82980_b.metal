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
    bool _122 = false;
    bool _120 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _637 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_637, float2(0.0), isnan(_637))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_637, float2(0.0), isnan(_637))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = -_64;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = -_64;
    bool _74 = _72 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _76 = -_64;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _80 = !_70;
    int _83 = _80 ? 0 : 1;
    int _85 = 2;
    if (!_70)
    {
        _85 = 1;
    }
    int _87 = _85;
    int _89 = _87;
    if (!_74)
    {
        _89 = _83;
    }
    int _91 = _89;
    int _93 = _91 + 1;
    uint _96 = uint(_93);
    if (!_78)
    {
        _96 = uint(_91);
    }
    uint _98 = _96;
    uint _100 = min(_98, 2u);
    int _102 = int(_100) << 2;
    float _104 = _64 * _58;
    float _106 = _64 * _56;
    uint _108 = uint(int(uint(_102) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.fp_c1)._m0[int(_110)][_112];
    bool _116 = as_type<int>(_114) == 384;
    if (!_116)
    {
        bool _118 = as_type<int>(_114) == 656;
        _120 = _118;
        if (!_120)
        {
            _122 = true;
        }
    }
    float _156;
    float _158;
    float _160;
    float _162;
    if (!_120)
    {
        if (!_122)
        {
            float _124 = _106 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _126 = _106 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _128 = _106 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _130 = _106 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _132 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
            float _134 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[1].x, _126);
            float _136 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
            float _138 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[3].x, _130);
            float _140 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _132);
            float _142 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _134);
            float _144 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _136);
            float _146 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _138);
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _156 = _154;
            _158 = _148;
            _160 = _150;
            _162 = _152;
        }
    }
    if ((false || _122) || _120)
    {
        if ((!_122) || _120)
        {
            _120 = false;
            float _164 = _106 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _166 = _106 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _168 = _106 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _170 = _106 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _172 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[4].x, _164);
            float _174 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[5].x, _166);
            float _176 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[6].x, _168);
            float _178 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[7].x, _170);
            float _180 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _172);
            float _182 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _174);
            float _184 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _176);
            float _186 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _178);
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _156 = _194;
            _158 = _188;
            _160 = _190;
            _162 = _192;
        }
        if (false || _122)
        {
            _122 = false;
            float _196 = _106 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _198 = _106 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _200 = _106 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _202 = _106 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _204 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[8].x, _196);
            float _206 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[9].x, _198);
            float _208 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[10].x, _200);
            float _210 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[11].x, _202);
            float _212 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _204);
            float _214 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _206);
            float _216 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _208);
            float _218 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _210);
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _156 = _226;
            _158 = _220;
            _160 = _222;
            _162 = _224;
        }
    }
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = -_106;
    float _238 = _236 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _240 = -_104;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _244 = -_106;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _248 = -_104;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _252 = _238 * _238;
    float _254 = -_64;
    float _256 = _254 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _258 = _106 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _260 = _106 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _262 = fma(_242, _242, _252);
    float _264 = _246 * _246;
    float _266 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[30].x, _258);
    float _268 = fma(_256, _256, _262);
    float _270 = -_64;
    float _272 = _270 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _274 = fma(_250, _250, _264);
    float _276 = 1.0 / _228;
    float _278 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[33].x, _260);
    float _280 = fma(_272, _272, _274);
    float _282 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _266);
    float _284 = _106 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _286 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _278);
    float _288 = _106 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _290 = _282 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _292 = sqrt(_268);
    float _294 = _106 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _296 = _106 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _298 = _106 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _300 = _106 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _302 = _106 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _304 = _106 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _306 = _106 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _308 = sqrt(_280);
    float _310 = _106 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _312 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[18].x, _288);
    float _314 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[26].x, _296);
    float _316 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[19].x, _298);
    float _318 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[20].x, _300);
    float _320 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[23].x, _302);
    float _322 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[16].x, _304);
    bool _324 = _292 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _326 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[27].x, _306);
    bool _328 = _292 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _330 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[32].x, _310);
    bool _332 = !_324;
    int _334 = _332 ? 0 : 1;
    float _336 = _276 * _230;
    float _338 = _276 * _232;
    float _340 = _276 * _234;
    float _342 = precise::clamp(_340, 0.0, 1.0);
    bool _344 = _308 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _346 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _326);
    bool _348 = _308 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _350 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _316);
    bool _352 = !_344;
    int _354 = _352 ? 0 : 1;
    float _356 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _330);
    int _358 = 2;
    int _360 = 2;
    float _362 = _290;
    if (!_324)
    {
        _358 = 1;
    }
    int _364 = _358;
    float _366 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _312);
    int _368 = _364;
    if (!_328)
    {
        _368 = _334;
    }
    int _370 = _368;
    float _372 = _106 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _374 = float(int(_98));
    float _376 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _318);
    float _378 = float(_370);
    float _380 = _106 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_344)
    {
        _360 = 1;
    }
    int _382 = _360;
    float _384 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[21].x, _372);
    int _386 = _382;
    if (!_348)
    {
        _386 = _354;
    }
    int _388 = _386;
    float _390 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[24].x, _380);
    float _392 = precise::min(_378, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _394 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _384);
    float _396 = float(_388);
    float _398 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _390);
    bool _400 = _392 != 1.0;
    bool _402 = isnan(_392);
    bool _404 = _400 || _402;
    bool _406 = isnan(1.0);
    bool _408 = _404 || _406;
    float _410 = _394 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _412 = precise::min(_396, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _414 = _106 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _416 = _106 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _418 = _392 != 0.0;
    bool _420 = isnan(_392);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = rint(_374);
    float _430 = precise::max(_428, 0.0);
    uint _432 = uint(_430);
    uint _434 = clamp(_432, 0u, 65535u);
    bool _436 = _412 != 1.0;
    bool _438 = isnan(_412);
    bool _440 = _436 || _438;
    bool _442 = isnan(1.0);
    bool _444 = _440 || _442;
    float _446 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[28].x, _416);
    bool _448 = _412 != 0.0;
    bool _450 = isnan(_412);
    bool _452 = _448 || _450;
    bool _454 = isnan(0.0);
    bool _456 = _452 || _454;
    float _458 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _314);
    float _460 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _320);
    float _462 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _446);
    float _464 = _410;
    if (_408)
    {
        float _466 = _398 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _464 = _466;
    }
    float _468 = _464;
    float _470 = _106 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _472 = rint(_392);
    float _474 = precise::max(_472, 0.0);
    uint _476 = uint(_474);
    uint _478 = clamp(_476, 0u, 65535u);
    float _480 = _376 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _482 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _322);
    float _484 = _468;
    float _486 = _480;
    if (!_426)
    {
        float _488 = _366 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _484 = _488;
    }
    float _490 = _484;
    if (_408)
    {
        float _492 = _460 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _486 = _492;
    }
    float _494 = _486;
    float _496 = _494;
    if (_444)
    {
        float _498 = _286 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _362 = _498;
    }
    float _500 = _362;
    float _502 = _106 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _504 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[22].x, _284);
    float _506 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[25].x, _294);
    float _508 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[29].x, _414);
    float _510 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[17].x, _502);
    float _512 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[31].x, _470);
    float _514 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _504);
    float _516 = rint(_412);
    float _518 = precise::max(_516, 0.0);
    uint _520 = uint(_518);
    uint _522 = clamp(_520, 0u, 65535u);
    float _524 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _508);
    float _526 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _512);
    float _528 = _500;
    if (!_456)
    {
        float _530 = _346 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _528 = _530;
    }
    float _532 = _528;
    float _534 = _350 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _536 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _506);
    float _538 = _534;
    if (_408)
    {
        float _540 = _514 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = _462 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _546 = _524 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _548 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _510);
    float _550 = _544;
    float _552 = _546;
    float _554 = _542;
    if (_444)
    {
        float _556 = _526 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _550 = _556;
    }
    float _558 = _550;
    float _560 = _558;
    if (_444)
    {
        float _562 = _356 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _552 = _562;
    }
    float _564 = _552;
    float _566 = _564;
    if (!_456)
    {
        float _568 = _536 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _560 = _568;
    }
    float _570 = _560;
    if (!_456)
    {
        float _572 = _458 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _566 = _572;
    }
    float _574 = _566;
    float _576 = 0.0 + _532;
    float _578 = precise::clamp(_576, 0.0, 1.0);
    if (!_426)
    {
        float _580 = _548 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _496 = _580;
    }
    float _582 = _496;
    if (!_426)
    {
        float _584 = _482 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _554 = _584;
    }
    float _586 = _554;
    float _588 = 0.0 + _490;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    float3 _1669 = float3(_570, _574, float(int(_522)));
    float3 _1673 = select(_1669, float3(0.0), isnan(_1669));
    float _592 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1673.xy, uint(rint(_1673.z)), _578);
    float3 _1682 = float3(_586, _582, float(int(_478)));
    float3 _1684 = select(_1682, float3(0.0), isnan(_1682));
    float _594 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1684.xy, uint(rint(_1684.z)), _590);
    float3 _1693 = float3(_336, _338, float(int(_434)));
    float3 _1695 = select(_1693, float3(0.0), isnan(_1693));
    float _596 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1695.xy, uint(rint(_1695.z)), _342);
    float _598 = -_64;
    float _600 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _602 = _598 + _600;
    float _604 = -_64;
    float _606 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _608 = _604 + _606;
    float _610 = _602 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = _592 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _616 = fma(_594, (*spvDescriptorSet0.fp_c3)._m0[49].z, _614);
    float _618 = _608 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _620 = precise::clamp(_618, 0.0, 1.0);
    float _622 = _596 + _612;
    float _624 = _616 + _620;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _622;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _624;
    return out;
}

