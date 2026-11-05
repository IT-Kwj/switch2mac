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
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_32 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_36 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = in.m_32.x;
    float _58 = in.m_32.y;
    float2 _233 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_233, float2(0.0), isnan(_233))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_233, float2(0.0), isnan(_233))).x;
    float _62 = gl_FragCoord.w;
    float _64 = in.m_36.w;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_38.z;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / _62;
    float _78 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _80 = _76 * _68;
    float _82 = _76 * _74;
    float _84 = -_78;
    float _86 = _84 + _80;
    bool _90 = _86 > _82;
    if (_90)
    {
        discard_fragment();
    }
    if (_90)
    {
        out.m_41.x = 0.0;
        out.m_41.y = 0.0;
        out.m_41.z = 0.0;
        out.m_41.w = 0.0;
        return out;
    }
    float _92 = in.m_43.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_38.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _76 * _96;
    float _106 = _76 * _102;
    float _108 = -_78;
    float _110 = _108 + _104;
    bool _112 = _110 >= _106;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan(_106);
    bool _120 = _116 || _118;
    if (!_120)
    {
        discard_fragment();
    }
    if (!_120)
    {
        out.m_41.x = 0.0;
        out.m_41.y = 0.0;
        out.m_41.z = 0.0;
        out.m_41.w = 0.0;
        return out;
    }
    float _122 = in.m_45.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_45.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_45.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = _76 * _126;
    float _142 = _76 * _132;
    float _144 = _76 * _138;
    float _146 = rint(_140);
    float _148 = precise::max(_146, 0.0);
    uint _151 = uint(_148);
    uint _153 = clamp(_151, 0u, 65535u);
    float3 _391 = float3(_144, _142, float(int(_153)));
    float3 _395 = select(_391, float3(0.0), isnan(_391));
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _395.xy, uint(rint(_395.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _395.xy, uint(rint(_395.z))).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float _165 = in.m_47.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_47.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_47.y;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_49.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = _76 * _169;
    float _191 = _189 * 5.0;
    float _193 = _76 * _175;
    float _195 = _193 * 5.0;
    float _197 = fma(_161, 2.0, -1.0);
    float _199 = fma(_159, 2.0, -1.0);
    float _201 = fma(_163, 2.0, -1.0);
    float _203 = _197 * _191;
    float _205 = _76 * _181;
    float _207 = _76 * _187;
    float _209 = fma(_199, _195, _203);
    float _211 = _205 * 5.0;
    float _213 = _207 * 0.5;
    float _215 = fma(_201, _211, _209);
    float _217 = precise::max(_213, 9.9999997473787516355514526367188e-06);
    float _219 = _215 + 0.5;
    float _221 = precise::min(_217, 1.0);
    out.m_41.x = _219;
    out.m_41.y = _219;
    out.m_41.z = _219;
    out.m_41.w = _221;
    return out;
}

