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
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
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
    float2 _436 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_436, float2(0.0), isnan(_436))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_436, float2(0.0), isnan(_436))).x;
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
            float _130 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _132 = _80 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _134 = _80 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _136 = _80 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _138 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _130);
            float _140 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _132);
            float _142 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _134);
            float _144 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _136);
            float _146 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _138);
            float _148 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _140);
            float _150 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _142);
            float _152 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _144);
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _162 = _160;
            _164 = _154;
            _166 = _158;
            _168 = _156;
        }
    }
    if ((false || _128) || _126)
    {
        if ((!_128) || _126)
        {
            _126 = false;
            float _170 = _80 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _172 = _80 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _174 = _80 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _176 = _80 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _178 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, _170);
            float _180 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[5].x, _172);
            float _182 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[6].x, _174);
            float _184 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[7].x, _176);
            float _186 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _178);
            float _188 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _180);
            float _190 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _182);
            float _192 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _184);
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _162 = _200;
            _164 = _194;
            _166 = _198;
            _168 = _196;
        }
        if (false || _128)
        {
            _128 = false;
            float _202 = _80 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _204 = _80 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _206 = _80 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _208 = _80 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _210 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[8].x, _202);
            float _212 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[9].x, _204);
            float _214 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[10].x, _206);
            float _216 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].x, _208);
            float _218 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _210);
            float _220 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _212);
            float _222 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _214);
            float _224 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _216);
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _162 = _232;
            _164 = _226;
            _166 = _230;
            _168 = _228;
        }
    }
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float2 _828 = float2(_52, _54);
    float2 _244 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_828, float2(0.0), isnan(_828))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_828, float2(0.0), isnan(_828))).xy;
    float _246 = _244.x;
    float _248 = _244.y;
    float _250 = _80 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _252 = float(int(_108));
    float _254 = 1.0 / _234;
    float _256 = _80 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _258 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].x, _250);
    float _260 = _80 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _262 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].x, _256);
    float _264 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].z, _258);
    float _266 = rint(_252);
    float _268 = precise::max(_266, 0.0);
    uint _270 = uint(_268);
    uint _272 = clamp(_270, 0u, 65535u);
    float _274 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].z, _262);
    float _276 = _264 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _278 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].x, _260);
    float _280 = _274 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _282 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].z, _278);
    float _284 = 1.0 / _276;
    float _286 = _254 * _236;
    float _288 = _254 * _238;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = _282 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _294 = _254 * _240;
    float _296 = _292 * _284;
    float _298 = _280 * _284;
    float _300 = fma(_248, 2.0, -1.0);
    float _302 = fma(_246, 2.0, -1.0);
    float _304 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _306 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _308 = _300 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _310 = _302 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _312 = fma(_290, _304, _286);
    float _314 = -_306;
    float _316 = fma(_290, _314, _294);
    float _318 = fma(_308, 2.0, _54);
    float _320 = fma(_310, 2.0, _52);
    float _322 = -_304;
    float _324 = fma(_290, _322, _286);
    float _326 = fma(_290, _306, _294);
    float3 _988 = float3(_286, _326, float(int(_272)));
    float3 _992 = select(_988, float3(0.0), isnan(_988));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _992.xy, uint(rint(_992.z)), _290);
    float3 _1001 = float3(_312, _326, float(int(_272)));
    float3 _1003 = select(_1001, float3(0.0), isnan(_1001));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1003.xy, uint(rint(_1003.z)), _290);
    float3 _1012 = float3(_324, _326, float(int(_272)));
    float3 _1014 = select(_1012, float3(0.0), isnan(_1012));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1014.xy, uint(rint(_1014.z)), _290);
    float3 _1023 = float3(_312, _294, float(int(_272)));
    float3 _1025 = select(_1023, float3(0.0), isnan(_1023));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1025.xy, uint(rint(_1025.z)), _290);
    float3 _1034 = float3(_286, _294, float(int(_272)));
    float3 _1036 = select(_1034, float3(0.0), isnan(_1034));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1036.xy, uint(rint(_1036.z)), _290);
    float2 _1042 = float2(_296, _298);
    float2 _338 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1042, float2(0.0), isnan(_1042))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1042, float2(0.0), isnan(_1042))).xy;
    float _340 = _338.x;
    float _342 = _338.y;
    float3 _1057 = float3(_324, _294, float(int(_272)));
    float3 _1059 = select(_1057, float3(0.0), isnan(_1057));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1059.xy, uint(rint(_1059.z)), _290);
    float3 _1068 = float3(_312, _316, float(int(_272)));
    float3 _1070 = select(_1068, float3(0.0), isnan(_1068));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1070.xy, uint(rint(_1070.z)), _290);
    float3 _1079 = float3(_286, _316, float(int(_272)));
    float3 _1081 = select(_1079, float3(0.0), isnan(_1079));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1081.xy, uint(rint(_1081.z)), _290);
    float3 _1090 = float3(_324, _316, float(int(_272)));
    float3 _1092 = select(_1090, float3(0.0), isnan(_1090));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1092.xy, uint(rint(_1092.z)), _290);
    float2 _1098 = float2(_320, _318);
    float _352 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1098, float2(0.0), isnan(_1098))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1098, float2(0.0), isnan(_1098))).x;
    float _354 = _80 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _356 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].x, _354);
    float _358 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].z, _356);
    float _360 = _358 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _362 = precise::min(_360, 1.0);
    float _364 = -_70;
    float _366 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _368 = _364 + _366;
    float _370 = _368 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _372 = precise::clamp(_370, 0.0, 1.0);
    float _374 = _330 + _328;
    float _376 = _374 + _332;
    float _378 = -_340;
    float _380 = fma(_378, _340, _342);
    float _382 = -_340;
    float _384 = _362 + _382;
    float _386 = _376 + _334;
    float _388 = fma(_384, _384, _380);
    float _390 = _386 + _336;
    bool _392 = _384 <= 0.001000000047497451305389404296875;
    float _394 = float(_392);
    float _396 = 1.0 / _388;
    float _398 = _390 + _344;
    float _400 = _398 + _346;
    float _402 = _400 + _348;
    float _404 = _402 + _350;
    float _406 = _380 * _396;
    float _408 = -_70;
    float _410 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _412 = _408 + _410;
    float _414 = precise::max(_406, _394);
    float _416 = _412 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = precise::min(_414, 1.0);
    float _422 = fma(_404, 0.111111111938953399658203125, _418);
    float _424 = _420 + _372;
    out.m_45.x = _352;
    out.m_45.y = _422;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _424;
    return out;
}

