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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_58 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
    float4 m_56 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_37.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_37.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _65;
    float _93 = _91 * _71;
    float _95 = _91 * _77;
    float _97 = _91 * _83;
    float _99 = _91 * _89;
    float2 _524 = float2(_93, _95);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_524, float2(0.0), isnan(_524))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_524, float2(0.0), isnan(_524))).w;
    float2 _535 = float2(_97, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_535, float2(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_535, float2(0.0), isnan(_535))).w;
    float _105 = in.m_39.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_39.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_39.z;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_41.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_41.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_43.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_41.z;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_45.w;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = _91 * _109;
    float _155 = _91 * _115;
    float _157 = _91 * _121;
    float _159 = _91 * _127;
    float _161 = _153 * _153;
    float _163 = in.m_47.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = fma(_155, _155, _161);
    float _171 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _173 = _171 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _175 = fma(_157, _157, _169);
    float _177 = 1.0 / _173;
    float _179 = rsqrt(_175);
    float _181 = _153 * _179;
    float _183 = _155 * _179;
    float _185 = _157 * _179;
    float _187 = _159 * _181;
    float _189 = _91 * _133;
    float _191 = in.m_49.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = fma(_189, _183, _187);
    float _199 = _91 * _139;
    float _201 = _91 * _145;
    float _203 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _205 = _199 + _203;
    float _207 = fma(_201, _185, _197);
    float _209 = _205 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _211 = _91 * _151;
    float _213 = abs(_207);
    float _215 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _217 = _213 + _215;
    float _219 = -_209;
    float _221 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.0500000007450580596923828125, _219);
    float _223 = _217 * _177;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = _221 * 0.15915493667125701904296875;
    float _229 = in.m_51.x;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = fma(_225, -2.0, 3.0);
    float _237 = _225 * _225;
    float _239 = _235 * _237;
    float _241 = _91 * _195;
    float _243 = in.m_47.y;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_49.y;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_47.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = _211 * _101;
    float _263 = _227 * 6.283185482025146484375;
    float _265 = sin(_263);
    float _267 = _103 * _261;
    float _269 = _91 * _167;
    float _271 = _269 * _267;
    float _273 = precise::max(_271, 0.100000001490116119384765625);
    float _275 = precise::min(_273, 0.300000011920928955078125);
    float _277 = 0.0 + _265;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = fma(_275, 4.999999523162841796875, -0.4999999701976776123046875);
    float _283 = _279 * _279;
    float _285 = _91 * _233;
    float _287 = _281 * _283;
    float _289 = _241 * _287;
    float _291 = 0.0 + _289;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = _293 * _239;
    float _297 = _295 * _285;
    bool _301 = _297 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _303 = isnan(_297);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _309 = _305 || _307;
    float _311 = in.m_49.x;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_47.x;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_49.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    if (!_309)
    {
        discard_fragment();
    }
    float _329 = _91 * _253;
    float _331 = _91 * _247;
    float _333 = -_329;
    float _335 = _333 + _331;
    float _337 = _91 * _315;
    float _339 = _91 * _321;
    float _341 = _91 * _327;
    float _343 = _91 * _259;
    float _345 = -_337;
    float _347 = _345 + _339;
    float _349 = -_341;
    float _351 = _349 + _343;
    float _353 = fma(_289, _347, _337);
    float _355 = fma(_289, _335, _329);
    float _357 = fma(_289, _351, _341);
    if (!_309)
    {
        out.m_54.x = _353;
        out.m_54.y = _355;
        out.m_54.z = _357;
        out.m_54.w = _289;
        return out;
    }
    float _359 = _355 * 0.715200006961822509765625;
    float _361 = in.m_56.w;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_56.z;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_56.x;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = fma(_353, 0.2125999927520751953125, _359);
    float _381 = in.m_56.y;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = fma(_357, 0.072200000286102294921875, _379);
    bool _389 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _391 = 1.0 / _387;
    float _393 = _391 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = _91 * _365;
    float _399 = fma(_395, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _401 = _91 * _371;
    float _403 = _399 * _397;
    float _405 = 0.0 + _297;
    float _407 = precise::clamp(_405, 0.0, 1.0);
    float _409 = _91 * _377;
    float _411 = _91 * _385;
    float _413 = fma(_357, _403, _401);
    float _415 = fma(_353, _403, _409);
    float _417 = fma(_355, _403, _411);
    float _419 = _401;
    if (!_389)
    {
        _419 = _407;
    }
    float _421 = _419;
    bool _423 = !_389;
    float _425 = _421;
    if (!_423)
    {
        float _427 = in.m_58.w;
        float _429 = gl_FragCoord.w;
        float _431 = _427 * _429;
        float _433 = in.m_58.z;
        float _435 = gl_FragCoord.w;
        float _437 = _433 * _435;
        float _439 = _91 * _431;
        float _441 = _91 * _437;
        float _443 = 1.0 / _439;
        float _445 = _441 * _443;
        float _447 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _449 = fma(_445, (*spvDescriptorSet0.fp_c8)._m0[30].w, _447);
        float _451 = 1.0 / _449;
        float _453 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _455 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _457 = fma(_451, _453, _455);
        float _459 = _457 * 8.0;
        float _461 = precise::clamp(_459, 0.0, 1.0);
        float _463 = _407 * _461;
        _425 = _463;
    }
    float _465 = _425;
    float _467 = 0.0 + _465;
    float _469 = precise::clamp(_467, 0.0, 1.0);
    out.m_54.x = _415;
    out.m_54.y = _417;
    out.m_54.z = _413;
    out.m_54.w = _469;
    return out;
}

