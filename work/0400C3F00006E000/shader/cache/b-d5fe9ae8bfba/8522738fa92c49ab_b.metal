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
    float2 _771 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_771, float2(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_771, float2(0.0), isnan(_771))).x;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _56;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = _64 * _58;
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
            _148 = _140;
            _150 = _142;
            _152 = _138;
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
            _148 = _180;
            _150 = _182;
            _152 = _178;
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
            _148 = _212;
            _150 = _214;
            _152 = _210;
        }
    }
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = float(int(_91));
    float _228 = 1.0 / _218;
    float _230 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _232 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _234 = rint(_226);
    float _236 = precise::max(_234, 0.0);
    uint _238 = uint(_236);
    uint _240 = clamp(_238, 0u, 65535u);
    float _242 = _228 * _220;
    float _244 = _228 * _222;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _228 * _224;
    float _250 = fma(_246, _230, _242);
    float _252 = fma(_246, _232, _248);
    float _254 = -_232;
    float _256 = fma(_246, _254, _248);
    float3 _1199 = float3(_248, _250, float(int(_240)));
    float3 _1203 = select(_1199, float3(0.0), isnan(_1199));
    float _258 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1203.xy, uint(rint(_1203.z)), _246);
    float3 _1212 = float3(_252, _250, float(int(_240)));
    float3 _1214 = select(_1212, float3(0.0), isnan(_1212));
    float _260 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1214.xy, uint(rint(_1214.z)), _246);
    float3 _1223 = float3(_256, _250, float(int(_240)));
    float3 _1225 = select(_1223, float3(0.0), isnan(_1223));
    float _262 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1225.xy, uint(rint(_1225.z)), _246);
    float _264 = -_230;
    float _266 = fma(_246, _264, _242);
    float3 _1240 = float3(_252, _242, float(int(_240)));
    float3 _1242 = select(_1240, float3(0.0), isnan(_1240));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1242.xy, uint(rint(_1242.z)), _246);
    float3 _1251 = float3(_248, _242, float(int(_240)));
    float3 _1253 = select(_1251, float3(0.0), isnan(_1251));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1253.xy, uint(rint(_1253.z)), _246);
    float3 _1262 = float3(_256, _242, float(int(_240)));
    float3 _1264 = select(_1262, float3(0.0), isnan(_1262));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1264.xy, uint(rint(_1264.z)), _246);
    float3 _1273 = float3(_252, _266, float(int(_240)));
    float3 _1275 = select(_1273, float3(0.0), isnan(_1273));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1275.xy, uint(rint(_1275.z)), _246);
    float _276 = -_74;
    float _278 = _276 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _280 = -_66;
    float _282 = _280 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _284 = _74 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _286 = _278 * _278;
    float _288 = fma(_282, _282, _286);
    float _290 = -_64;
    float _292 = _290 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _294 = fma(_292, _292, _288);
    float _296 = sqrt(_294);
    float _298 = _74 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _300 = _296 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _302 = _296 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _304 = !_300;
    int _306 = _304 ? 0 : 1;
    int _308 = 2;
    if (!_300)
    {
        _308 = 1;
    }
    int _310 = _308;
    int _312 = _310;
    if (!_302)
    {
        _312 = _306;
    }
    int _314 = _312;
    float _316 = _74 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _318 = _74 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _320 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].x, _284);
    float _322 = float(_314);
    float _324 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].x, _316);
    float _326 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].x, _318);
    float _328 = _74 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _330 = precise::min(_322, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _332 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _324);
    float _334 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].x, _298);
    float _336 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _326);
    bool _338 = _330 != 1.0;
    bool _340 = isnan(_330);
    bool _342 = _338 || _340;
    bool _344 = isnan(1.0);
    bool _346 = _342 || _344;
    float _348 = _74 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _350 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _320);
    float _352 = _332 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _354 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].x, _328);
    float _356 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _334);
    float _358 = _336 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _360 = _330 != 0.0;
    bool _362 = isnan(_330);
    bool _364 = _360 || _362;
    bool _366 = isnan(0.0);
    bool _368 = _364 || _366;
    float _370 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].x, _348);
    float _372 = _74 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _374 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _354);
    float _376 = _74 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _378 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _370);
    float _380 = _352;
    float _382 = _358;
    if (_346)
    {
        float _384 = _356 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _380 = _384;
    }
    float _386 = _380;
    float _388 = _386;
    if (_346)
    {
        float _390 = _350 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _382 = _390;
    }
    float _392 = _382;
    float _394 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].x, _372);
    float _396 = rint(_330);
    float _398 = precise::max(_396, 0.0);
    uint _400 = uint(_398);
    uint _402 = clamp(_400, 0u, 65535u);
    float _404 = _74 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _406 = _374 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _408 = _406;
    float _410 = _392;
    if (_346)
    {
        float _412 = _378 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _408 = _412;
    }
    float _414 = _408;
    float _416 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].x, _376);
    float _418 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _394);
    float _420 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].x, _404);
    float _422 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _424 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _416);
    float _426 = _414;
    if (!_368)
    {
        float _428 = _418 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _388 = _428;
    }
    float _430 = _388;
    float _432 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _420);
    float _434 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (!_368)
    {
        float _436 = _424 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _426 = _436;
    }
    float _438 = _426;
    float _440 = 0.0 + _430;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    if (!_368)
    {
        float _444 = _432 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _410 = _444;
    }
    float _446 = _410;
    float _448 = fma(_442, _434, _438);
    float _450 = -_422;
    float _452 = fma(_442, _450, _446);
    float _454 = fma(_442, _422, _446);
    float _456 = _260 + _258;
    float3 _1619 = float3(_248, _266, float(int(_240)));
    float3 _1621 = select(_1619, float3(0.0), isnan(_1619));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1621.xy, uint(rint(_1621.z)), _246);
    float3 _1630 = float3(_256, _266, float(int(_240)));
    float3 _1632 = select(_1630, float3(0.0), isnan(_1630));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1632.xy, uint(rint(_1632.z)), _246);
    float3 _1641 = float3(_446, _448, float(int(_402)));
    float3 _1643 = select(_1641, float3(0.0), isnan(_1641));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1643.xy, uint(rint(_1643.z)), _442);
    float _464 = _456 + _262;
    float3 _1655 = float3(_452, _448, float(int(_402)));
    float3 _1657 = select(_1655, float3(0.0), isnan(_1655));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1657.xy, uint(rint(_1657.z)), _442);
    float3 _1666 = float3(_454, _438, float(int(_402)));
    float3 _1668 = select(_1666, float3(0.0), isnan(_1666));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1668.xy, uint(rint(_1668.z)), _442);
    float3 _1677 = float3(_454, _448, float(int(_402)));
    float3 _1679 = select(_1677, float3(0.0), isnan(_1677));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1679.xy, uint(rint(_1679.z)), _442);
    float _472 = _464 + _268;
    float _474 = -_434;
    float _476 = fma(_442, _474, _438);
    float _478 = _472 + _270;
    float _480 = _478 + _272;
    float _482 = _480 + _274;
    float3 _1706 = float3(_446, _438, float(int(_402)));
    float3 _1708 = select(_1706, float3(0.0), isnan(_1706));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1708.xy, uint(rint(_1708.z)), _442);
    float3 _1717 = float3(_452, _438, float(int(_402)));
    float3 _1719 = select(_1717, float3(0.0), isnan(_1717));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1719.xy, uint(rint(_1719.z)), _442);
    float3 _1728 = float3(_454, _476, float(int(_402)));
    float3 _1730 = select(_1728, float3(0.0), isnan(_1728));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1730.xy, uint(rint(_1730.z)), _442);
    float3 _1739 = float3(_446, _476, float(int(_402)));
    float3 _1741 = select(_1739, float3(0.0), isnan(_1739));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1741.xy, uint(rint(_1741.z)), _442);
    float _492 = _74 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _494 = _74 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _496 = _74 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _498 = _74 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _500 = _74 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _502 = _74 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _504 = _74 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _506 = _74 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _508 = _74 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _510 = -_74;
    float _512 = _510 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _514 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].x, _496);
    float _516 = -_66;
    float _518 = _516 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _520 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].x, _492);
    float _522 = _512 * _512;
    float _524 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].x, _494);
    float _526 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].x, _508);
    float _528 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].x, _502);
    float _530 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].x, _500);
    float _532 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].x, _504);
    float _534 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].x, _506);
    float _536 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].x, _498);
    float _538 = fma(_518, _518, _522);
    float _540 = -_64;
    float _542 = _540 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _544 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _526);
    float _546 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _528);
    float _548 = fma(_542, _542, _538);
    float _550 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _530);
    float _552 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _532);
    float _554 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _534);
    float _556 = _546 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _558 = _550 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _560 = sqrt(_548);
    float _562 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _514);
    float _564 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _524);
    float _566 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _520);
    bool _568 = _560 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _570 = _560 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _572 = !_568;
    int _574 = _572 ? 0 : 1;
    int _576 = 2;
    float _578 = _556;
    float _580 = _558;
    if (!_568)
    {
        _576 = 1;
    }
    int _582 = _576;
    int _584 = _582;
    if (!_570)
    {
        _584 = _574;
    }
    int _586 = _584;
    float _588 = float(_586);
    float _590 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _536);
    float _592 = _544 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _594 = precise::min(_588, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _596 = _594 != 1.0;
    bool _598 = isnan(_594);
    bool _600 = _596 || _598;
    bool _602 = isnan(1.0);
    bool _604 = _600 || _602;
    float _606 = _592;
    if (_604)
    {
        float _608 = _552 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _606 = _608;
    }
    float _610 = _606;
    float _612 = _610;
    if (_604)
    {
        float _614 = _554 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _578 = _614;
    }
    float _616 = _578;
    float _618 = _616;
    if (_604)
    {
        float _620 = _590 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _580 = _620;
    }
    float _622 = _580;
    bool _624 = _594 != 0.0;
    bool _626 = isnan(_594);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = rint(_594);
    float _636 = precise::max(_634, 0.0);
    uint _638 = uint(_636);
    uint _640 = clamp(_638, 0u, 65535u);
    float _642 = _622;
    if (!_632)
    {
        float _644 = _562 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _642 = _644;
    }
    float _646 = _642;
    if (!_632)
    {
        float _648 = _564 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _618 = _648;
    }
    float _650 = _618;
    if (!_632)
    {
        float _652 = _566 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _612 = _652;
    }
    float _654 = _612;
    float _656 = 0.0 + _646;
    float _658 = precise::clamp(_656, 0.0, 1.0);
    float _660 = fma(_434, _658, _650);
    float _662 = fma(_422, _658, _654);
    float3 _2064 = float3(_452, _476, float(int(_402)));
    float3 _2066 = select(_2064, float3(0.0), isnan(_2064));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2066.xy, uint(rint(_2066.z)), _442);
    float _666 = -_422;
    float _668 = fma(_666, _658, _654);
    float3 _2081 = float3(_654, _660, float(int(_640)));
    float3 _2083 = select(_2081, float3(0.0), isnan(_2081));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2083.xy, uint(rint(_2083.z)), _658);
    float3 _2092 = float3(_662, _660, float(int(_640)));
    float3 _2094 = select(_2092, float3(0.0), isnan(_2092));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2094.xy, uint(rint(_2094.z)), _658);
    float3 _2103 = float3(_668, _660, float(int(_640)));
    float3 _2105 = select(_2103, float3(0.0), isnan(_2103));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2105.xy, uint(rint(_2105.z)), _658);
    float3 _2114 = float3(_662, _650, float(int(_640)));
    float3 _2116 = select(_2114, float3(0.0), isnan(_2114));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2116.xy, uint(rint(_2116.z)), _658);
    float _678 = -_434;
    float _680 = fma(_678, _658, _650);
    float3 _2131 = float3(_654, _650, float(int(_640)));
    float3 _2133 = select(_2131, float3(0.0), isnan(_2131));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2133.xy, uint(rint(_2133.z)), _658);
    float3 _2142 = float3(_668, _650, float(int(_640)));
    float3 _2144 = select(_2142, float3(0.0), isnan(_2142));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2144.xy, uint(rint(_2144.z)), _658);
    float3 _2153 = float3(_662, _680, float(int(_640)));
    float3 _2155 = select(_2153, float3(0.0), isnan(_2153));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2155.xy, uint(rint(_2155.z)), _658);
    float3 _2164 = float3(_654, _680, float(int(_640)));
    float3 _2166 = select(_2164, float3(0.0), isnan(_2164));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2166.xy, uint(rint(_2166.z)), _658);
    float3 _2175 = float3(_668, _680, float(int(_640)));
    float3 _2177 = select(_2175, float3(0.0), isnan(_2175));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2177.xy, uint(rint(_2177.z)), _658);
    float _692 = _482 + _458;
    float _694 = _692 + _460;
    float _696 = -_64;
    float _698 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _700 = _696 + _698;
    float _702 = _470 + _462;
    float _704 = _700 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _706 = precise::clamp(_704, 0.0, 1.0);
    float _708 = _702 + _466;
    float _710 = fma(_694, 0.111111111938953399658203125, _706);
    float _712 = -_64;
    float _714 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _716 = _712 + _714;
    float _718 = _708 + _468;
    float _720 = _716 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _722 = precise::clamp(_720, 0.0, 1.0);
    float _724 = _718 + _484;
    float _726 = _724 + _486;
    float _728 = _726 + _488;
    float _730 = _728 + _490;
    float _732 = _730 + _664;
    float _734 = _672 + _670;
    float _736 = _732 * 0.111111111938953399658203125;
    float _738 = _734 + _674;
    float _740 = _738 + _676;
    float _742 = _740 + _682;
    float _744 = _742 + _684;
    float _746 = _744 + _686;
    float _748 = _746 + _688;
    float _750 = _748 + _690;
    float _752 = _750 * 0.111111111938953399658203125;
    float _754 = _752 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _756 = fma(_736, (*spvDescriptorSet0.fp_c3)._m0[49].z, _754);
    float _758 = _756 + _722;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _710;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _758;
    return out;
}

