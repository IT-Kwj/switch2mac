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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c8 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_34Smplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_60 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_43.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_43.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _69;
    float _85 = _83 * _75;
    float _87 = _83 * _81;
    float2 _531 = float2(_85, _87);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).w;
    float _91 = in.m_45.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_45.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_43.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_43.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_47.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_47.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _83 * _95;
    float _129 = _83 * _101;
    float _131 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.00200000009499490261077880859375, _127);
    float _133 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, -0.00200000009499490261077880859375, _127);
    float _135 = _129 + (-0.5);
    float _137 = _83 * _125;
    float _139 = _131 + (-0.5);
    float _141 = _133 + (-0.5);
    float _143 = -_135;
    float _145 = fma(_139, -8.7422776573475857730954885482788e-08, _143);
    float _147 = -_135;
    float _149 = fma(_141, -8.7422776573475857730954885482788e-08, _147);
    float _151 = fma(_129, -8.7422776573475857730954885482788e-08, 4.3711388286737928865477442741394e-08);
    float _153 = _145 + 0.5;
    float _155 = _149 + 0.5;
    float _157 = -_151;
    float _159 = -_141;
    float _161 = _157 + _159;
    float _163 = -_139;
    float _165 = -_151;
    float _167 = _163 + _165;
    float _169 = _161 + 0.5;
    float _171 = _167 + 0.5;
    float _173 = fma(_89, 0.4000000059604644775390625, _153);
    float _175 = _83 * _107;
    float _177 = fma(_89, 0.4000000059604644775390625, _155);
    float _179 = _83 * _113;
    float _181 = _83 * _119;
    float2 _666 = float2(_171, _173);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_666, float2(0.0), isnan(_666))).w;
    float2 _674 = float2(_169, _177);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_674, float2(0.0), isnan(_674))).w;
    float2 _682 = float2(_175, _179);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_682, float2(0.0), isnan(_682))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_682, float2(0.0), isnan(_682))).w;
    float2 _690 = float2(_137, _181);
    float _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_690, float2(0.0), isnan(_690))).w;
    float _191 = in.m_49.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_51.w;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_53.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = _83 * _195;
    float _211 = _209 * _209;
    float _213 = _83 * _201;
    float _215 = in.m_51.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_55.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_51.y;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_51.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _83 * _231;
    float _241 = _183 * _185;
    float _243 = _187 * _187;
    float _245 = _211 * _211;
    float _247 = _241 * _243;
    float _249 = fma(_247, 10.0, _245);
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = _213 + 0.300000011920928955078125;
    float _255 = precise::max(_213, _251);
    float _257 = precise::min(_253, _255);
    float _259 = fma(_243, _243, _189);
    float _261 = -_213;
    float _263 = _261 + _257;
    float _265 = fma(_259, 0.64999997615814208984375, 0.3499999940395355224609375);
    float _267 = _263 * 3.3333332538604736328125;
    float _269 = _267 * _265;
    float _271 = _83 * _207;
    float _273 = 0.0 + _269;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = _275 * _271;
    bool _281 = _277 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _283 = isnan(_277);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _289 = _285 || _287;
    float _291 = in.m_55.w;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    if (!_289)
    {
        discard_fragment();
    }
    float _297 = in.m_55.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_55.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = -(*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _311 = _309 + 1.0;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = precise::max(_313, 0.5);
    float _317 = _83 * _295;
    float _319 = precise::min(_315, 0.75);
    float _321 = _317 + 0.4000000059604644775390625;
    float _323 = precise::max(_317, _251);
    float _325 = precise::min(_321, _323);
    float _327 = -_317;
    float _329 = _327 + _325;
    float _331 = _329 * 2.5;
    float _333 = _83 * _219;
    float _335 = _83 * _307;
    float _337 = -_331;
    float _339 = _187 + _337;
    float _341 = fma(_339, 0.60000002384185791015625, _331);
    float _343 = _83 * _301;
    float _345 = _83 * _225;
    float _347 = _83 * _237;
    float _349 = -_343;
    float _351 = _349 + _333;
    float _353 = -_345;
    float _355 = _353 + _239;
    float _357 = -_335;
    float _359 = _357 + _347;
    float _361 = fma(_341, _351, _343);
    float _363 = fma(_341, _355, _345);
    float _365 = fma(_341, _359, _335);
    float _367 = fma(_319, -4.0, 3.0);
    float _369 = -_361;
    float _371 = fma(_361, (*spvDescriptorSet0.fp_c9)._m0[194].y, _369);
    float _373 = -_363;
    float _375 = fma(_363, (*spvDescriptorSet0.fp_c9)._m0[194].z, _373);
    float _377 = -_365;
    float _379 = fma(_365, (*spvDescriptorSet0.fp_c9)._m0[194].w, _377);
    float _381 = fma(_367, _371, _361);
    float _383 = fma(_367, _375, _363);
    float _385 = fma(_367, _379, _365);
    if (!_289)
    {
        out.m_58.x = _381;
        out.m_58.y = _383;
        out.m_58.z = _385;
        out.m_58.w = _269;
        return out;
    }
    float _387 = _383 * 0.715200006961822509765625;
    float _389 = in.m_60.w;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_60.z;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_60.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = fma(_381, 0.2125999927520751953125, _387);
    float _409 = in.m_60.y;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = fma(_385, 0.072200000286102294921875, _407);
    bool _417 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _419 = 1.0 / _415;
    float _421 = _419 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = _83 * _393;
    float _427 = fma(_423, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _429 = _83 * _399;
    float _431 = _427 * _425;
    float _433 = 0.0 + _277;
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = _83 * _405;
    float _439 = _83 * _413;
    float _441 = fma(_385, _431, _429);
    float _443 = fma(_381, _431, _437);
    float _445 = fma(_383, _431, _439);
    float _447 = _429;
    if (!_417)
    {
        _447 = _435;
    }
    float _449 = _447;
    bool _451 = !_417;
    float _453 = _449;
    if (!_451)
    {
        float _455 = in.m_62.w;
        float _457 = gl_FragCoord.w;
        float _459 = _455 * _457;
        float _461 = in.m_62.z;
        float _463 = gl_FragCoord.w;
        float _465 = _461 * _463;
        float _467 = _83 * _459;
        float _469 = _83 * _465;
        float _471 = 1.0 / _467;
        float _473 = _469 * _471;
        float _475 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _477 = fma(_473, (*spvDescriptorSet0.fp_c8)._m0[30].w, _475);
        float _479 = 1.0 / _477;
        float _481 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _483 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _485 = fma(_479, _481, _483);
        float _487 = _485 * 8.0;
        float _489 = precise::clamp(_487, 0.0, 1.0);
        float _491 = _435 * _489;
        _453 = _491;
    }
    float _493 = _453;
    float _495 = 0.0 + _493;
    float _497 = precise::clamp(_495, 0.0, 1.0);
    out.m_58.x = _443;
    out.m_58.y = _445;
    out.m_58.z = _441;
    out.m_58.w = _497;
    return out;
}

