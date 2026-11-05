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
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _301 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_301, float2(0.0), isnan(_301))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _89 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _91 = -_75;
    float _93 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _95 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _97 = -_75;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _101 = fma(_89, -0.5, 0.5);
    float _103 = fma(_93, -0.5, 0.5);
    float _105 = fma(_95, -0.5, 0.5);
    float _107 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float2 _388 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_388, float2(0.0), isnan(_388))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_388, float2(0.0), isnan(_388))).x;
    float2 _397 = float2(_103, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).x;
    float2 _407 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_407, float2(0.0), isnan(_407))).x;
    float _115 = fma(_99, -0.5, 0.5);
    float _117 = fma(_107, -0.5, 0.5);
    float _119 = -_75;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float2 _427 = float2(_115, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).x;
    float _125 = fma(_121, -0.5, 0.5);
    float2 _439 = float2(_117, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_439, float2(0.0), isnan(_439))).x;
    float2 _448 = float2(_125, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).x;
    float _131 = abs(_75);
    float _133 = -_131;
    float _135 = _133 + 1.0;
    float _137 = _103 + _115;
    float _139 = _101 + _105;
    float _141 = _135 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = _125 + _137;
    float _147 = _117 + _139;
    float _149 = abs(_143);
    float _151 = log2(_149);
    float _153 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _155 = _153 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _157 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _159 = _157 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _161 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _163 = _161 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _165 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _167 = _165 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _169 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _171 = _169 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _173 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _175 = _173 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _177 = _151 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _179 = fma(_109, _155, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _181 = fma(_109, _163, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _183 = fma(_113, _159, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _185 = fma(_113, _167, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _187 = fma(_109, _171, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _189 = fma(_113, _175, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _191 = fma(_155, _111, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _193 = fma(_163, _111, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _195 = fma(_171, _111, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _197 = _179 + _183;
    float _199 = _181 + _185;
    float _201 = fma(_159, _123, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _203 = _187 + _189;
    float _205 = fma(_167, _123, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _207 = _191 + _201;
    float _209 = exp2(_177);
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _215 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _217 = _215 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _219 = fma(_175, _123, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _225 = fma(_127, _213, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _227 = fma(_127, _217, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _229 = fma(_213, _129, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _231 = fma(_127, _223, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _233 = _193 + _205;
    float _235 = _195 + _219;
    float _237 = fma(_217, _129, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _239 = fma(_223, _129, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _241 = _231 + _203;
    float _243 = _229 + _207;
    float _245 = _225 + _197;
    float _247 = _227 + _199;
    float _249 = _237 + _233;
    float _251 = _239 + _235;
    float _253 = fma(_209, (*spvDescriptorSet0.fp_c4)._m0[0].w, _147);
    float _255 = fma(_209, (*spvDescriptorSet0.fp_c4)._m0[0].w, _145);
    float _257 = fma(_209, (*spvDescriptorSet0.fp_c4)._m0[0].x, _245);
    float _259 = fma(_209, (*spvDescriptorSet0.fp_c4)._m0[0].y, _247);
    float _261 = fma(_209, (*spvDescriptorSet0.fp_c4)._m0[0].z, _241);
    float _263 = fma(_209, (*spvDescriptorSet0.fp_c4)._m0[0].x, _243);
    float _265 = fma(_209, (*spvDescriptorSet0.fp_c4)._m0[0].y, _249);
    float _267 = fma(_209, (*spvDescriptorSet0.fp_c4)._m0[0].z, _251);
    out.m_38.x = _257;
    out.m_38.y = _259;
    out.m_38.z = _261;
    out.m_38.w = _253;
    out.m_40.x = _263;
    out.m_40.y = _265;
    out.m_40.z = _267;
    out.m_40.w = _255;
    return out;
}

