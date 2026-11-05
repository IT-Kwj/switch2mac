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
    float2 _409 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_409, float2(0.0), isnan(_409)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _427 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_36.x;
    float _70 = in.m_38.y;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _82 = -_60;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_62;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = 1.0 / _80;
    float _92 = 1.0 / _84;
    float _94 = 1.0 / _88;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = _90 * _96;
    float _100 = _66 * _98;
    float _102 = _68 * _98;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = _92 * _104;
    float _108 = -_100;
    float _110 = fma(_106, _70, _108);
    float _112 = -_102;
    float _114 = fma(_106, _74, _112);
    float _116 = -_98;
    float _118 = _116 + _106;
    float _120 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _122 = _94 * _120;
    float _124 = _110 * _110;
    float _126 = -_100;
    float _128 = fma(_122, _72, _126);
    float _130 = -_102;
    float _132 = fma(_122, _76, _130);
    float _134 = fma(_114, _114, _124);
    float _136 = -_98;
    float _138 = _136 + _122;
    float _140 = _128 * _128;
    float _142 = fma(_118, _118, _134);
    float _144 = fma(_132, _132, _140);
    float _146 = fma(_138, _138, _144);
    float _148 = rsqrt(_142);
    float _150 = rsqrt(_146);
    float _152 = _114 * _148;
    float _154 = _118 * _148;
    float _156 = _110 * _148;
    float _158 = _138 * _150;
    float _160 = _128 * _150;
    float _162 = _132 * _150;
    float _164 = _152 * _158;
    float _166 = _154 * _160;
    float _168 = -_164;
    float _170 = fma(_154, _162, _168);
    float _172 = -_166;
    float _174 = fma(_156, _158, _172);
    float _176 = _156 * _162;
    float _178 = -_64;
    float _180 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _182 = _170 * _170;
    float _184 = -_176;
    float _186 = fma(_152, _160, _184);
    float _188 = fma(_174, _174, _182);
    float _190 = fma(_186, _186, _188);
    float _192 = rsqrt(_190);
    float _194 = _170 * _192;
    float _196 = _174 * _192;
    float _198 = _186 * _192;
    float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _202 = 1.0 / _180;
    float _204 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[35].x, _200);
    float _206 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[35].z, _204);
    float _208 = abs(_206);
    float _210 = -_208;
    float _212 = _210 + 1.0;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _218 = _202 * _216;
    float _220 = abs(_214);
    float _222 = log2(_220);
    float _224 = _222 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _226 = exp2(_224);
    float _228 = _226 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _230 = _194 * _228;
    float _232 = _196 * _228;
    float _234 = fma(_198, _228, _218);
    float _236 = fma(_218, _66, _230);
    float _238 = fma(_218, _68, _232);
    float _240 = _236 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _242 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[3].x, _240);
    float _244 = _236 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _246 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[3].z, _242);
    float _248 = _246 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _250 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[2].x, _244);
    float _252 = _236 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _254 = _236 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _256 = 1.0 / _248;
    float _258 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[2].z, _250);
    float _260 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].x, _252);
    float _262 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[1].x, _254);
    float _264 = _258 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _266 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[0].z, _260);
    float _268 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[1].z, _262);
    float _270 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _272 = _266 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _274 = _268 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _276 = _264 * _256;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _272 * _256;
    float _282 = _274 * _256;
    float _284 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _286 = rint(_278);
    float _288 = precise::max(_286, 0.0);
    uint _291 = uint(_288);
    uint _293 = clamp(_291, 0u, 65535u);
    float _295 = fma(_270, 0.5, _280);
    float _297 = fma(_270, -0.5, _280);
    float _299 = fma(_284, 1.5, _282);
    float _301 = fma(_270, 1.5, _280);
    float _303 = fma(_270, -1.5, _280);
    float _305 = fma(_284, 0.5, _282);
    float _307 = fma(_284, -0.5, _282);
    float3 _833 = float3(_295, _299, float(int(_293)));
    float3 _837 = select(_833, float3(0.0), isnan(_833));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _837.xy, uint(rint(_837.z)), 1.0);
    float3 _845 = float3(_297, _299, float(int(_293)));
    float3 _847 = select(_845, float3(0.0), isnan(_845));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _847.xy, uint(rint(_847.z)), 1.0);
    float3 _855 = float3(_301, _299, float(int(_293)));
    float3 _857 = select(_855, float3(0.0), isnan(_855));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _857.xy, uint(rint(_857.z)), 1.0);
    float3 _865 = float3(_303, _299, float(int(_293)));
    float3 _867 = select(_865, float3(0.0), isnan(_865));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _867.xy, uint(rint(_867.z)), 1.0);
    float3 _875 = float3(_301, _305, float(int(_293)));
    float3 _877 = select(_875, float3(0.0), isnan(_875));
    float _317 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _877.xy, uint(rint(_877.z)), 1.0);
    float3 _885 = float3(_295, _305, float(int(_293)));
    float3 _887 = select(_885, float3(0.0), isnan(_885));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _887.xy, uint(rint(_887.z)), 1.0);
    float3 _895 = float3(_297, _305, float(int(_293)));
    float3 _897 = select(_895, float3(0.0), isnan(_895));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _897.xy, uint(rint(_897.z)), 1.0);
    float3 _905 = float3(_303, _305, float(int(_293)));
    float3 _907 = select(_905, float3(0.0), isnan(_905));
    float _323 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _907.xy, uint(rint(_907.z)), 1.0);
    float3 _915 = float3(_301, _307, float(int(_293)));
    float3 _917 = select(_915, float3(0.0), isnan(_915));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _917.xy, uint(rint(_917.z)), 1.0);
    float3 _925 = float3(_295, _307, float(int(_293)));
    float3 _927 = select(_925, float3(0.0), isnan(_925));
    float _327 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _927.xy, uint(rint(_927.z)), 1.0);
    float3 _935 = float3(_297, _307, float(int(_293)));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _937.xy, uint(rint(_937.z)), 1.0);
    float _331 = fma(_284, -1.5, _282);
    float3 _948 = float3(_303, _307, float(int(_293)));
    float3 _950 = select(_948, float3(0.0), isnan(_948));
    float _333 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _950.xy, uint(rint(_950.z)), 1.0);
    float3 _958 = float3(_301, _331, float(int(_293)));
    float3 _960 = select(_958, float3(0.0), isnan(_958));
    float _335 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _960.xy, uint(rint(_960.z)), 1.0);
    float3 _968 = float3(_295, _331, float(int(_293)));
    float3 _970 = select(_968, float3(0.0), isnan(_968));
    float _337 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _970.xy, uint(rint(_970.z)), 1.0);
    float3 _978 = float3(_297, _331, float(int(_293)));
    float3 _980 = select(_978, float3(0.0), isnan(_978));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _980.xy, uint(rint(_980.z)), 1.0);
    float3 _988 = float3(_303, _331, float(int(_293)));
    float3 _990 = select(_988, float3(0.0), isnan(_988));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _990.xy, uint(rint(_990.z)), 1.0);
    float2 _995 = float2(_50, _52);
    float _343 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_995, float2(0.0), isnan(_995))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_995, float2(0.0), isnan(_995))).x;
    float _345 = -_218;
    float _347 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _349 = _345 + _347;
    float _351 = -_218;
    float _353 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _355 = _351 + _353;
    float _357 = _349 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = _355 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = _313 + _309;
    float _367 = _365 + _311;
    float _369 = _367 + _315;
    float _371 = _369 + _317;
    float _373 = _371 + _319;
    float _375 = _373 + _321;
    float _377 = _375 + _323;
    float _379 = _377 + _325;
    float _381 = _379 + _327;
    float _383 = _381 + _329;
    float _385 = _383 + _333;
    float _387 = _385 + _335;
    float _389 = _387 + _337;
    float _391 = _389 + _339;
    float _393 = _391 + _341;
    float _395 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[48].w, _359);
    float _397 = fma(_393, 0.0625, _363);
    out.m_43.x = _343;
    out.m_43.y = _397;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _395;
    return out;
}

