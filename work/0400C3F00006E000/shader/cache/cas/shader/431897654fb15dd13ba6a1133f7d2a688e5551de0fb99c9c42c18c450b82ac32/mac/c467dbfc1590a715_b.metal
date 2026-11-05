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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
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
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_43 [[user(locn2), flat]];
    float4 m_37 [[user(locn3), flat]];
    float4 m_47 [[user(locn4)]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_41 [[user(locn6)]];
    float4 m_35 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _81 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _79);
    float _83 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _81);
    float _85 = 1.0 / _59;
    float _87 = _85 * _65;
    float _89 = _85 * _71;
    float _91 = _85 * _77;
    float _93 = _87 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _95 = _87 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[2].x, _93);
    float _99 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _101 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _103 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[2].z, _97);
    float _105 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _99);
    float _107 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _101);
    float _109 = _87 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _111 = _103 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _113 = in.m_37.x;
    float _115 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _107);
    float _117 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[0].x, _109);
    float _119 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[1].x, _95);
    float _121 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _105);
    float _123 = 1.0 / _111;
    float _125 = in.m_39.x;
    float _127 = _115 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _129 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[1].z, _119);
    float _131 = in.m_39.y;
    float _133 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[0].z, _117);
    float _135 = _83 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _137 = _129 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _139 = _121 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _141 = _133 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _143 = _127 * _123;
    float _145 = -_135;
    float _147 = fma(_137, _143, _145);
    float _149 = -_139;
    float _151 = fma(_141, _143, _149);
    float _153 = _147 * _147;
    float _155 = -_113;
    float _157 = _155 + 1.0;
    float _159 = fma(_151, _151, _153);
    float _161 = _157 * _157;
    float _163 = sqrt(_159);
    float _165 = fma(_161, 0.300000011920928955078125, _125);
    float _167 = fma(_161, 0.300000011920928955078125, _131);
    float _169 = _165 * 0.4000000059604644775390625;
    float _171 = _167 * (-0.0500000007450580596923828125);
    float _173 = _163 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _175 = fma(_173, 0.0500000007450580596923828125, _169);
    float _177 = fma(_173, 0.02999999932944774627685546875, _171);
    float2 _763 = float2(0.0, _175);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_763, float2(0.0), isnan(_763))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_763, float2(0.0), isnan(_763))).w;
    float2 _772 = float2(0.0, _177);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_772, float2(0.0), isnan(_772))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_772, float2(0.0), isnan(_772))).w;
    float _183 = in.m_41.y;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_41.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_43.x;
    float _197 = in.m_45.w;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_47.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = _85 * _187;
    float _211 = _85 * _193;
    float _213 = in.m_49.w;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = 1.0 / _195;
    float _221 = _209 + (-0.5);
    float _223 = _211 + (-0.5);
    float _225 = _221 * _221;
    float _227 = fma(_223, _223, _225);
    float _229 = sqrt(_227);
    float _231 = _163 * _219;
    float _233 = _229 * 2.22222232818603515625;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = fma(_235, -2.0, 3.0);
    float _239 = _235 * _235;
    float _241 = _237 * _239;
    float _243 = _85 * _201;
    float _245 = -_243;
    float _247 = _245 + 1.0;
    float _249 = _147 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _251 = _151 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _253 = _249 * 0.707106769084930419921875;
    float _255 = _179 + _181;
    float _257 = _85 * _217;
    float _259 = _85 * _207;
    float _261 = _255 * 0.5;
    bool _265 = _261 >= _247;
    bool _267 = isnan(_261);
    bool _269 = _265 || _267;
    bool _271 = isnan(_247);
    bool _273 = _269 || _271;
    bool _275 = _231 < 0.800000011920928955078125;
    bool _277 = _275 && _273;
    float _279 = float(_277);
    float _281 = _279 * _257;
    float _283 = _281 * _241;
    float _285 = 0.0 + _283;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = _287 * _259;
    bool _291 = _289 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _293 = isnan(_289);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _299 = _295 || _297;
    float _301 = -_253;
    float _303 = fma(_251, 0.707106769084930419921875, _301);
    float _305 = fma(_251, 0.707106769084930419921875, _253);
    if (!_299)
    {
        discard_fragment();
    }
    float2 _949 = float2(_303, _305);
    float _307 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_949, float2(0.0), isnan(_949))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_949, float2(0.0), isnan(_949))).w;
    float _309 = _261 * _243;
    float _311 = _255 * 0.3499999940395355224609375;
    float _313 = _309 * 5.0;
    float _315 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _317 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _315;
    float _319 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _321 = _319 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _323 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _325 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _323;
    float _327 = floor(_313);
    float _329 = 1.0 / _317;
    float _331 = 1.0 / _321;
    float _333 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _335 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _333;
    float _337 = 1.0 / _325;
    float _339 = -_307;
    float _341 = _339 + 1.0;
    bool _343 = _311 >= _341;
    bool _345 = isnan(_311);
    bool _347 = _343 || _345;
    bool _349 = isnan(_341);
    bool _351 = _347 || _349;
    float _353 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _355 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _353;
    float _357 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _359 = _357 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    bool _361 = !_351;
    float _363 = _361 ? 0.0 : 0.25;
    float _365 = fma(_327, 0.20000000298023223876953125, _363);
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _371 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _369;
    float _373 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _375 = _367 + _373;
    bool _377 = _367 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _379 = isnan(_367);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _375 * _329;
    float _391 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _393 = _367 + _391;
    float _395 = -_387;
    float _397 = _395 + 1.0;
    float _399 = fma(_335, _389, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _401 = _393 * _331;
    float _403 = fma(_355, _389, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _405 = fma(_371, _389, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _407 = _367 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _409 = isnan(_367);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _421 = _367 + _419;
    bool _423 = _367 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _425 = isnan(_367);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = fma(_359, _401, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    bool _437 = _367 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _439 = isnan(_367);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = _421 * _337;
    float _451 = -_417;
    float _453 = _451 + 1.0;
    float _455 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _457 = _455 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _459 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _461 = _459 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _463 = -_433;
    float _465 = _463 + 1.0;
    float _467 = _447 * _453;
    float _469 = fma(_457, _401, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _471 = fma(_461, _401, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _473 = _387 * _465;
    float _475 = _417 * _397;
    float _477 = _405 * _467;
    float _479 = _403 * _467;
    float _481 = -_447;
    float _483 = _481 + 1.0;
    float _485 = _399 * _467;
    float _487 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _489 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _487;
    float _491 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _493 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _491;
    float _495 = fma(_483, (*spvDescriptorSet0.fp_c9)._m0[107].x, _479);
    float _497 = fma(_483, (*spvDescriptorSet0.fp_c9)._m0[107].y, _485);
    float _499 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _501 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _499;
    float _503 = fma(_483, (*spvDescriptorSet0.fp_c9)._m0[107].z, _477);
    float _505 = fma(_489, _449, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _507 = fma(_435, _475, _495);
    float _509 = fma(_493, _449, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _511 = fma(_469, _475, _497);
    float _513 = fma(_501, _449, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _515 = fma(_471, _475, _503);
    float _517 = fma(_505, _473, _507);
    float _519 = fma(_509, _473, _511);
    float _521 = fma(_513, _473, _515);
    float _523 = fma(_433, (*spvDescriptorSet0.fp_c9)._m0[110].x, _517);
    float _525 = fma(_433, (*spvDescriptorSet0.fp_c9)._m0[110].y, _519);
    float _527 = fma(_433, (*spvDescriptorSet0.fp_c9)._m0[110].z, _521);
    if (!_299)
    {
        out.m_52.x = _523;
        out.m_52.y = _525;
        out.m_52.z = _527;
        out.m_52.w = _283;
        return out;
    }
    float _529 = 0.0 + _289;
    float _531 = precise::clamp(_529, 0.0, 1.0);
    out.m_52.x = _523;
    out.m_52.y = _525;
    out.m_52.z = _527;
    out.m_52.w = _531;
    return out;
}

