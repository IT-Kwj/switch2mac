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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_34 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _393 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _411 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_38.y;
    float _70 = in.m_36.x;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _82 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].z, _80);
    float _84 = -_60;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = _66 * _82;
    float _92 = _70 * _82;
    float _94 = -_90;
    float _96 = fma(_88, _68, _94);
    float _98 = -_62;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = -_92;
    float _106 = fma(_88, _74, _104);
    float _108 = -_82;
    float _110 = _108 + _88;
    float _112 = _96 * _96;
    float _114 = -_90;
    float _116 = fma(_102, _72, _114);
    float _118 = -_92;
    float _120 = fma(_102, _76, _118);
    float _122 = -_82;
    float _124 = _122 + _102;
    float _126 = fma(_106, _106, _112);
    float _128 = _116 * _116;
    float _130 = fma(_110, _110, _126);
    float _132 = fma(_120, _120, _128);
    float _134 = fma(_124, _124, _132);
    float _136 = rsqrt(_130);
    float _138 = rsqrt(_134);
    float _140 = _106 * _136;
    float _142 = _110 * _136;
    float _144 = _96 * _136;
    float _146 = _124 * _138;
    float _148 = _120 * _138;
    float _150 = _116 * _138;
    float _152 = _140 * _146;
    float _154 = _144 * _148;
    float _156 = _142 * _150;
    float _158 = -_152;
    float _160 = fma(_142, _148, _158);
    float _162 = -_154;
    float _164 = fma(_140, _150, _162);
    float _166 = -_156;
    float _168 = fma(_144, _146, _166);
    float _170 = _160 * _160;
    float _172 = fma(_168, _168, _170);
    float _174 = fma(_164, _164, _172);
    float _176 = rsqrt(_174);
    float _178 = _160 * _176;
    float _180 = _168 * _176;
    float _182 = _164 * _176;
    float _184 = _178 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _186 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[35].x, _184);
    float _188 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[35].z, _186);
    float _190 = abs(_188);
    float _192 = -_190;
    float _194 = _192 + 1.0;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = abs(_196);
    float _200 = log2(_198);
    float _202 = _200 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _204 = exp2(_202);
    float _206 = -_64;
    float _208 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _210 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[46].z, _208);
    float _212 = _204 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _214 = _178 * _212;
    float _216 = _180 * _212;
    float _218 = fma(_182, _212, _210);
    float _220 = fma(_210, _66, _214);
    float _222 = fma(_210, _70, _216);
    float _224 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _226 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[3].x, _224);
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _230 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[3].z, _226);
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _234 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[2].x, _228);
    float _236 = _220 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _238 = _220 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _240 = 1.0 / _232;
    float _242 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[2].z, _234);
    float _244 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[0].x, _236);
    float _246 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[1].x, _238);
    float _248 = _242 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _250 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[0].z, _244);
    float _252 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[1].z, _246);
    float _254 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _256 = _250 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _258 = _252 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _260 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _262 = _248 * _240;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _256 * _240;
    float _268 = _258 * _240;
    float _270 = rint(_264);
    float _272 = precise::max(_270, 0.0);
    uint _275 = uint(_272);
    uint _277 = clamp(_275, 0u, 65535u);
    float _279 = fma(_254, 0.5, _266);
    float _281 = fma(_260, 1.5, _268);
    float _283 = fma(_254, -0.5, _266);
    float _285 = fma(_254, 1.5, _266);
    float _287 = fma(_254, -1.5, _266);
    float _289 = fma(_260, 0.5, _268);
    float _291 = fma(_260, -0.5, _268);
    float3 _801 = float3(_279, _281, float(int(_277)));
    float3 _805 = select(_801, float3(0.0), isnan(_801));
    float _293 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _805.xy, uint(rint(_805.z)), 1.0);
    float3 _813 = float3(_283, _281, float(int(_277)));
    float3 _815 = select(_813, float3(0.0), isnan(_813));
    float _295 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _815.xy, uint(rint(_815.z)), 1.0);
    float3 _823 = float3(_285, _281, float(int(_277)));
    float3 _825 = select(_823, float3(0.0), isnan(_823));
    float _297 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _825.xy, uint(rint(_825.z)), 1.0);
    float3 _833 = float3(_287, _281, float(int(_277)));
    float3 _835 = select(_833, float3(0.0), isnan(_833));
    float _299 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _835.xy, uint(rint(_835.z)), 1.0);
    float3 _843 = float3(_285, _289, float(int(_277)));
    float3 _845 = select(_843, float3(0.0), isnan(_843));
    float _301 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _845.xy, uint(rint(_845.z)), 1.0);
    float3 _853 = float3(_279, _289, float(int(_277)));
    float3 _855 = select(_853, float3(0.0), isnan(_853));
    float _303 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _855.xy, uint(rint(_855.z)), 1.0);
    float3 _863 = float3(_283, _289, float(int(_277)));
    float3 _865 = select(_863, float3(0.0), isnan(_863));
    float _305 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _865.xy, uint(rint(_865.z)), 1.0);
    float3 _873 = float3(_287, _289, float(int(_277)));
    float3 _875 = select(_873, float3(0.0), isnan(_873));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _875.xy, uint(rint(_875.z)), 1.0);
    float3 _883 = float3(_285, _291, float(int(_277)));
    float3 _885 = select(_883, float3(0.0), isnan(_883));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _885.xy, uint(rint(_885.z)), 1.0);
    float3 _893 = float3(_279, _291, float(int(_277)));
    float3 _895 = select(_893, float3(0.0), isnan(_893));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _895.xy, uint(rint(_895.z)), 1.0);
    float3 _903 = float3(_283, _291, float(int(_277)));
    float3 _905 = select(_903, float3(0.0), isnan(_903));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _905.xy, uint(rint(_905.z)), 1.0);
    float _315 = fma(_260, -1.5, _268);
    float3 _916 = float3(_287, _291, float(int(_277)));
    float3 _918 = select(_916, float3(0.0), isnan(_916));
    float _317 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _918.xy, uint(rint(_918.z)), 1.0);
    float3 _926 = float3(_285, _315, float(int(_277)));
    float3 _928 = select(_926, float3(0.0), isnan(_926));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _928.xy, uint(rint(_928.z)), 1.0);
    float3 _936 = float3(_279, _315, float(int(_277)));
    float3 _938 = select(_936, float3(0.0), isnan(_936));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _938.xy, uint(rint(_938.z)), 1.0);
    float3 _946 = float3(_283, _315, float(int(_277)));
    float3 _948 = select(_946, float3(0.0), isnan(_946));
    float _323 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _948.xy, uint(rint(_948.z)), 1.0);
    float3 _956 = float3(_287, _315, float(int(_277)));
    float3 _958 = select(_956, float3(0.0), isnan(_956));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _958.xy, uint(rint(_958.z)), 1.0);
    float2 _963 = float2(_50, _52);
    float _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_963, float2(0.0), isnan(_963))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_963, float2(0.0), isnan(_963))).x;
    float _329 = -_210;
    float _331 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _333 = _329 + _331;
    float _335 = -_210;
    float _337 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _339 = _335 + _337;
    float _341 = _333 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = _339 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = _297 + _293;
    float _351 = _349 + _295;
    float _353 = _351 + _299;
    float _355 = _353 + _301;
    float _357 = _355 + _303;
    float _359 = _357 + _305;
    float _361 = _359 + _307;
    float _363 = _361 + _309;
    float _365 = _363 + _311;
    float _367 = _365 + _313;
    float _369 = _367 + _317;
    float _371 = _369 + _319;
    float _373 = _371 + _321;
    float _375 = _373 + _323;
    float _377 = _375 + _325;
    float _379 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[48].w, _343);
    float _381 = fma(_377, 0.0625, _347);
    out.m_43.x = _327;
    out.m_43.y = _381;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _379;
    return out;
}

