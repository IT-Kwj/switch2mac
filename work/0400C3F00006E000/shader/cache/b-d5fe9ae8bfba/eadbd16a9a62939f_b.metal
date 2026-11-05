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
    float2 _231 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_231, float2(0.0), isnan(_231))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_231, float2(0.0), isnan(_231))).x;
    float _62 = gl_FragCoord.w;
    float _64 = in.m_36.w;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_38.z;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / _62;
    float _78 = -_60;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].y, 1.0);
    float _82 = _76 * _68;
    float _84 = _76 * _74;
    float _86 = 1.0 / _80;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _90 = fma(_86, _88, _82);
    bool _94 = _90 > _84;
    if (_94)
    {
        discard_fragment();
    }
    if (_94)
    {
        out.m_41.x = 0.0;
        out.m_41.y = 0.0;
        out.m_41.z = 0.0;
        out.m_41.w = 0.0;
        return out;
    }
    float _96 = in.m_43.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_38.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _76 * _100;
    float _110 = _76 * _106;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _114 = fma(_86, _112, _108);
    bool _116 = _114 >= _110;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan(_110);
    bool _124 = _120 || _122;
    if (!_124)
    {
        discard_fragment();
    }
    if (!_124)
    {
        out.m_41.x = 0.0;
        out.m_41.y = 0.0;
        out.m_41.z = 0.0;
        out.m_41.w = 0.0;
        return out;
    }
    float _126 = in.m_45.z;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_45.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_45.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = _76 * _130;
    float _146 = _76 * _136;
    float _148 = _76 * _142;
    float _150 = rint(_144);
    float _152 = precise::max(_150, 0.0);
    uint _155 = uint(_152);
    uint _157 = clamp(_155, 0u, 65535u);
    float3 _395 = float3(_148, _146, float(int(_157)));
    float3 _399 = select(_395, float3(0.0), isnan(_395));
    float3 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _399.xy, uint(rint(_399.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _399.xy, uint(rint(_399.z))).xyz;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = _161.z;
    float _169 = in.m_47.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_47.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_47.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_49.x;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = _76 * _173;
    float _195 = _193 * 5.0;
    float _197 = _76 * _179;
    float _199 = fma(_165, 2.0, -1.0);
    float _201 = _197 * 5.0;
    float _203 = fma(_163, 2.0, -1.0);
    float _205 = fma(_167, 2.0, -1.0);
    float _207 = _199 * _195;
    float _209 = _76 * _185;
    float _211 = fma(_203, _201, _207);
    float _213 = _209 * 5.0;
    float _215 = _76 * _191;
    float _217 = fma(_205, _213, _211);
    float _219 = _215 * 0.5;
    out.m_41.x = _217;
    out.m_41.y = _217;
    out.m_41.z = _217;
    out.m_41.w = _219;
    return out;
}

