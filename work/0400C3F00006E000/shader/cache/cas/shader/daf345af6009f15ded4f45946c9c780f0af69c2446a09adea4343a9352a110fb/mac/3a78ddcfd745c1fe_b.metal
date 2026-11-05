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
    float2 _355 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_355, float2(0.0), isnan(_355))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _75);
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _83);
    float _95 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _97 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _99 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _89);
    float _101 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _103 = fma(_95, -0.5, 0.5);
    float _105 = fma(_97, -0.5, 0.5);
    float _107 = fma(_99, -0.5, 0.5);
    float _109 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _93);
    float _111 = fma(_101, -0.5, 0.5);
    float2 _460 = float2(_107, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_460, float2(0.0), isnan(_460))).x;
    float _115 = fma(_109, -0.5, 0.5);
    float2 _472 = float2(_103, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_472, float2(0.0), isnan(_472))).x;
    float2 _482 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_482, float2(0.0), isnan(_482))).x;
    float2 _492 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_492, float2(0.0), isnan(_492))).x;
    float2 _502 = float2(_115, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_502, float2(0.0), isnan(_502))).x;
    float _125 = 0.0 + _107;
    float _127 = precise::clamp(_125, 0.0, 1.0);
    float _129 = abs(_73);
    float _131 = -_129;
    float _133 = _131 + 1.0;
    float _135 = _127 + _103;
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = _133 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = _137 + _105;
    float _145 = precise::clamp(_143, 0.0, 1.0);
    float _147 = _145 + _111;
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _159 = _115 + _149;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = abs(_141);
    float _165 = log2(_163);
    float _167 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _169 = _167 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _171 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _173 = _171 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _183 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _185 = _183 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _187 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _189 = _187 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _191 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _193 = _191 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _195 = fma(_113, _153, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = fma(_113, _157, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = fma(_113, _173, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = fma(_117, _169, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _209 = fma(_117, _177, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _211 = fma(_117, _181, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _213 = _197 + _207;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = _201 + _209;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_119, _185, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _223 = fma(_119, _189, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _225 = fma(_119, _193, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _227 = _205 + _211;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _215 + _221;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _237 = _235 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _239 = _229 + _225;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _245 = _243 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _247 = _165 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _249 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _251 = _249 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _253 = _219 + _223;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = fma(_121, _237, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _259 = fma(_121, _245, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _261 = fma(_121, _251, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _263 = exp2(_247);
    float _265 = _233 + _257;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _271 = _269 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _273 = _255 + _259;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _279 = _277 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _281 = _241 + _261;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _287 = _285 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _289 = fma(_123, _271, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _291 = fma(_123, _279, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _293 = fma(_123, _287, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _295 = _289 + _267;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _291 + _275;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = _293 + _283;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = fma(_263, (*spvDescriptorSet0.fp_c4)._m0[0].w, _161);
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = fma(_263, (*spvDescriptorSet0.fp_c4)._m0[0].x, _297);
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = fma(_263, (*spvDescriptorSet0.fp_c4)._m0[0].y, _301);
    float _317 = precise::clamp(_315, 0.0, 1.0);
    float _319 = fma(_263, (*spvDescriptorSet0.fp_c4)._m0[0].z, _305);
    float _321 = precise::clamp(_319, 0.0, 1.0);
    out.m_38.x = _313;
    out.m_38.y = _317;
    out.m_38.z = _321;
    out.m_38.w = _309;
    return out;
}

