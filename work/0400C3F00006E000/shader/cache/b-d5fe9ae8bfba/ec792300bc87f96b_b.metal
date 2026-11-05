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
    float2 _349 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_349, float2(0.0), isnan(_349))).xyz;
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
    float _91 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _93 = -_75;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _97 = -_75;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _101 = fma(_89, -0.5, 0.5);
    float _103 = fma(_91, -0.5, 0.5);
    float _105 = fma(_95, -0.5, 0.5);
    float _107 = fma(_99, -0.5, 0.5);
    float _109 = abs(_101);
    float _111 = log2(_109);
    float _113 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _115 = -_75;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _119 = fma(_113, -0.5, 0.5);
    float _121 = fma(_117, -0.5, 0.5);
    float _123 = abs(_103);
    float _125 = log2(_123);
    float _127 = abs(_105);
    float _129 = log2(_127);
    float _131 = _111 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _133 = abs(_107);
    float _135 = log2(_133);
    float _137 = _125 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _139 = abs(_119);
    float _141 = log2(_139);
    float _143 = _129 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _145 = abs(_121);
    float _147 = log2(_145);
    float _149 = _135 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _151 = exp2(_131);
    float _153 = _141 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _155 = exp2(_143);
    float _157 = _147 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _159 = exp2(_137);
    float _161 = exp2(_149);
    float2 _505 = float2(_151, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_505, float2(0.0), isnan(_505))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_505, float2(0.0), isnan(_505))).x;
    float2 _514 = float2(_155, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_514, float2(0.0), isnan(_514))).x;
    float _167 = exp2(_153);
    float2 _526 = float2(_159, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_526, float2(0.0), isnan(_526))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_526, float2(0.0), isnan(_526))).x;
    float _171 = exp2(_157);
    float2 _537 = float2(_161, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_537, float2(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_537, float2(0.0), isnan(_537))).x;
    float2 _547 = float2(_167, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_547, float2(0.0), isnan(_547))).x;
    float2 _556 = float2(_171, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_556, float2(0.0), isnan(_556))).x;
    float _179 = abs(_75);
    float _181 = -_179;
    float _183 = _181 + 1.0;
    float _185 = _101 + _103;
    float _187 = _105 + _107;
    float _189 = _183 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = _119 + _185;
    float _195 = _121 + _187;
    float _197 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _199 = _197 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _201 = abs(_191);
    float _203 = log2(_201);
    float _205 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _207 = _205 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _209 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _211 = _209 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _213 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _215 = _213 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _225 = fma(_163, _199, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _227 = fma(_163, _211, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _229 = fma(_163, _219, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _231 = fma(_199, _165, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _233 = fma(_211, _165, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _235 = fma(_219, _165, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _237 = _203 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _239 = fma(_169, _207, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _241 = fma(_169, _215, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _243 = fma(_169, _223, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _245 = _225 + _239;
    float _247 = _227 + _241;
    float _249 = _229 + _243;
    float _251 = fma(_207, _173, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _253 = fma(_215, _173, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _255 = fma(_223, _173, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _257 = exp2(_237);
    float _259 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _261 = _259 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _263 = _233 + _253;
    float _265 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _267 = _265 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _269 = _231 + _251;
    float _271 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _273 = _271 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _275 = fma(_175, _261, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _277 = fma(_175, _267, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _279 = _235 + _255;
    float _281 = fma(_175, _273, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _283 = fma(_267, _177, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _285 = fma(_261, _177, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _287 = fma(_273, _177, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _289 = _281 + _249;
    float _291 = _283 + _269;
    float _293 = _277 + _245;
    float _295 = _275 + _247;
    float _297 = _285 + _263;
    float _299 = _287 + _279;
    float _301 = fma(_257, (*spvDescriptorSet0.fp_c4)._m0[0].w, _193);
    float _303 = fma(_257, (*spvDescriptorSet0.fp_c4)._m0[0].w, _195);
    float _305 = fma(_257, (*spvDescriptorSet0.fp_c4)._m0[0].x, _293);
    float _307 = fma(_257, (*spvDescriptorSet0.fp_c4)._m0[0].y, _295);
    float _309 = fma(_257, (*spvDescriptorSet0.fp_c4)._m0[0].z, _289);
    float _311 = fma(_257, (*spvDescriptorSet0.fp_c4)._m0[0].x, _291);
    float _313 = fma(_257, (*spvDescriptorSet0.fp_c4)._m0[0].y, _297);
    float _315 = fma(_257, (*spvDescriptorSet0.fp_c4)._m0[0].z, _299);
    out.m_38.x = _305;
    out.m_38.y = _307;
    out.m_38.z = _309;
    out.m_38.w = _301;
    out.m_40.x = _311;
    out.m_40.y = _313;
    out.m_40.z = _315;
    out.m_40.w = _303;
    return out;
}

