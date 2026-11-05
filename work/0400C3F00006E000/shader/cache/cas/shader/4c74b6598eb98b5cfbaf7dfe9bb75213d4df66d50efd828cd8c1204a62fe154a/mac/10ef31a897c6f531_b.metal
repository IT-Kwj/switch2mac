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
    bool _126 = false;
    bool _124 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _744 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_744, float2(0.0), isnan(_744))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_744, float2(0.0), isnan(_744))).x;
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
            float _128 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _160 = _158;
            _162 = _156;
            _164 = _152;
            _166 = _154;
        }
    }
    if ((false || _126) || _124)
    {
        if ((!_126) || _124)
        {
            _124 = false;
            float _168 = _68 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _68 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _68 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _196;
            _164 = _192;
            _166 = _194;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _68 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _68 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _68 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _68 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _160 = _230;
            _162 = _228;
            _164 = _224;
            _166 = _226;
        }
    }
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _242 = -_68;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _246 = -_68;
    float _248 = _246 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _250 = -_118;
    float _252 = _250 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _254 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[21].x, _240);
    float _256 = _244 * _244;
    float2 _1164 = float2(_54, _56);
    float2 _260 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1164, float2(0.0), isnan(_1164))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1164, float2(0.0), isnan(_1164))).xy;
    float _262 = _260.x;
    float _264 = _260.y;
    float _266 = -_118;
    float _268 = _266 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _270 = _248 * _248;
    float _272 = fma(_252, _252, _256);
    float _274 = -_66;
    float _276 = _274 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _278 = 1.0 / _232;
    float _280 = fma(_268, _268, _270);
    float _282 = -_66;
    float _284 = _282 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _286 = fma(_276, _276, _272);
    float _288 = float(int(_102));
    float _290 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _292 = fma(_284, _284, _280);
    float _294 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _296 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _298 = sqrt(_286);
    float _300 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _302 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _304 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _306 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _308 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _310 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _312 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _314 = sqrt(_292);
    float _316 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _318 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _320 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _322 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _324 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _326 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _328 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _330 = rint(_288);
    float _332 = precise::max(_330, 0.0);
    uint _334 = uint(_332);
    uint _336 = clamp(_334, 0u, 65535u);
    bool _338 = _298 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _340 = _278 * _234;
    float _342 = precise::clamp(_340, 0.0, 1.0);
    bool _344 = _298 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _346 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[19].x, _290);
    float _348 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[22].x, _294);
    float _350 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[20].x, _296);
    bool _352 = _314 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _354 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[23].x, _300);
    bool _356 = _314 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _358 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[24].x, _302);
    float _360 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[16].x, _304);
    float _362 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[17].x, _306);
    float _364 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[18].x, _308);
    float _366 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[25].x, _310);
    float _368 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[26].x, _312);
    float _370 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[27].x, _316);
    float _372 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[28].x, _318);
    float _374 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[29].x, _320);
    float _376 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[30].x, _322);
    float _378 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[31].x, _324);
    float _380 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[32].x, _326);
    float _382 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[33].x, _328);
    float _384 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _342;
    float _386 = _278 * _236;
    float _388 = _278 * _238;
    bool _390 = !_352;
    int _392 = _390 ? 0 : 1;
    float _394 = _384 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    bool _396 = !_338;
    int _398 = _396 ? 0 : 1;
    float _400 = _384 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _402 = fma(_394, -0.5, _386);
    float _404 = fma(_400, 0.5, _388);
    int _406 = 2;
    int _408 = 2;
    if (!_352)
    {
        _406 = 1;
    }
    int _410 = _406;
    int _412 = _410;
    if (!_338)
    {
        _408 = 1;
    }
    int _414 = _408;
    int _416 = _414;
    if (!_356)
    {
        _412 = _392;
    }
    int _418 = _412;
    if (!_344)
    {
        _416 = _398;
    }
    int _420 = _416;
    float3 _1490 = float3(_402, _404, float(int(_336)));
    float3 _1494 = select(_1490, float3(0.0), isnan(_1490));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1494.xy, uint(rint(_1494.z)), _342);
    float _424 = float(_420);
    float _426 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _346);
    float _428 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _350);
    float _430 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _254);
    float _432 = precise::min(_424, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _434 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _348);
    float _436 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _354);
    float _438 = float(_418);
    float _440 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _358);
    bool _442 = _432 != 1.0;
    bool _444 = isnan(_432);
    bool _446 = _442 || _444;
    bool _448 = isnan(1.0);
    bool _450 = _446 || _448;
    float _452 = _426 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _454 = _428 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _456 = _430 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _458 = precise::min(_438, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _460 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _364);
    float _462 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _376);
    float _464 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _382);
    bool _466 = _458 != 1.0;
    bool _468 = isnan(_458);
    bool _470 = _466 || _468;
    bool _472 = isnan(1.0);
    bool _474 = _470 || _472;
    float _476 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _360);
    bool _478 = _458 != 0.0;
    bool _480 = isnan(_458);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _370);
    float _490 = _462 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _492 = _452;
    float _494 = _454;
    float _496 = _456;
    float _498 = _490;
    if (_450)
    {
        float _500 = _434 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _492 = _500;
    }
    float _502 = _492;
    float _504 = _502;
    if (_450)
    {
        float _506 = _436 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _494 = _506;
    }
    float _508 = _494;
    float _510 = _508;
    if (_450)
    {
        float _512 = _440 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _496 = _512;
    }
    float _514 = _496;
    bool _516 = _432 != 0.0;
    bool _518 = isnan(_432);
    bool _520 = _516 || _518;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    float _526 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _362);
    float _528 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _374);
    float _530 = fma(_394, 0.5, _386);
    float _532 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _372);
    float _534 = _514;
    if (_474)
    {
        float _536 = _464 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _498 = _536;
    }
    float _538 = _498;
    float _540 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _542 = _538;
    if (!_486)
    {
        float _544 = _488 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _542 = _544;
    }
    float _546 = _542;
    float _548 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _380);
    float _550 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _552 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _378);
    float _554 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _368);
    float _556 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _366);
    if (!_524)
    {
        float _558 = _460 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _534 = _558;
    }
    float _560 = _534;
    if (!_524)
    {
        float _562 = _476 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _504 = _562;
    }
    float _564 = _504;
    if (!_524)
    {
        float _566 = _526 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _510 = _566;
    }
    float _568 = _510;
    float _570 = 0.0 + _546;
    float _572 = precise::clamp(_570, 0.0, 1.0);
    float _574 = 0.0 + _560;
    float _576 = precise::clamp(_574, 0.0, 1.0);
    float _578 = _528 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _580 = _532 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _582 = _578;
    float _584 = _580;
    if (_474)
    {
        float _586 = _548 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _582 = _586;
    }
    float _588 = _582;
    float _590 = _576 * _540;
    float _592 = _576 * _550;
    float _594 = _588;
    if (_474)
    {
        float _596 = _552 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _584 = _596;
    }
    float _598 = _584;
    float _600 = _598;
    if (!_486)
    {
        float _602 = _554 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _594 = _602;
    }
    float _604 = _594;
    float _606 = fma(_400, -0.5, _388);
    if (!_486)
    {
        float _608 = _556 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _600 = _608;
    }
    float _610 = _600;
    float _612 = fma(_590, 0.5, _564);
    float _614 = _540 * _572;
    float _616 = fma(_590, -0.5, _564);
    float _618 = fma(_592, 0.5, _568);
    float _620 = fma(_592, -0.5, _568);
    float _622 = fma(_614, 0.5, _610);
    float _624 = fma(_614, -0.5, _610);
    float _626 = rint(_432);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    uint _632 = clamp(_630, 0u, 65535u);
    float _634 = _550 * _572;
    float _636 = rint(_458);
    float _638 = precise::max(_636, 0.0);
    uint _640 = uint(_638);
    uint _642 = clamp(_640, 0u, 65535u);
    float _644 = fma(_634, 0.5, _604);
    float _646 = fma(_634, -0.5, _604);
    float3 _1875 = float3(_530, _404, float(int(_336)));
    float3 _1877 = select(_1875, float3(0.0), isnan(_1875));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1877.xy, uint(rint(_1877.z)), _342);
    float _650 = fma(_262, 2.0, -1.0);
    float _652 = fma(_264, 2.0, -1.0);
    float _654 = _650 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _656 = _652 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _658 = fma(_654, 2.0, _54);
    float _660 = fma(_656, 2.0, _56);
    float3 _1907 = float3(_530, _606, float(int(_336)));
    float3 _1909 = select(_1907, float3(0.0), isnan(_1907));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1909.xy, uint(rint(_1909.z)), _342);
    float3 _1918 = float3(_402, _606, float(int(_336)));
    float3 _1920 = select(_1918, float3(0.0), isnan(_1918));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1920.xy, uint(rint(_1920.z)), _342);
    float3 _1929 = float3(_616, _618, float(int(_632)));
    float3 _1931 = select(_1929, float3(0.0), isnan(_1929));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1931.xy, uint(rint(_1931.z)), _576);
    float3 _1940 = float3(_612, _618, float(int(_632)));
    float3 _1942 = select(_1940, float3(0.0), isnan(_1940));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1942.xy, uint(rint(_1942.z)), _576);
    float3 _1951 = float3(_612, _620, float(int(_632)));
    float3 _1953 = select(_1951, float3(0.0), isnan(_1951));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1953.xy, uint(rint(_1953.z)), _576);
    float3 _1962 = float3(_624, _644, float(int(_642)));
    float3 _1964 = select(_1962, float3(0.0), isnan(_1962));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1964.xy, uint(rint(_1964.z)), _572);
    float3 _1973 = float3(_622, _644, float(int(_642)));
    float3 _1975 = select(_1973, float3(0.0), isnan(_1973));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1975.xy, uint(rint(_1975.z)), _572);
    float3 _1984 = float3(_622, _646, float(int(_642)));
    float3 _1986 = select(_1984, float3(0.0), isnan(_1984));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1986.xy, uint(rint(_1986.z)), _572);
    float3 _1995 = float3(_616, _620, float(int(_632)));
    float3 _1997 = select(_1995, float3(0.0), isnan(_1995));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1997.xy, uint(rint(_1997.z)), _576);
    float3 _2006 = float3(_624, _646, float(int(_642)));
    float3 _2008 = select(_2006, float3(0.0), isnan(_2006));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2008.xy, uint(rint(_2008.z)), _572);
    float2 _2014 = float2(_658, _660);
    float _682 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2014, float2(0.0), isnan(_2014))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2014, float2(0.0), isnan(_2014))).x;
    float _684 = -_66;
    float _686 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _688 = _684 + _686;
    float _690 = -_66;
    float _692 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _694 = _690 + _692;
    float _696 = _688 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _698 = precise::clamp(_696, 0.0, 1.0);
    float _700 = _648 + _422;
    float _702 = _700 + _662;
    float _704 = _668 + _666;
    float _706 = _702 + _664;
    float _708 = _674 + _672;
    float _710 = _704 + _670;
    float _712 = fma(_706, 0.25, _698);
    float _714 = _708 + _676;
    float _716 = _710 + _678;
    float _718 = _714 + _680;
    float _720 = _716 * 0.25;
    float _722 = _718 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _724 = _722 * 0.25;
    float _726 = fma(_720, (*spvDescriptorSet0.fp_c3)._m0[49].z, _724);
    float _728 = _694 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _730 = precise::clamp(_728, 0.0, 1.0);
    float _732 = _726 + _730;
    out.m_47.x = _682;
    out.m_47.y = _712;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _732;
    return out;
}

