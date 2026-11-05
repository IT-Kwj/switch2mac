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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _45;
    float _73 = _71 * _51;
    float _75 = _71 * _57;
    float _77 = _71 * _63;
    float _79 = _71 * _69;
    float _81 = fma(_73, 2.07618999481201171875, -0.538094997406005859375);
    float _83 = fma(_75, 1.2380950450897216796875, -0.11904752254486083984375);
    float _85 = _81 + (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _87 = fma(_75, 2.07618999481201171875, -0.538094997406005859375);
    float _89 = _83 + (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _91 = fma(_73, 1.2380950450897216796875, -0.11904752254486083984375);
    float _93 = floor(_85);
    float _95 = _87 + (*spvDescriptorSet0.fp_c3)._m0[20].x;
    float _97 = _91 + (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _99 = floor(_89);
    float _101 = floor(_95);
    float _103 = -_93;
    float _105 = _85 + _103;
    float _107 = -_99;
    float _109 = _89 + _107;
    float _111 = floor(_97);
    float _113 = -_101;
    float _115 = _95 + _113;
    float2 _422 = float2(_77, _79);
    float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_422, float2(0.0), isnan(_422))).xyz;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float _127 = -_111;
    float _129 = _97 + _127;
    float2 _445 = float2(_109, _129);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_445, float2(0.0), isnan(_445))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_445, float2(0.0), isnan(_445))).y;
    float2 _453 = float2(_75, _73);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_453, float2(0.0), isnan(_453))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_453, float2(0.0), isnan(_453))).x;
    float2 _461 = float2(_115, _105);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_461, float2(0.0), isnan(_461))).z;
    float _137 = in.m_35.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_35.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_35.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_35.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _163 = _161 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _167 = _165 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _169 = fma(_77, 0.069999992847442626953125, 0.930000007152557373046875);
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _173 = _171 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _177 = _175 + (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _179 = fma(_75, _163, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _181 = _77 * 0.10999999940395355224609375;
    float _183 = fma(_77, 0.420000016689300537109375, 0.579999983310699462890625);
    float _185 = fma(_75, _167, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _187 = fma(_75, _173, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _189 = fma(_75, _177, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _191 = -_181;
    float _193 = _191 + _169;
    float _195 = -_183;
    float _197 = fma(_77, 0.2700000107288360595703125, _195);
    float _199 = -_179;
    float _201 = _199 + _185;
    float _203 = -_187;
    float _205 = _203 + _189;
    float _207 = fma(_79, _193, _181);
    float _209 = fma(_79, _197, _183);
    float _211 = fma(_73, _201, _179);
    float _213 = fma(_73, _205, _187);
    float _215 = _211 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _217 = _215 * 0.5;
    float _219 = _213 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _221 = _219 * 0.5;
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _225 = _223 + (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _227 = _71 * _153;
    float _229 = fma(_75, _225, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _231 = _71 * _147;
    float _233 = _123 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _235 = _121 * (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _237 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _239 = _237 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _241 = -_233;
    float _243 = _241 + 1.0;
    float _245 = fma(_75, _239, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _247 = fma(_235, _243, _233);
    float _249 = _235 * _243;
    float _251 = _71 * _141;
    float _253 = _71 * _159;
    float _255 = 1.0 / _247;
    float _257 = _249 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _259 = _249 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _261 = _249 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _263 = -_245;
    float _265 = _263 + _229;
    float _267 = fma(_251, _233, _257);
    float _269 = fma(_231, _233, _259);
    float _271 = fma(_227, _233, _261);
    float _273 = fma(_73, _265, _245);
    float _275 = -_77;
    float _277 = _275 + 1.0;
    float _279 = precise::min(_133, _131);
    float _281 = _253 * _247;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = precise::min(_135, _279);
    float _287 = _267 * _255;
    float _289 = _269 * _255;
    float _291 = _271 * _255;
    float _293 = fma(_125, _277, _287);
    float _295 = fma(_125, _209, _289);
    float _297 = fma(_125, _207, _291);
    float _299 = _273 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _301 = _299 * 0.5;
    float _303 = fma(_285, _217, _293);
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = fma(_285, _221, _295);
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = fma(_285, _301, _297);
    float _313 = precise::clamp(_311, 0.0, 1.0);
    out.m_38.x = _305;
    out.m_38.y = _309;
    out.m_38.z = _313;
    out.m_38.w = _283;
    return out;
}

