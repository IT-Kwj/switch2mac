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
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_36 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2)]];
    float4 m_32 [[user(locn3), center_no_perspective]];
    float4 m_38 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _54 = in.m_32.x;
    float _56 = in.m_32.y;
    float2 _301 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301))).x;
    float _60 = gl_FragCoord.w;
    float _62 = in.m_36.y;
    float _64 = in.m_36.x;
    float _66 = in.m_38.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_38.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_38.z;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_42.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_40.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_40.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_38.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = 1.0 / _60;
    float _122 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].w, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _124 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].x);
    float _126 = _120 * _70;
    float _128 = _120 * _76;
    float _130 = _120 * _88;
    float _132 = _120 * _112;
    float _134 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _136 = _134 * _122;
    float _138 = _120 * _82;
    float _140 = _134 * _124;
    float _142 = _136 * _126;
    float _144 = _136 * _138;
    float _146 = _134 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _148 = fma(_140, _128, _142);
    float _150 = _120 * _94;
    float _152 = _120 * _100;
    float _154 = fma(_140, _130, _144);
    float _156 = _120 * _106;
    float _158 = -_146;
    float _160 = fma(_158, _150, _148);
    float _162 = rint(_152);
    float _164 = precise::max(_162, 0.0);
    uint _167 = uint(_164);
    uint _169 = clamp(_167, 0u, 65535u);
    float _171 = -_146;
    float _173 = fma(_171, _156, _154);
    float _175 = _120 * _118;
    float _177 = _132 + _173;
    float _179 = _175 + _160;
    float _181 = -_177;
    float _183 = _181 + 0.5;
    float _185 = -_179;
    float _187 = _185 + 0.5;
    float3 _498 = float3(_187, _183, float(int(_169)));
    float3 _502 = select(_498, float3(0.0), isnan(_498));
    float _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _502.xy, uint(rint(_502.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _502.xy, uint(rint(_502.z))).x;
    float _191 = in.m_44.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_44.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = _136 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _207 = _187 <= 1.0;
    bool _209 = isnan(_187);
    bool _211 = _207 || _209;
    bool _213 = isnan(1.0);
    bool _215 = _211 || _213;
    bool _217 = _183 <= 1.0;
    bool _219 = isnan(_183);
    bool _221 = _217 || _219;
    bool _223 = isnan(1.0);
    bool _225 = _221 || _223;
    float _227 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[0].x, _203);
    float _229 = -_146;
    float _231 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[0].z, _227);
    float _233 = _231 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _235 = _120 * _195;
    float _237 = _120 * _201;
    float _239 = fma(_189, _237, _235);
    float _241 = -_233;
    float _243 = _241 + _239;
    float _245 = -_179;
    bool _247 = _245 >= (-0.5);
    bool _249 = isnan(_245);
    bool _251 = _247 || _249;
    bool _253 = isnan(-0.5);
    bool _255 = _251 || _253;
    bool _257 = _255 && _215;
    float _259 = float(_257);
    float _261 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _263 = -_177;
    bool _265 = _263 >= (-0.5);
    bool _267 = isnan(_263);
    bool _269 = _265 || _267;
    bool _271 = isnan(-0.5);
    bool _273 = _269 || _271;
    bool _275 = _273 && _225;
    float _277 = float(_275);
    float _279 = exp2(_261);
    float _281 = 0.0 + _279;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = _283 * _259;
    float _287 = -_285;
    float _289 = fma(_287, _277, 1.0);
    out.m_47.x = _289;
    out.m_47.y = _289;
    out.m_47.z = _289;
    out.m_47.w = _289;
    return out;
}

