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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _63 = _57 + _61;
    float _65 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _69 = _57 + _67;
    float _71 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _73 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _75 = _57 + _73;
    float _77 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float2 _361 = float2(_63, _59);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361))).x;
    float2 _373 = float2(_65, _59);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_373, float2(0.0), isnan(_373))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_373, float2(0.0), isnan(_373))).x;
    float2 _381 = float2(_57, _59);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_381, float2(0.0), isnan(_381))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_381, float2(0.0), isnan(_381))).x;
    float2 _389 = float2(_69, _59);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_389, float2(0.0), isnan(_389))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_389, float2(0.0), isnan(_389))).x;
    float2 _397 = float2(_71, _59);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).x;
    float2 _405 = float2(_75, _59);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_405, float2(0.0), isnan(_405))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_405, float2(0.0), isnan(_405))).x;
    float2 _413 = float2(_77, _59);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_413, float2(0.0), isnan(_413))).x;
    float _93 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _95 = _57 + _93;
    float _97 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _101 = _57 + _99;
    float _103 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _105 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _107 = _57 + _105;
    float _109 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float2 _451 = float2(_95, _59);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_451, float2(0.0), isnan(_451))).x;
    float2 _459 = float2(_97, _59);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_459, float2(0.0), isnan(_459))).x;
    float2 _467 = float2(_101, _59);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_467, float2(0.0), isnan(_467))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_467, float2(0.0), isnan(_467))).x;
    float2 _475 = float2(_103, _59);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_475, float2(0.0), isnan(_475))).x;
    float2 _483 = float2(_107, _59);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).x;
    float2 _491 = float2(_109, _59);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).x;
    float _123 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _125 = _57 + _123;
    float _127 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _129 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _131 = _57 + _129;
    float _133 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _135 = -(*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _137 = _57 + _135;
    float _139 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float2 _530 = float2(_125, _59);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_530, float2(0.0), isnan(_530))).x;
    float2 _538 = float2(_127, _59);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_538, float2(0.0), isnan(_538))).x;
    float2 _546 = float2(_131, _59);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_546, float2(0.0), isnan(_546))).x;
    float2 _554 = float2(_133, _59);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_554, float2(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_554, float2(0.0), isnan(_554))).x;
    float2 _562 = float2(_137, _59);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_562, float2(0.0), isnan(_562))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_562, float2(0.0), isnan(_562))).x;
    float2 _570 = float2(_139, _59);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_570, float2(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_570, float2(0.0), isnan(_570))).x;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _155 = _57 + _153;
    float _157 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _159 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _161 = _57 + _159;
    float _163 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float2 _598 = float2(_155, _59);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_598, float2(0.0), isnan(_598))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_598, float2(0.0), isnan(_598))).x;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _169 = _57 + _167;
    float _171 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float2 _616 = float2(_157, _59);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_616, float2(0.0), isnan(_616))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_616, float2(0.0), isnan(_616))).x;
    float2 _624 = float2(_161, _59);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_624, float2(0.0), isnan(_624))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_624, float2(0.0), isnan(_624))).x;
    float2 _632 = float2(_163, _59);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_632, float2(0.0), isnan(_632))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_632, float2(0.0), isnan(_632))).x;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _181 = _57 + _179;
    float2 _647 = float2(_169, _59);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_647, float2(0.0), isnan(_647))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_647, float2(0.0), isnan(_647))).x;
    float2 _655 = float2(_171, _59);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_655, float2(0.0), isnan(_655))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_655, float2(0.0), isnan(_655))).x;
    float _187 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _189 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _191 = _57 + _189;
    float _193 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float2 _677 = float2(_181, _59);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_677, float2(0.0), isnan(_677))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_677, float2(0.0), isnan(_677))).x;
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _199 = _57 + _197;
    float _201 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float2 _695 = float2(_187, _59);
    float _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_695, float2(0.0), isnan(_695))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_695, float2(0.0), isnan(_695))).x;
    float2 _703 = float2(_191, _59);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_703, float2(0.0), isnan(_703))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_703, float2(0.0), isnan(_703))).x;
    float2 _711 = float2(_193, _59);
    float _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_711, float2(0.0), isnan(_711))).x;
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _211 = _57 + _209;
    float2 _725 = float2(_199, _59);
    float _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_725, float2(0.0), isnan(_725))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_725, float2(0.0), isnan(_725))).x;
    float2 _733 = float2(_201, _59);
    float _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_733, float2(0.0), isnan(_733))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_733, float2(0.0), isnan(_733))).x;
    float _217 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float2 _745 = float2(_211, _59);
    float _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_745, float2(0.0), isnan(_745))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_745, float2(0.0), isnan(_745))).x;
    float2 _753 = float2(_57, _59);
    float _221 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_753, float2(0.0), isnan(_753))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_753, float2(0.0), isnan(_753))).x;
    float2 _761 = float2(_217, _59);
    float _223 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_761, float2(0.0), isnan(_761))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_761, float2(0.0), isnan(_761))).x;
    float _225 = _83 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _227 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[18].x, _225);
    float _229 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[18].x, _227);
    float _231 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].y, _229);
    float _233 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].y, _231);
    float _235 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[18].z, _233);
    float _237 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[18].z, _235);
    float _239 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[18].w, _237);
    float _241 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[18].w, _239);
    float _243 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[19].x, _241);
    float _245 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[19].x, _243);
    float _247 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[19].y, _245);
    float _249 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[19].y, _247);
    float _251 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[19].z, _249);
    float _253 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[19].z, _251);
    float _255 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[19].w, _253);
    float _257 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[19].w, _255);
    float _259 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[20].x, _257);
    float _261 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[20].x, _259);
    float _263 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[20].y, _261);
    float _265 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[20].y, _263);
    float _267 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[20].z, _265);
    float _269 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[20].z, _267);
    float _271 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[20].w, _269);
    float _273 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[20].w, _271);
    float _275 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[21].x, _273);
    float _277 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[21].x, _275);
    float _279 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[21].y, _277);
    float _281 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[21].y, _279);
    float _283 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[21].z, _281);
    float _285 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[21].z, _283);
    float _287 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[21].w, _285);
    float _289 = -_221;
    float _291 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[1].w, 1.0);
    float _293 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[21].w, _287);
    float _295 = _293 * _291;
    out.m_34.x = _295;
    return out;
}

