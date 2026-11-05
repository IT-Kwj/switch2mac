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
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_39.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _83 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _81);
    float _85 = 1.0 / _61;
    float _87 = _85 * _67;
    float _89 = _85 * _73;
    float _91 = _85 * _79;
    float _93 = _87 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _95 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[2].x, _93);
    float _97 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[2].z, _95);
    float _99 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _83);
    float _101 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _103 = _97 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _105 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _107 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _109 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _101);
    float _111 = _87 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _113 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _105);
    float _115 = 1.0 / _103;
    float _117 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _107);
    float _119 = _87 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _121 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _113);
    float _123 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _109);
    float _125 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _117);
    float _127 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[0].x, _111);
    float _129 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[1].x, _119);
    float _131 = rsqrt(_99);
    float _133 = _125 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _135 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[0].z, _127);
    float _137 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[1].z, _129);
    float _139 = _121 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _141 = _123 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _143 = _135 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _145 = _137 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _147 = _133 * _115;
    float _149 = -_139;
    float _151 = fma(_143, _147, _149);
    float _153 = -_147;
    float _155 = fma(_145, _153, _141);
    float _157 = _131 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _159 = fma(_151, _157, 0.5);
    float _161 = fma(_155, _157, 0.5);
    float2 _702 = float2(_159, _161);
    float2 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_702, float2(0.0), isnan(_702))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_702, float2(0.0), isnan(_702))).xw;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = in.m_41.w;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_41.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_41.y;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_43.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_43.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = _85 * _175;
    float _203 = _85 * _181;
    float _205 = _85 * _187;
    float _207 = _85 * _193;
    float _209 = 1.0 / _201;
    float _211 = _203 * _209;
    float _213 = _205 * _209;
    float _215 = _85 * _199;
    float2 _775 = float2(_211, _213);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_775, float2(0.0), isnan(_775))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_775, float2(0.0), isnan(_775))).x;
    float _219 = fma(_169, (*spvDescriptorSet0.fp_c9)._m0[194].w, _207);
    float2 _788 = float2(_215, _219);
    float2 _221 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_788, float2(0.0), isnan(_788))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_788, float2(0.0), isnan(_788))).xw;
    float _223 = _221.x;
    float _225 = _221.y;
    float _227 = in.m_41.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = _155 * _131;
    float _235 = _151 * _131;
    float _237 = in.m_45.x;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = _233 * _233;
    float _245 = fma(_235, _235, _243);
    float _247 = sqrt(_245);
    float _249 = _85 * _231;
    float _251 = _249 * _209;
    float _253 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _255 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _257 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[30].w, _255);
    float _259 = 0.0 + _247;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = -_261;
    float _265 = _263 + 1.0;
    float _267 = 1.0 / _257;
    float _269 = _265 * _265;
    float _271 = fma(_269, 0.39999997615814208984375, 0.60000002384185791015625);
    float _273 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _275 = fma(_217, (*spvDescriptorSet0.fp_c8)._m0[30].w, _273);
    float _277 = 1.0 / _275;
    float _279 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _281 = _267 * _279;
    float _283 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _285 = -_281;
    float _287 = fma(_277, _283, _285);
    float _289 = _287 * _253;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = in.m_47.x;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_47.y;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_47.z;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = _167 * _167;
    float _313 = _85 * _297;
    float _315 = _85 * _309;
    float _317 = _225 * _271;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = _85 * _241;
    float _323 = _319 * _291;
    float _325 = _323 * _321;
    bool _329 = _325 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _331 = isnan(_325);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _337 = _333 || _335;
    float _339 = in.m_49.x;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_49.y;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_49.z;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = _281;
    if (!_337)
    {
        discard_fragment();
    }
    float _359 = _223 * _223;
    float _361 = _311 * _359;
    float _363 = _85 * _303;
    float _365 = _85 * _343;
    float _367 = _85 * _349;
    float _369 = _85 * _355;
    float _371 = -_365;
    float _373 = _371 + _313;
    float _375 = fma(_361, _269, _269);
    float _377 = _269 * _269;
    float _379 = -_367;
    float _381 = _379 + _363;
    float _383 = -_369;
    float _385 = _383 + _315;
    float _387 = fma(_375, _373, _365);
    float _389 = _377 * _377;
    float _391 = _389 * 0.25;
    float _393 = fma(_375, _381, _367);
    float _395 = fma(_375, _385, _369);
    float _397 = fma(_391, (*spvDescriptorSet0.fp_c9)._m0[106].x, _387);
    float _399 = fma(_391, (*spvDescriptorSet0.fp_c9)._m0[106].x, _393);
    float _401 = fma(_391, (*spvDescriptorSet0.fp_c9)._m0[106].x, _395);
    if (!_337)
    {
        out.m_52.x = _397;
        out.m_52.y = _399;
        out.m_52.z = _401;
        out.m_52.w = _319;
        return out;
    }
    float _403 = _399 * 0.715200006961822509765625;
    float _405 = in.m_54.w;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_54.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_54.y;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = fma(_397, 0.2125999927520751953125, _403);
    float _425 = in.m_54.z;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = fma(_401, 0.072200000286102294921875, _423);
    bool _433 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _435 = 1.0 / _431;
    float _437 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_433)
    {
        float _439 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _441 = _281 + _439;
        _357 = _441;
    }
    float _443 = _357;
    float _445 = _435 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    float _449 = fma(_447, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _451 = _85 * _409;
    if (_433)
    {
        float _453 = _443 * 8.0;
        float _455 = precise::clamp(_453, 0.0, 1.0);
        _437 = _455;
    }
    float _457 = _437;
    float _459 = _85 * _415;
    float _461 = _85 * _421;
    float _463 = _449 * _451;
    float _465 = 0.0 + _325;
    float _467 = precise::clamp(_465, 0.0, 1.0);
    float _469 = _85 * _429;
    float _471 = fma(_397, _463, _459);
    float _473 = _467;
    if (_433)
    {
        float _475 = _467 * _457;
        _473 = _475;
    }
    float _477 = _473;
    float _479 = fma(_399, _463, _461);
    float _481 = fma(_401, _463, _469);
    float _483 = 0.0 + _477;
    float _485 = precise::clamp(_483, 0.0, 1.0);
    out.m_52.x = _471;
    out.m_52.y = _479;
    out.m_52.z = _481;
    out.m_52.w = _485;
    return out;
}

