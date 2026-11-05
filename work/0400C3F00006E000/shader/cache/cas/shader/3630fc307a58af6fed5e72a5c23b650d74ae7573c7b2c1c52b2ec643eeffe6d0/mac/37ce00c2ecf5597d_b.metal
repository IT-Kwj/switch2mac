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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _389 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_389, float2(0.0), isnan(_389)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _407 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_407, float2(0.0), isnan(_407))).x;
    float2 _415 = float2(_52, _54);
    float2 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_415, float2(0.0), isnan(_415))).xy;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = in.m_38.y;
    float _78 = in.m_38.x;
    float _80 = in.m_40.y;
    float _82 = in.m_42.y;
    float _84 = in.m_40.x;
    float _86 = in.m_42.x;
    float _88 = -_60;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_62;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = -_64;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = 1.0 / _90;
    float _102 = 1.0 / _94;
    float _104 = 1.0 / _98;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _100 * _106;
    float _110 = _76 * _108;
    float _112 = _78 * _108;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _116 = _102 * _114;
    float _118 = -_110;
    float _120 = fma(_116, _80, _118);
    float _122 = -_112;
    float _124 = fma(_116, _84, _122);
    float _126 = -_108;
    float _128 = _126 + _116;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = _104 * _130;
    float _134 = _120 * _120;
    float _136 = -_110;
    float _138 = fma(_132, _82, _136);
    float _140 = -_112;
    float _142 = fma(_132, _86, _140);
    float _144 = fma(_124, _124, _134);
    float _146 = -_108;
    float _148 = _146 + _132;
    float _150 = _138 * _138;
    float _152 = -_66;
    float _154 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _156 = fma(_128, _128, _144);
    float _158 = fma(_142, _142, _150);
    float _160 = 1.0 / _154;
    float _162 = fma(_148, _148, _158);
    float _164 = rsqrt(_156);
    float _166 = rsqrt(_162);
    float _168 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _170 = _160 * _168;
    float _172 = _124 * _164;
    float _174 = _128 * _164;
    float _176 = _120 * _164;
    float _178 = _148 * _166;
    float _180 = _138 * _166;
    float _182 = _142 * _166;
    float _184 = _172 * _178;
    float _186 = _174 * _180;
    float _188 = -_184;
    float _190 = fma(_174, _182, _188);
    float _192 = -_186;
    float _194 = fma(_176, _178, _192);
    float _196 = _176 * _182;
    float _198 = _190 * _190;
    float _200 = -_196;
    float _202 = fma(_172, _180, _200);
    float _204 = fma(_194, _194, _198);
    float _206 = fma(_202, _202, _204);
    float _208 = rsqrt(_206);
    float _210 = _190 * _208;
    float _212 = _194 * _208;
    float _214 = _202 * _208;
    float _216 = _210 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _218 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].x, _216);
    float _220 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[35].z, _218);
    float _222 = abs(_220);
    float _224 = -_222;
    float _226 = _224 + 1.0;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = abs(_228);
    float _232 = log2(_230);
    float _234 = _232 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _236 = exp2(_234);
    float _238 = _236 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _240 = _210 * _238;
    float _242 = _212 * _238;
    float _244 = fma(_214, _238, _170);
    float _246 = fma(_72, 2.0, -1.0);
    float _248 = fma(_170, _76, _240);
    float _250 = fma(_170, _78, _242);
    float _252 = _248 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _254 = _248 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _256 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[3].x, _252);
    float _258 = _248 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _260 = _248 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _262 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[1].x, _254);
    float _264 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].z, _256);
    float _266 = _246 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _268 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].z, _262);
    float _270 = _264 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _272 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].x, _258);
    float _274 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[2].x, _260);
    float _276 = fma(_74, 2.0, -1.0);
    float _278 = _268 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _280 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].z, _272);
    float _282 = 1.0 / _270;
    float _284 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].z, _274);
    float _286 = _276 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _288 = _280 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _290 = fma(_266, 2.0, _52);
    float _292 = _284 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _294 = fma(_286, 2.0, _54);
    float _296 = _288 * _282;
    float _298 = _278 * _282;
    float _300 = _292 * _282;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    float _304 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _306 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _308 = fma(_302, _304, _296);
    float _310 = -_304;
    float _312 = fma(_302, _310, _296);
    float _314 = fma(_302, _306, _298);
    float _316 = -_306;
    float _318 = fma(_302, _316, _298);
    float3 _829 = float3(_308, _314, float(0));
    float3 _833 = select(_829, float3(0.0), isnan(_829));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _833.xy, uint(rint(_833.z)), _302);
    float3 _840 = float3(_296, _314, float(0));
    float3 _842 = select(_840, float3(0.0), isnan(_840));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _842.xy, uint(rint(_842.z)), _302);
    float3 _849 = float3(_312, _314, float(0));
    float3 _851 = select(_849, float3(0.0), isnan(_849));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _851.xy, uint(rint(_851.z)), _302);
    float3 _858 = float3(_308, _298, float(0));
    float3 _860 = select(_858, float3(0.0), isnan(_858));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _860.xy, uint(rint(_860.z)), _302);
    float3 _867 = float3(_296, _298, float(0));
    float3 _869 = select(_867, float3(0.0), isnan(_867));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _869.xy, uint(rint(_869.z)), _302);
    float3 _876 = float3(_312, _298, float(0));
    float3 _878 = select(_876, float3(0.0), isnan(_876));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _878.xy, uint(rint(_878.z)), _302);
    float3 _885 = float3(_308, _318, float(0));
    float3 _887 = select(_885, float3(0.0), isnan(_885));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _887.xy, uint(rint(_887.z)), _302);
    float3 _894 = float3(_296, _318, float(0));
    float3 _896 = select(_894, float3(0.0), isnan(_894));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _896.xy, uint(rint(_896.z)), _302);
    float3 _903 = float3(_312, _318, float(0));
    float3 _905 = select(_903, float3(0.0), isnan(_903));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _905.xy, uint(rint(_905.z)), _302);
    float2 _911 = float2(_290, _294);
    float _338 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_911, float2(0.0), isnan(_911))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_911, float2(0.0), isnan(_911))).x;
    float _340 = -_170;
    float _342 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _344 = _340 + _342;
    float _346 = _344 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    float _350 = _320 + _322;
    float _352 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[48].w, _348);
    float _354 = -_170;
    float _356 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _358 = _354 + _356;
    float _360 = _350 + _324;
    float _362 = _358 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _360 + _326;
    float _368 = _366 + _328;
    float _370 = _368 + _330;
    float _372 = _370 + _332;
    float _374 = _372 + _334;
    float _376 = _374 + _336;
    float _378 = fma(_376, 0.111111111938953399658203125, _364);
    out.m_45.x = _338;
    out.m_45.y = _378;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _352;
    return out;
}

