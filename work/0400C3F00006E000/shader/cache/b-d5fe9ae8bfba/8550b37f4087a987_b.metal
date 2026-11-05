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
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
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
    bool _116 = false;
    bool _114 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _356 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_356, float2(0.0), isnan(_356))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_356, float2(0.0), isnan(_356))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = in.m_40.x;
    float _70 = _66 * _56;
    float _72 = -_66;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _82 = !_76;
    uint _85 = uint(_82 ? 0 : 1);
    uint _87 = 2u;
    if (!_76)
    {
        _87 = 1u;
    }
    uint _89 = _87;
    uint _91 = _89;
    if (!_80)
    {
        _91 = _85;
    }
    uint _93 = _91;
    uint _95 = min(_93, 2u);
    int _98 = int(_95) << 2;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    float _108 = _66 * _68;
    bool _110 = as_type<int>(_106) == 368;
    if (!_110)
    {
        bool _112 = as_type<int>(_106) == 640;
        _114 = _112;
        if (!_114)
        {
            _116 = true;
        }
    }
    float _150;
    float _152;
    float _154;
    float _156;
    if (!_114)
    {
        if (!_116)
        {
            float _118 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _146;
            _154 = _142;
            _156 = _144;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _70 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _70 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _70 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _186;
            _154 = _182;
            _156 = _184;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _70 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _70 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _70 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _70 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _218;
            _154 = _214;
            _156 = _216;
        }
    }
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float2 _732 = float2(_50, _52);
    float2 _232 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_732, float2(0.0), isnan(_732))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_732, float2(0.0), isnan(_732))).xy;
    float _234 = _232.x;
    float _236 = _232.y;
    float _238 = float(int(_93));
    float _240 = 1.0 / _222;
    float _242 = rint(_238);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = _240 * _224;
    float _252 = _240 * _226;
    float _254 = _240 * _228;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _260 = fma(_256, _258, _250);
    float _262 = fma(_234, 2.0, -1.0);
    float _264 = fma(_236, 2.0, -1.0);
    float _266 = _262 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _268 = _264 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _270 = -_258;
    float _272 = fma(_256, _270, _250);
    float _274 = fma(_266, 2.0, _50);
    float _276 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _278 = fma(_268, 2.0, _52);
    float _280 = fma(_256, _276, _252);
    float _282 = -_276;
    float _284 = fma(_256, _282, _252);
    float3 _827 = float3(_250, _280, float(int(_248)));
    float3 _831 = select(_827, float3(0.0), isnan(_827));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _831.xy, uint(rint(_831.z)), _256);
    float3 _840 = float3(_260, _280, float(int(_248)));
    float3 _842 = select(_840, float3(0.0), isnan(_840));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _842.xy, uint(rint(_842.z)), _256);
    float3 _851 = float3(_272, _280, float(int(_248)));
    float3 _853 = select(_851, float3(0.0), isnan(_851));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _853.xy, uint(rint(_853.z)), _256);
    float3 _862 = float3(_260, _252, float(int(_248)));
    float3 _864 = select(_862, float3(0.0), isnan(_862));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _864.xy, uint(rint(_864.z)), _256);
    float3 _873 = float3(_250, _252, float(int(_248)));
    float3 _875 = select(_873, float3(0.0), isnan(_873));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _875.xy, uint(rint(_875.z)), _256);
    float3 _884 = float3(_272, _252, float(int(_248)));
    float3 _886 = select(_884, float3(0.0), isnan(_884));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _886.xy, uint(rint(_886.z)), _256);
    float3 _895 = float3(_260, _284, float(int(_248)));
    float3 _897 = select(_895, float3(0.0), isnan(_895));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _897.xy, uint(rint(_897.z)), _256);
    float3 _906 = float3(_250, _284, float(int(_248)));
    float3 _908 = select(_906, float3(0.0), isnan(_906));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _908.xy, uint(rint(_908.z)), _256);
    float3 _917 = float3(_272, _284, float(int(_248)));
    float3 _919 = select(_917, float3(0.0), isnan(_917));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _919.xy, uint(rint(_919.z)), _256);
    float2 _925 = float2(_274, _278);
    float _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_925, float2(0.0), isnan(_925))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_925, float2(0.0), isnan(_925))).x;
    float _306 = -_66;
    float _308 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _310 = _306 + _308;
    float _312 = -_66;
    float _314 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _316 = _312 + _314;
    float _318 = _310 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = _316 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _328 = _288 + _286;
    float _330 = _328 + _290;
    float _332 = _330 + _292;
    float _334 = _332 + _294;
    float _336 = _334 + _296;
    float _338 = _336 + _298;
    float _340 = _338 + _300;
    float _342 = _340 + _302;
    float _344 = fma(_342, 0.111111111938953399658203125, _320);
    out.m_43.x = _304;
    out.m_43.y = _344;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _326;
    return out;
}

