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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_38 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _412 = float2(_65, _67);
    float3 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_412, float2(0.0), isnan(_412))).xyz;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    bool _81 = _77 > 0.0;
    bool _83 = isnan(_77);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    if (!_89)
    {
        discard_fragment();
    }
    if (!_89)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _91 = in.m_38.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_38.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_40.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_40.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _63 * _95;
    float _117 = _63 * _101;
    float _119 = _115 + (-0.5);
    float _121 = fma(_115, 0.866025388240814208984375, -0.4330126941204071044921875);
    float _123 = _117 + (-0.5);
    float _125 = fma(_117, 0.866025388240814208984375, -0.4330126941204071044921875);
    float _127 = fma(_115, 0.5, -0.25);
    float _129 = fma(_117, -0.17364819347858428955078125, 0.086824096739292144775390625);
    float _131 = fma(_115, 0.9848077297210693359375, -0.49240386486053466796875);
    float _133 = fma(_119, 1.5, 0.5);
    float _135 = -_127;
    float _137 = _125 + _135;
    float _139 = fma(_123, 1.5, 0.5);
    float _141 = -_131;
    float _143 = _129 + _141;
    float _145 = fma(_115, -0.17364819347858428955078125, 0.086824096739292144775390625);
    float _147 = _133 + (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _149 = _137 + 0.5;
    float _151 = fma(_123, 0.5, _121);
    float _153 = _139 + (*spvDescriptorSet0.fp_c3)._m0[20].x;
    float _155 = fma(_123, 0.9848077297210693359375, _145);
    float _157 = floor(_147);
    float _159 = _149 + (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _161 = fma(_143, 2.0, 0.5);
    float _163 = fma(_155, 2.0, 0.5);
    float _165 = _151 + 0.5;
    float _167 = _161 + (*spvDescriptorSet0.fp_c3)._m0[21].x;
    float _169 = _163 + (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _171 = floor(_153);
    float _173 = _165 + (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _175 = floor(_159);
    float _177 = -_157;
    float _179 = _147 + _177;
    float _181 = _63 * _107;
    float _183 = _63 * _113;
    float _185 = floor(_167);
    float _187 = -_171;
    float _189 = _153 + _187;
    float _191 = floor(_169);
    float _193 = -_175;
    float _195 = _159 + _193;
    float2 _603 = float2(_189, _179);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_603, float2(0.0), isnan(_603))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_603, float2(0.0), isnan(_603))).y;
    float2 _611 = float2(_181, _183);
    float2 _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_611, float2(0.0), isnan(_611))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_611, float2(0.0), isnan(_611))).xz;
    float _203 = _201.x;
    float _205 = _201.y;
    float _207 = floor(_173);
    float _209 = -_185;
    float _211 = _167 + _209;
    float _213 = -_191;
    float _215 = _169 + _213;
    float2 _635 = float2(_211, _215);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_635, float2(0.0), isnan(_635))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_635, float2(0.0), isnan(_635))).z;
    float _219 = -_207;
    float _221 = _173 + _219;
    float2 _648 = float2(_195, _221);
    float _223 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_648, float2(0.0), isnan(_648))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_648, float2(0.0), isnan(_648))).x;
    float _225 = -_75;
    float _227 = _225 + 1.0;
    float _229 = in.m_42.y;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _237 = _235 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _239 = fma(_77, _227, _75);
    float _241 = _227 * _77;
    float _243 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _245 = _243 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _247 = fma(_67, _237, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _249 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _251 = _249 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _253 = fma(_227, _239, _75);
    float _255 = _247 * _241;
    float _257 = 1.0 / _239;
    float _259 = in.m_42.x;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = fma(_67, _245, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _267 = fma(_67, _251, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _269 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _271 = _269 + (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _273 = in.m_42.w;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _281 = _279 + (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _283 = _265 * _241;
    float _285 = _267 * _241;
    float _287 = _63 * _233;
    float _289 = precise::min(_203, _197);
    float _291 = fma(_205, _271, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _293 = in.m_42.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = fma(_205, _281, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _301 = fma(_75, _291, _283);
    float _303 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _305 = _303 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _307 = fma(_75, _299, _285);
    float _309 = _301 * _257;
    float _311 = fma(_205, _305, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _313 = _307 * _257;
    float _315 = fma(_75, _311, _255);
    float _317 = precise::min(_217, _289);
    float _319 = -_73;
    float _321 = _319 + 1.0;
    float _323 = _315 * _257;
    float _325 = -_317;
    float _327 = _325 + 1.0;
    float _329 = _223 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _331 = fma(_253, _327, _317);
    float _333 = _223 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _335 = _223 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _337 = fma(_75, _329, _309);
    float _339 = fma(_75, _333, _323);
    float _341 = fma(_331, _321, _73);
    float _343 = fma(_75, _335, _313);
    float _345 = _331 * _321;
    float _347 = _339 + _317;
    float _349 = 1.0 / _341;
    float _351 = _337 + _317;
    float _353 = _343 + _317;
    float _355 = _347 * _345;
    float _357 = _63 * _263;
    float _359 = _351 * _345;
    float _361 = _353 * _345;
    float _363 = _63 * _297;
    float _365 = _63 * _277;
    float _367 = fma(_73, _357, _355);
    float _369 = fma(_73, _287, _359);
    float _371 = fma(_73, _363, _361);
    float _373 = _365 * _341;
    float _375 = _367 * _349;
    float _377 = _369 * _349;
    float _379 = _371 * _349;
    out.m_36.x = _375;
    out.m_36.y = _377;
    out.m_36.z = _379;
    out.m_36.w = _373;
    return out;
}

