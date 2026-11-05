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
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
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
    float2 _392 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_392, float2(0.0), isnan(_392))).x;
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
            float _118 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
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
            float _158 = _70 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _70 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _70 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _186;
            _154 = _182;
            _156 = _184;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _70 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _70 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _70 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _70 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
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
    float _230 = 1.0 / _222;
    float _232 = float(int(_93));
    float _234 = rint(_232);
    float _236 = precise::max(_234, 0.0);
    uint _238 = uint(_236);
    uint _240 = clamp(_238, 0u, 65535u);
    float _242 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _244 = _230 * _224;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _230 * _226;
    float _250 = _230 * _228;
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _254 = _246 * _242;
    float _256 = _246 * _252;
    float _258 = fma(_254, 0.5, _248);
    float _260 = fma(_254, 1.5, _248);
    float _262 = fma(_256, 1.5, _250);
    float _264 = fma(_254, -0.5, _248);
    float3 _831 = float3(_258, _262, float(int(_240)));
    float3 _835 = select(_831, float3(0.0), isnan(_831));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _835.xy, uint(rint(_835.z)), _246);
    float3 _844 = float3(_260, _262, float(int(_240)));
    float3 _846 = select(_844, float3(0.0), isnan(_844));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _846.xy, uint(rint(_846.z)), _246);
    float _270 = fma(_254, -1.5, _248);
    float3 _859 = float3(_264, _262, float(int(_240)));
    float3 _861 = select(_859, float3(0.0), isnan(_859));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _861.xy, uint(rint(_861.z)), _246);
    float _274 = fma(_256, 0.5, _250);
    float3 _873 = float3(_270, _262, float(int(_240)));
    float3 _875 = select(_873, float3(0.0), isnan(_873));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _875.xy, uint(rint(_875.z)), _246);
    float3 _884 = float3(_260, _274, float(int(_240)));
    float3 _886 = select(_884, float3(0.0), isnan(_884));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _886.xy, uint(rint(_886.z)), _246);
    float3 _895 = float3(_258, _274, float(int(_240)));
    float3 _897 = select(_895, float3(0.0), isnan(_895));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _897.xy, uint(rint(_897.z)), _246);
    float2 _903 = float2(_50, _52);
    float2 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_903, float2(0.0), isnan(_903))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_903, float2(0.0), isnan(_903))).xy;
    float _286 = _284.x;
    float _288 = _284.y;
    float3 _918 = float3(_264, _274, float(int(_240)));
    float3 _920 = select(_918, float3(0.0), isnan(_918));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _920.xy, uint(rint(_920.z)), _246);
    float _292 = fma(_256, -0.5, _250);
    float _294 = _268 + _266;
    float _296 = _294 + _272;
    float _298 = _296 + _276;
    float _300 = _298 + _278;
    float3 _944 = float3(_270, _274, float(int(_240)));
    float3 _946 = select(_944, float3(0.0), isnan(_944));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _946.xy, uint(rint(_946.z)), _246);
    float3 _955 = float3(_260, _292, float(int(_240)));
    float3 _957 = select(_955, float3(0.0), isnan(_955));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _957.xy, uint(rint(_957.z)), _246);
    float3 _966 = float3(_258, _292, float(int(_240)));
    float3 _968 = select(_966, float3(0.0), isnan(_966));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _968.xy, uint(rint(_968.z)), _246);
    float3 _977 = float3(_264, _292, float(int(_240)));
    float3 _979 = select(_977, float3(0.0), isnan(_977));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _979.xy, uint(rint(_979.z)), _246);
    float _310 = fma(_256, -1.5, _250);
    float _312 = _300 + _280;
    float _314 = fma(_288, 2.0, -1.0);
    float _316 = fma(_286, 2.0, -1.0);
    float _318 = _314 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _320 = _312 + _290;
    float _322 = _316 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _324 = fma(_318, 2.0, _52);
    float _326 = fma(_322, 2.0, _50);
    float3 _1018 = float3(_270, _292, float(int(_240)));
    float3 _1020 = select(_1018, float3(0.0), isnan(_1018));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1020.xy, uint(rint(_1020.z)), _246);
    float3 _1029 = float3(_260, _310, float(int(_240)));
    float3 _1031 = select(_1029, float3(0.0), isnan(_1029));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1031.xy, uint(rint(_1031.z)), _246);
    float3 _1040 = float3(_258, _310, float(int(_240)));
    float3 _1042 = select(_1040, float3(0.0), isnan(_1040));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1042.xy, uint(rint(_1042.z)), _246);
    float3 _1051 = float3(_264, _310, float(int(_240)));
    float3 _1053 = select(_1051, float3(0.0), isnan(_1051));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1053.xy, uint(rint(_1053.z)), _246);
    float3 _1062 = float3(_270, _310, float(int(_240)));
    float3 _1064 = select(_1062, float3(0.0), isnan(_1062));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1064.xy, uint(rint(_1064.z)), _246);
    float2 _1070 = float2(_326, _324);
    float _338 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1070, float2(0.0), isnan(_1070))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1070, float2(0.0), isnan(_1070))).x;
    float _340 = -_66;
    float _342 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _344 = _340 + _342;
    float _346 = _344 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    float _350 = _348 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _352 = _320 + _302;
    float _354 = _352 + _304;
    float _356 = _354 + _306;
    float _358 = _356 + _308;
    float _360 = _358 + _328;
    float _362 = _360 + _330;
    float _364 = -_66;
    float _366 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _368 = _364 + _366;
    float _370 = _362 + _332;
    float _372 = _368 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _370 + _334;
    float _378 = _376 + _336;
    float _380 = fma(_378, 0.0625, _374);
    out.m_43.x = _338;
    out.m_43.y = _380;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _350;
    return out;
}

