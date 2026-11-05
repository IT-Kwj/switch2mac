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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _345 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_345, float2(0.0), isnan(_345))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _77);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _83);
    float _95 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _97 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _87);
    float _99 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _101 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _91);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _93);
    float _105 = fma(_95, -0.5, 0.5);
    float _107 = fma(_97, -0.5, 0.5);
    float _109 = fma(_99, -0.5, 0.5);
    float _111 = fma(_101, -0.5, 0.5);
    float _113 = fma(_103, -0.5, 0.5);
    float2 _452 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_452, float2(0.0), isnan(_452))).x;
    float2 _462 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_462, float2(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_462, float2(0.0), isnan(_462))).x;
    float2 _472 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_472, float2(0.0), isnan(_472))).x;
    float2 _482 = float2(_107, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_482, float2(0.0), isnan(_482))).x;
    float2 _492 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_492, float2(0.0), isnan(_492))).x;
    float _125 = _105 + _109;
    float _127 = abs(_73);
    float _129 = -_127;
    float _131 = _129 + 1.0;
    float _133 = _125 + _111;
    float _135 = _131 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = _133 + _107;
    float _141 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _143 = _141 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _145 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _147 = _145 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _149 = abs(_137);
    float _151 = log2(_149);
    float _153 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _155 = _153 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _157 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _159 = _157 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _161 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _163 = _161 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _165 = _113 + _139;
    float _167 = abs(_115);
    float _169 = log2(_167);
    float _171 = abs(_117);
    float _173 = log2(_171);
    float _175 = abs(_119);
    float _177 = log2(_175);
    float _179 = _169 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _181 = _173 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _183 = exp2(_179);
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _189 = _177 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _191 = exp2(_181);
    float _193 = abs(_121);
    float _195 = log2(_193);
    float _197 = fma(_183, _143, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _199 = fma(_183, _155, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _201 = fma(_183, _187, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _203 = exp2(_189);
    float _205 = fma(_191, _147, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _207 = fma(_191, _163, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _209 = fma(_191, _159, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _211 = _197 + _205;
    float _213 = _199 + _207;
    float _215 = abs(_123);
    float _217 = log2(_215);
    float _219 = _195 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _225 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _227 = _225 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _233 = _201 + _209;
    float _235 = exp2(_219);
    float _237 = fma(_203, _223, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _239 = fma(_203, _227, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _241 = fma(_203, _231, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _243 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _245 = _243 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _247 = _213 + _237;
    float _249 = _211 + _239;
    float _251 = _217 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _253 = _233 + _241;
    float _255 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _257 = _255 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _259 = _151 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _261 = exp2(_251);
    float _263 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _265 = _263 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _267 = fma(_235, _245, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _269 = fma(_235, _257, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _271 = fma(_235, _265, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _273 = _247 + _267;
    float _275 = exp2(_259);
    float _277 = _249 + _271;
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _283 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _285 = _283 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _291 = _253 + _269;
    float _293 = fma(_261, _285, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _295 = fma(_261, _281, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _297 = fma(_261, _289, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _299 = _293 + _273;
    float _301 = _295 + _277;
    float _303 = _297 + _291;
    float _305 = fma(_275, (*spvDescriptorSet0.fp_c4)._m0[0].w, _165);
    float _307 = fma(_275, (*spvDescriptorSet0.fp_c4)._m0[0].x, _301);
    float _309 = fma(_275, (*spvDescriptorSet0.fp_c4)._m0[0].y, _299);
    float _311 = fma(_275, (*spvDescriptorSet0.fp_c4)._m0[0].z, _303);
    out.m_38.x = _307;
    out.m_38.y = _309;
    out.m_38.z = _311;
    out.m_38.w = _305;
    return out;
}

