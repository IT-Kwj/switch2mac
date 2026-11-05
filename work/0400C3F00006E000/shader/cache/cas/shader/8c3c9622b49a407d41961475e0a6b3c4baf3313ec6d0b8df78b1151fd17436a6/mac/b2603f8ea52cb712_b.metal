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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
    float4 m_36 [[user(locn2), center_no_perspective]];
    float4 m_32 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _48 = in.m_32.x;
    float _50 = in.m_32.y;
    float2 _349 = float2(_48, _50);
    float3 _54 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349)), int2(0), component::x).xyw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float2 _367 = float2(_48, _50);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_367, float2(0.0), isnan(_367))).x;
    float _64 = in.m_34.y;
    float _66 = in.m_34.x;
    float _68 = in.m_36.y;
    float _70 = in.m_38.y;
    float _72 = in.m_36.x;
    float _74 = in.m_38.x;
    float _76 = -_56;
    float _78 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _80 = -_58;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_60;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = 1.0 / _78;
    float _90 = 1.0 / _82;
    float _92 = -_62;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = 1.0 / _86;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = _88 * _98;
    float _102 = _64 * _100;
    float _104 = _66 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _90 * _106;
    float _110 = 1.0 / _94;
    float _112 = -_102;
    float _114 = fma(_108, _68, _112);
    float _116 = -_104;
    float _118 = fma(_108, _72, _116);
    float _120 = -_100;
    float _122 = _120 + _108;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _96 * _124;
    float _128 = _114 * _114;
    float _130 = -_102;
    float _132 = fma(_126, _70, _130);
    float _134 = -_104;
    float _136 = fma(_126, _74, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_100;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _148 = _110 * _146;
    float _150 = fma(_122, _122, _138);
    float _152 = fma(_136, _136, _144);
    float _154 = fma(_142, _142, _152);
    float _156 = rsqrt(_150);
    float _158 = rsqrt(_154);
    float _160 = _118 * _156;
    float _162 = _122 * _156;
    float _164 = _114 * _156;
    float _166 = _142 * _158;
    float _168 = _136 * _158;
    float _170 = _132 * _158;
    float _172 = _160 * _166;
    float _174 = _162 * _170;
    float _176 = -_172;
    float _178 = fma(_162, _168, _176);
    float _180 = _164 * _168;
    float _182 = -_174;
    float _184 = fma(_164, _166, _182);
    float _186 = _178 * _178;
    float _188 = -_180;
    float _190 = fma(_160, _170, _188);
    float _192 = fma(_184, _184, _186);
    float _194 = fma(_190, _190, _192);
    float _196 = rsqrt(_194);
    float _198 = _178 * _196;
    float _200 = _184 * _196;
    float _202 = _190 * _196;
    float _204 = _198 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _206 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[35].x, _204);
    float _208 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[35].z, _206);
    float _210 = abs(_208);
    float _212 = -_210;
    float _214 = _212 + 1.0;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = abs(_216);
    float _220 = log2(_218);
    float _222 = _220 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _224 = exp2(_222);
    float _226 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _228 = _198 * _226;
    float _230 = _200 * _226;
    float _232 = fma(_202, _226, _148);
    float _234 = fma(_148, _64, _228);
    float _236 = fma(_148, _66, _230);
    float _238 = _234 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _240 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[3].x, _238);
    float _242 = _234 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _244 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[3].z, _240);
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _248 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[2].x, _242);
    float _250 = _234 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _252 = _234 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _254 = 1.0 / _246;
    float _256 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[2].z, _248);
    float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _260 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].x, _250);
    float _262 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[1].x, _252);
    float _264 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[0].z, _260);
    float _266 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[1].z, _262);
    float _268 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _270 = _264 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _272 = _266 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _274 = _258 * _254;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _280 = _270 * _254;
    float _282 = _272 * _254;
    float _284 = rint(_276);
    float _286 = precise::max(_284, 0.0);
    uint _289 = uint(_286);
    uint _291 = clamp(_289, 0u, 65535u);
    float _293 = fma(_268, 0.5, _280);
    float _295 = fma(_278, 0.5, _282);
    float _297 = fma(_268, -0.5, _280);
    float _299 = fma(_278, -0.5, _282);
    float3 _762 = float3(_293, _295, float(int(_291)));
    float3 _766 = select(_762, float3(0.0), isnan(_762));
    float _301 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _766.xy, uint(rint(_766.z)), 1.0);
    float3 _774 = float3(_297, _295, float(int(_291)));
    float3 _776 = select(_774, float3(0.0), isnan(_774));
    float _303 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _776.xy, uint(rint(_776.z)), 1.0);
    float3 _784 = float3(_293, _299, float(int(_291)));
    float3 _786 = select(_784, float3(0.0), isnan(_784));
    float _305 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _786.xy, uint(rint(_786.z)), 1.0);
    float3 _794 = float3(_297, _299, float(int(_291)));
    float3 _796 = select(_794, float3(0.0), isnan(_794));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _796.xy, uint(rint(_796.z)), 1.0);
    float _309 = _301 + _303;
    float _311 = -_148;
    float _313 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _315 = _311 + _313;
    float _317 = -_148;
    float _319 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _321 = _317 + _319;
    float _323 = _309 + _305;
    float _325 = _315 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _321 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _323 + _307;
    float _335 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[48].w, _327);
    float _337 = fma(_333, 0.25, _331);
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _337;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _335;
    return out;
}

