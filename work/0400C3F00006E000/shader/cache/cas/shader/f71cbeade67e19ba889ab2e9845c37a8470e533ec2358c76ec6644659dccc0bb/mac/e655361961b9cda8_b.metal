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
    float2 _300 = float2(_48, _50);
    float3 _54 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_300, float2(0.0), isnan(_300)), int2(0), component::x).xyw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float2 _318 = float2(_48, _50);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_318, float2(0.0), isnan(_318))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_318, float2(0.0), isnan(_318))).x;
    float _64 = in.m_34.y;
    float _66 = in.m_34.x;
    float _68 = in.m_36.y;
    float _70 = in.m_38.y;
    float _72 = in.m_36.x;
    float _74 = in.m_38.x;
    float _76 = -_56;
    float _78 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _80 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[46].z, _78);
    float _82 = -_58;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_60;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_62;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _64 * _80;
    float _102 = _66 * _80;
    float _104 = -_100;
    float _106 = fma(_86, _68, _104);
    float _108 = -_100;
    float _110 = fma(_92, _70, _108);
    float _112 = -_102;
    float _114 = fma(_86, _72, _112);
    float _116 = -_102;
    float _118 = fma(_92, _74, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_80;
    float _126 = _124 + _86;
    float _128 = -_80;
    float _130 = _128 + _92;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = rsqrt(_136);
    float _142 = rsqrt(_138);
    float _144 = _114 * _140;
    float _146 = _126 * _140;
    float _148 = _106 * _140;
    float _150 = _130 * _142;
    float _152 = _118 * _142;
    float _154 = _110 * _142;
    float _156 = _144 * _150;
    float _158 = _146 * _154;
    float _160 = -_156;
    float _162 = fma(_146, _152, _160);
    float _164 = _148 * _152;
    float _166 = -_158;
    float _168 = fma(_148, _150, _166);
    float _170 = _162 * _162;
    float _172 = -_164;
    float _174 = fma(_144, _154, _172);
    float _176 = fma(_168, _168, _170);
    float _178 = fma(_174, _174, _176);
    float _180 = rsqrt(_178);
    float _182 = _162 * _180;
    float _184 = _168 * _180;
    float _186 = _174 * _180;
    float _188 = _182 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _190 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[35].x, _188);
    float _192 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[35].z, _190);
    float _194 = abs(_192);
    float _196 = -_194;
    float _198 = _196 + 1.0;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = abs(_200);
    float _204 = log2(_202);
    float _206 = _204 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _208 = exp2(_206);
    float _210 = _208 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _212 = _182 * _210;
    float _214 = _184 * _210;
    float _216 = fma(_186, _210, _98);
    float _218 = fma(_98, _64, _212);
    float _220 = fma(_98, _66, _214);
    float _222 = _218 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _226 = _218 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _228 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[3].x, _222);
    float _230 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[1].x, _224);
    float _232 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[2].x, _226);
    float _234 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[3].z, _228);
    float _236 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[1].z, _230);
    float _238 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[2].z, _232);
    float _240 = _234 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _242 = _218 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _244 = _236 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _246 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[0].x, _242);
    float _248 = 1.0 / _240;
    float _250 = _238 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _252 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[0].z, _246);
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _256 = _244 * _248;
    float _258 = _254 * _248;
    float _260 = _250 * _248;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float3 _659 = float3(_258, _256, float(0));
    float3 _663 = select(_659, float3(0.0), isnan(_659));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _663.xy, uint(rint(_663.z)), _262);
    float _266 = -_98;
    float _268 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _270 = _266 + _268;
    float _272 = -_98;
    float _274 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _276 = _272 + _274;
    float _278 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _276 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[48].w, _280);
    float _288 = _284 + _264;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _288;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _286;
    return out;
}

