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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_43 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_37 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_37.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _81 = in.m_37.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _53;
    float _89 = _87 * _59;
    float _91 = _87 * _65;
    float _93 = _87 * _71;
    float _95 = _87 * _77;
    float _97 = _87 * _85;
    float _99 = -_91;
    float _101 = _89 + _99;
    float _103 = in.m_37.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = -_95;
    float _111 = _93 + _109;
    float _113 = -_97;
    float _115 = _93 + _113;
    float _117 = _101 * _79;
    float _119 = _111 * _79;
    float _121 = _117 * _117;
    float _123 = fma(_119, _119, _121);
    float _125 = abs(_123);
    float _127 = log2(_125);
    float _129 = _127 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _131 = _87 * _107;
    float _133 = exp2(_129);
    float _135 = _133 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _137 = fma(_119, _135, _93);
    float _139 = fma(_117, _135, _89);
    float _141 = -_131;
    float _143 = _89 + _141;
    float _145 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _147 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _149 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _151 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _155 = fma(_115, _153, _137);
    float2 _634 = float2(_145, _147);
    float2 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_634, float2(0.0), isnan(_634))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_634, float2(0.0), isnan(_634))).xw;
    float _161 = _159.x;
    float _163 = _159.y;
    float2 _650 = float2(_145, _147);
    float2 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_650, float2(0.0), isnan(_650))).xw;
    float _167 = _165.x;
    float _169 = _165.y;
    float2 _662 = float2(_151, _149);
    float2 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_662, float2(0.0), isnan(_662))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_662, float2(0.0), isnan(_662))).xw;
    float _173 = _171.x;
    float _175 = _171.y;
    float2 _674 = float2(_151, _149);
    float2 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_674, float2(0.0), isnan(_674))).xw;
    float _179 = _177.x;
    float _181 = _177.y;
    float _183 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _185 = fma(_143, _183, _139);
    float _187 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _189 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _191 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _193 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float2 _717 = float2(_191, _187);
    float2 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_717, float2(0.0), isnan(_717))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_717, float2(0.0), isnan(_717))).xw;
    float _197 = _195.x;
    float _199 = _195.y;
    float2 _729 = float2(_191, _187);
    float2 _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_729, float2(0.0), isnan(_729))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_729, float2(0.0), isnan(_729))).xw;
    float _203 = _201.x;
    float _205 = _201.y;
    float2 _741 = float2(_189, _193);
    float2 _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_741, float2(0.0), isnan(_741))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_741, float2(0.0), isnan(_741))).xw;
    float _209 = _207.x;
    float _211 = _207.y;
    float2 _753 = float2(_189, _193);
    float2 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_753, float2(0.0), isnan(_753))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_753, float2(0.0), isnan(_753))).xw;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = sqrt(_123);
    float _221 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[26].w;
    float _223 = (*spvDescriptorSet0.fp_c3)._m0[2].y + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _225 = -_161;
    float _227 = _225 + _167;
    float _229 = -_163;
    float _231 = _229 + _169;
    float _233 = -_173;
    float _235 = _233 + _179;
    float _237 = -_175;
    float _239 = _237 + _181;
    float _241 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[25].x, _161);
    float _243 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[25].x, _163);
    float _245 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[25].x, _173);
    float _247 = 1.0 / _223;
    float _249 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[25].x, _175);
    float _251 = -(*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _253 = _219 + _251;
    float _255 = _245 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _257 = -_197;
    float _259 = _257 + _203;
    float _261 = -_199;
    float _263 = _261 + _205;
    float _265 = -_209;
    float _267 = _265 + _215;
    float _269 = -_211;
    float _271 = _269 + _217;
    float _273 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[25].x, _197);
    float _275 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[25].x, _199);
    float _277 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[25].x, _209);
    float _279 = _249 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _281 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[25].x, _211);
    float _283 = _273 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _285 = _253 * _221;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = _275 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _291 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[2].y, _255);
    float _293 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[2].y, _279);
    float _295 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[2].y, _283);
    float _297 = fma(_287, (*spvDescriptorSet0.fp_c3)._m0[27].x, 1.0);
    float _299 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[2].y, _289);
    float _301 = fma(_291, _247, -0.5);
    float _303 = fma(_293, _247, -0.5);
    float _305 = fma(_295, _247, -0.5);
    float _307 = _297 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _309 = fma(_299, _247, -0.5);
    float _311 = fma(_305, _307, _155);
    float _313 = fma(_309, _307, _185);
    float _315 = fma(_301, _307, _137);
    float _317 = fma(_303, _307, _139);
    float2 _944 = float2(_311, _313);
    float _319 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_944, float2(0.0), isnan(_944))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_944, float2(0.0), isnan(_944))).x;
    float2 _952 = float2(_311, _313);
    float _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_952, float2(0.0), isnan(_952))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_952, float2(0.0), isnan(_952))).x;
    float2 _960 = float2(_315, _317);
    float _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_960, float2(0.0), isnan(_960))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_960, float2(0.0), isnan(_960))).x;
    float2 _968 = float2(_315, _317);
    float _325 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_968, float2(0.0), isnan(_968))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_968, float2(0.0), isnan(_968))).x;
    float _327 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _329 = in.m_39.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _337 = _219 + _335;
    float _339 = _143 * _143;
    float _341 = in.m_41.x;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _349 = _219 + _347;
    float _351 = fma(_115, _115, _339);
    float _353 = (*spvDescriptorSet0.fp_c3)._m0[44].w + (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _355 = sqrt(_351);
    float _357 = _337 * _327;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = _359 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _363 = 1.0 / _353;
    float _365 = -_355;
    float _367 = _365 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _369 = precise::max(0.0, _367);
    float _371 = precise::min(_369, 0.5);
    float _373 = _371 * _371;
    float _375 = -_319;
    float _377 = _375 + _321;
    float _379 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, -4.0, _361);
    float _381 = -_323;
    float _383 = _381 + _325;
    float _385 = in.m_43.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = fma(_377, (*spvDescriptorSet0.fp_c3)._m0[25].x, _319);
    float _393 = _379 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _395 = fma(_383, (*spvDescriptorSet0.fp_c3)._m0[25].x, _323);
    float _397 = _361 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _399 = _87 * _345;
    float _401 = _391 + _393;
    float _403 = _87 * _333;
    float _405 = _395 + _397;
    float _407 = -(*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _409 = _399 + _407;
    float _411 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _413 = _403 * _401;
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = _405 * _403;
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = _409 * _363;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _427 = _415 + _425;
    float _429 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _431 = _419 + _429;
    float _433 = precise::max(0.0, _427);
    float _435 = _431 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _437 = precise::clamp(_435, 0.0, 1.0);
    float _439 = precise::min(_433, 0.949999988079071044921875);
    float _441 = _349 * _411;
    float _443 = precise::clamp(_441, 0.0, 1.0);
    float _445 = _439 * 0.20000000298023223876953125;
    float _447 = fma(_445, (*spvDescriptorSet0.fp_c3)._m0[4].y, _437);
    float _449 = _373 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _451 = _447 * _449;
    float _453 = fma(_451, 6.0, _447);
    float _455 = -_423;
    float _457 = _455 + 1.0;
    float _459 = fma(_443, (*spvDescriptorSet0.fp_c3)._m0[8].w, _453);
    float _461 = _87 * _389;
    float _463 = fma(_457, (*spvDescriptorSet0.fp_c3)._m0[45].x, _459);
    float _465 = _463 + _461;
    float _467 = precise::clamp(_465, 0.0, 1.0);
    out.m_46.x = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_46.y = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_46.z = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_46.w = _467;
    return out;
}

