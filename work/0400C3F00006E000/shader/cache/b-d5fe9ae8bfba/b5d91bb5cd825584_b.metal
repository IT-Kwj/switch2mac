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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_43 [[user(locn5), flat]];
    float4 m_51 [[user(locn7)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_39.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _445 = float2(_79, _81);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_445, float2(0.0), isnan(_445))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_445, float2(0.0), isnan(_445))).w;
    float _85 = in.m_41.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_41.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_41.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_39.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_39.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_43.x;
    float _117 = _77 * _89;
    float _119 = _77 * _95;
    float _121 = _77 * _101;
    float _123 = 1.0 / _117;
    float _125 = _77 * _113;
    float _127 = _119 * _123;
    float _129 = _121 * _123;
    float _131 = fma(_83, 2.0, -1.0);
    float _133 = _77 * _107;
    float _135 = fma(_131, _115, _133);
    float _137 = fma(_131, _115, _125);
    float2 _530 = float2(_127, _129);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_530, float2(0.0), isnan(_530))).x;
    float2 _538 = float2(_135, _137);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_538, float2(0.0), isnan(_538))).w;
    float _143 = in.m_41.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_45.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = _77 * _147;
    float _157 = in.m_47.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = _155 * _123;
    float _165 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _167 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _169 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[30].w, _167);
    float _171 = 1.0 / _169;
    float _173 = _77 * _153;
    float _175 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _177 = _171 * _175;
    float _179 = in.m_49.x;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _187 = fma(_139, (*spvDescriptorSet0.fp_c8)._m0[30].w, _185);
    float _189 = _173 * _141;
    float _191 = 1.0 / _187;
    float _193 = 0.0 + _189;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _199 = -_177;
    float _201 = fma(_191, _197, _199);
    float _203 = _201 * _165;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = _77 * _161;
    float _209 = _195 * _205;
    float _211 = _209 * _207;
    bool _215 = _211 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _217 = isnan(_211);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _223 = _219 || _221;
    float _225 = in.m_51.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_51.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _177;
    if (!_223)
    {
        discard_fragment();
    }
    float _239 = _77 * _229;
    float _241 = _77 * _235;
    float _243 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _245 = _239 + _243;
    float _247 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _249 = _241 + _247;
    float _251 = _245 * _245;
    float _253 = fma(_249, _249, _251);
    float _255 = sqrt(_253);
    float _257 = fma(_255, -0.16666667163372039794921875, 1.33333337306976318359375);
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = in.m_45.y;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = fma(_259, -2.0, 3.0);
    float _269 = _259 * _259;
    float _271 = _267 * _269;
    float _273 = _77 * _183;
    float _275 = in.m_45.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = _271 * (*spvDescriptorSet0.fp_c10)._m0[13].z;
    float _283 = in.m_49.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = _77 * _279;
    float _291 = -_289;
    float _293 = _291 + _273;
    float _295 = fma(_281, _293, _289);
    float _297 = _77 * _265;
    float _299 = _77 * _287;
    float _301 = in.m_49.z;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = -_297;
    float _309 = _307 + _299;
    float _311 = fma(_281, _309, _297);
    float _313 = in.m_45.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = _77 * _305;
    float _321 = _77 * _317;
    float _323 = -_321;
    float _325 = _323 + _319;
    float _327 = fma(_281, _325, _321);
    if (!_223)
    {
        out.m_54.x = _295;
        out.m_54.y = _311;
        out.m_54.z = _327;
        out.m_54.w = _189;
        return out;
    }
    float _329 = _311 * 0.715200006961822509765625;
    float _331 = in.m_56.w;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_56.x;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_56.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = fma(_295, 0.2125999927520751953125, _329);
    float _351 = in.m_56.z;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = fma(_327, 0.072200000286102294921875, _349);
    bool _359 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _361 = 1.0 / _357;
    float _363 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_359)
    {
        float _365 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _367 = _177 + _365;
        _237 = _367;
    }
    float _369 = _237;
    float _371 = _361 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = fma(_373, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _377 = _77 * _335;
    if (_359)
    {
        float _379 = _369 * 8.0;
        float _381 = precise::clamp(_379, 0.0, 1.0);
        _363 = _381;
    }
    float _383 = _363;
    float _385 = _77 * _347;
    float _387 = _375 * _377;
    float _389 = 0.0 + _211;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    float _393 = _77 * _341;
    float _395 = _77 * _355;
    float _397 = fma(_311, _387, _385);
    float _399 = _391;
    if (_359)
    {
        float _401 = _391 * _383;
        _399 = _401;
    }
    float _403 = _399;
    float _405 = fma(_295, _387, _393);
    float _407 = fma(_327, _387, _395);
    float _409 = 0.0 + _403;
    float _411 = precise::clamp(_409, 0.0, 1.0);
    out.m_54.x = _405;
    out.m_54.y = _397;
    out.m_54.z = _407;
    out.m_54.w = _411;
    return out;
}

