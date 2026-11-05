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
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_36 [[user(locn3), center_no_perspective]];
    float4 m_32 [[user(locn4), center_no_perspective]];
    float4 m_38 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_40 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _60 = in.m_32.x;
    float _62 = in.m_32.y;
    float2 _371 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_371, float2(0.0), isnan(_371))).x;
    float _66 = gl_FragCoord.w;
    float _68 = in.m_36.y;
    float _70 = in.m_36.x;
    float _72 = in.m_38.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_38.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_38.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_42.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_40.z;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_40.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_38.w;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = 1.0 / _66;
    float _128 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].w, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _130 = _126 * _76;
    float _132 = _126 * _82;
    float _134 = _126 * _94;
    float _136 = _126 * _112;
    float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].x);
    float _142 = _138 * _128;
    float _144 = _138 * _140;
    float _146 = _126 * _88;
    float _148 = _138 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _150 = _142 * _130;
    float _152 = _142 * _132;
    float _154 = fma(_144, _134, _150);
    float _156 = fma(_144, _146, _152);
    float _158 = _126 * _100;
    float _160 = _126 * _106;
    float _162 = -_148;
    float _164 = fma(_162, _136, _156);
    float _166 = -_148;
    float _168 = fma(_166, _158, _154);
    float _170 = rint(_160);
    float _172 = precise::max(_170, 0.0);
    uint _175 = uint(_172);
    uint _177 = clamp(_175, 0u, 65535u);
    float _179 = _126 * _118;
    float _181 = _126 * _124;
    float _183 = _179 + _164;
    float _185 = _181 + _168;
    float _187 = _183 + 0.5;
    float _189 = -_185;
    float _191 = _189 + 0.5;
    float3 _566 = float3(_191, _187, float(int(_177)));
    float3 _570 = select(_566, float3(0.0), isnan(_566));
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _570.xy, uint(rint(_570.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _570.xy, uint(rint(_570.z))).x;
    float _195 = in.m_44.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_44.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_44.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_44.w;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_46.z;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_46.w;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    bool _233 = _191 <= 1.0;
    bool _235 = isnan(_191);
    bool _237 = _233 || _235;
    bool _239 = isnan(1.0);
    bool _241 = _237 || _239;
    bool _243 = _187 <= 1.0;
    bool _245 = isnan(_187);
    bool _247 = _243 || _245;
    bool _249 = isnan(1.0);
    bool _251 = _247 || _249;
    float _253 = _126 * _199;
    float _255 = _126 * _211;
    float _257 = in.m_48.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = _142 * _253;
    float _265 = _126 * _205;
    float _267 = -_185;
    bool _269 = _267 >= (-0.5);
    bool _271 = isnan(_267);
    bool _273 = _269 || _271;
    bool _275 = isnan(-0.5);
    bool _277 = _273 || _275;
    bool _279 = _277 && _241;
    float _281 = float(_279);
    float _283 = in.m_50.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    bool _289 = _183 >= (-0.5);
    bool _291 = isnan(_183);
    bool _293 = _289 || _291;
    bool _295 = isnan(-0.5);
    bool _297 = _293 || _295;
    bool _299 = _297 && _251;
    float _301 = float(_299);
    float _303 = fma(_144, _265, _263);
    float _305 = in.m_46.x;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = -_148;
    float _313 = fma(_311, _255, _303);
    float _315 = _126 * _217;
    float _317 = _126 * _223;
    float _319 = _315 + _313;
    float _321 = _126 * _229;
    float _323 = -_319;
    float _325 = _323 + 0.5;
    float _327 = -_319;
    float _329 = _327 + (-0.5);
    float _331 = _325 * _317;
    float _333 = _321 * _329;
    float _335 = precise::min(_331, _333);
    float _337 = _126 * _261;
    float _339 = _335 * _337;
    float _341 = _126 * _287;
    float _343 = _126 * _309;
    float _345 = precise::min(_339, _341);
    float _347 = _343 * _345;
    float _349 = _347 * _281;
    float _351 = _349 * _301;
    float _353 = -_193;
    float _355 = _353 + 1.0;
    float _357 = -_351;
    float _359 = fma(_357, _355, 1.0);
    out.m_53.x = _359;
    out.m_53.y = _359;
    out.m_53.z = _359;
    out.m_53.w = _359;
    return out;
}

