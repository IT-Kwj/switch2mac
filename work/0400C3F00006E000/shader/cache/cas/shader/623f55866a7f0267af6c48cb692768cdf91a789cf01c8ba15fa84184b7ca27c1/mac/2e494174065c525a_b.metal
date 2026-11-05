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
    float2 _351 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_351, float2(0.0), isnan(_351)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _369 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_369, float2(0.0), isnan(_369))).x;
    float2 _377 = float2(_52, _54);
    float2 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_377, float2(0.0), isnan(_377))).xy;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = in.m_38.y;
    float _78 = in.m_38.x;
    float _80 = in.m_40.y;
    float _82 = in.m_42.y;
    float _84 = in.m_40.x;
    float _86 = in.m_42.x;
    float _88 = -_60;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_62;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = -_64;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = _76 * _92;
    float _108 = _78 * _92;
    float _110 = -_106;
    float _112 = fma(_98, _80, _110);
    float _114 = -_106;
    float _116 = fma(_104, _82, _114);
    float _118 = -_108;
    float _120 = fma(_98, _84, _118);
    float _122 = -_108;
    float _124 = fma(_104, _86, _122);
    float _126 = _112 * _112;
    float _128 = _116 * _116;
    float _130 = -_92;
    float _132 = _130 + _98;
    float _134 = -_92;
    float _136 = _134 + _104;
    float _138 = fma(_120, _120, _126);
    float _140 = fma(_124, _124, _128);
    float _142 = fma(_132, _132, _138);
    float _144 = fma(_136, _136, _140);
    float _146 = rsqrt(_142);
    float _148 = rsqrt(_144);
    float _150 = _120 * _146;
    float _152 = _132 * _146;
    float _154 = _112 * _146;
    float _156 = _136 * _148;
    float _158 = _116 * _148;
    float _160 = _124 * _148;
    float _162 = _150 * _156;
    float _164 = _152 * _158;
    float _166 = -_162;
    float _168 = fma(_152, _160, _166);
    float _170 = _154 * _160;
    float _172 = -_164;
    float _174 = fma(_154, _156, _172);
    float _176 = _168 * _168;
    float _178 = -_170;
    float _180 = fma(_150, _158, _178);
    float _182 = fma(_174, _174, _176);
    float _184 = fma(_180, _180, _182);
    float _186 = rsqrt(_184);
    float _188 = _168 * _186;
    float _190 = _174 * _186;
    float _192 = _180 * _186;
    float _194 = _188 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _196 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[35].x, _194);
    float _198 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].z, _196);
    float _200 = abs(_198);
    float _202 = -_200;
    float _204 = _202 + 1.0;
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = abs(_206);
    float _210 = log2(_208);
    float _212 = _210 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _214 = exp2(_212);
    float _216 = -_66;
    float _218 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _220 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[46].z, _218);
    float _222 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _224 = _188 * _222;
    float _226 = _190 * _222;
    float _228 = fma(_192, _222, _220);
    float _230 = fma(_220, _76, _224);
    float _232 = fma(_220, _78, _226);
    float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _238 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[3].x, _234);
    float _240 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[1].x, _236);
    float _242 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[3].z, _238);
    float _244 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _240);
    float _246 = _242 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _248 = _230 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _250 = _244 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _252 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[2].x, _248);
    float _254 = 1.0 / _246;
    float _256 = _230 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _258 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[2].z, _252);
    float _260 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[0].x, _256);
    float _262 = _258 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _264 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].z, _260);
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _268 = _262 * _254;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = _266 * _254;
    float _274 = _250 * _254;
    float _276 = _270 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _278 = fma(_72, 2.0, -1.0);
    float _280 = fma(_74, 2.0, -1.0);
    float _282 = _276 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _284 = _276 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _286 = _280 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _288 = _278 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _290 = fma(_282, 0.5, _272);
    float _292 = fma(_282, -0.5, _272);
    float _294 = fma(_284, 0.5, _274);
    float _296 = fma(_284, -0.5, _274);
    float _298 = fma(_286, 2.0, _54);
    float _300 = fma(_288, 2.0, _52);
    float3 _771 = float3(_290, _294, float(0));
    float3 _775 = select(_771, float3(0.0), isnan(_771));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _775.xy, uint(rint(_775.z)), _270);
    float3 _782 = float3(_292, _294, float(0));
    float3 _784 = select(_782, float3(0.0), isnan(_782));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _784.xy, uint(rint(_784.z)), _270);
    float3 _791 = float3(_290, _296, float(0));
    float3 _793 = select(_791, float3(0.0), isnan(_791));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _793.xy, uint(rint(_793.z)), _270);
    float3 _800 = float3(_292, _296, float(0));
    float3 _802 = select(_800, float3(0.0), isnan(_800));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _802.xy, uint(rint(_802.z)), _270);
    float2 _808 = float2(_300, _298);
    float _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_808, float2(0.0), isnan(_808))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_808, float2(0.0), isnan(_808))).x;
    float _312 = -_220;
    float _314 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _316 = _312 + _314;
    float _318 = _316 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[48].w, _320);
    float _324 = _302 + _304;
    float _326 = _324 + _306;
    float _328 = -_220;
    float _330 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _332 = _328 + _330;
    float _334 = _326 + _308;
    float _336 = _332 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = fma(_334, 0.25, _338);
    out.m_45.x = _310;
    out.m_45.y = _340;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _322;
    return out;
}

