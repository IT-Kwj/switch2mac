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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_53 [[user(locn3), flat]];
    float4 m_41 [[user(locn4)]];
    float4 m_51 [[user(locn5), flat]];
    float4 m_39 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_43 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_39.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_41.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _65;
    float _99 = _97 * _71;
    float _101 = _97 * _77;
    float _103 = _97 * _83;
    float _105 = 1.0 / _99;
    float _107 = _101 * _105;
    float _109 = _103 * _105;
    float _111 = _97 * _89;
    float _113 = _97 * _95;
    float2 _541 = float2(_107, _109);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_541, float2(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_541, float2(0.0), isnan(_541))).x;
    float2 _552 = float2(_111, _113);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_552, float2(0.0), isnan(_552))).w;
    float _119 = in.m_43.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_43.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_43.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_45.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _97 * _123;
    float _145 = _97 * _129;
    float _147 = in.m_39.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _155 = _143 + _153;
    float _157 = _97 * _135;
    float _159 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _161 = _145 + _159;
    float _163 = in.m_47.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _155 * _155;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _173 = _157 + _171;
    float _175 = fma(_161, _161, _169);
    float _177 = fma(_173, _173, _175);
    float _179 = rsqrt(_177);
    float _181 = _97 * _151;
    float _183 = _155 * _179;
    float _185 = _161 * _179;
    float _187 = _181 * _105;
    float _189 = _173 * _179;
    float _191 = _183 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _193 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _195 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[30].w, _193);
    float _197 = fma(_185, (*spvDescriptorSet0.fp_c10)._m0[8].y, _191);
    float _199 = 1.0 / _195;
    float _201 = fma(_189, (*spvDescriptorSet0.fp_c10)._m0[10].y, _197);
    float _203 = precise::max(0.0, _201);
    float _205 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _207 = _97 * _141;
    float _209 = precise::min(_203, 0.25);
    float _211 = _97 * _167;
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _215 = _199 * _213;
    float _217 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _219 = fma(_115, (*spvDescriptorSet0.fp_c8)._m0[30].w, _217);
    float _221 = _117 * _117;
    float _223 = 1.0 / _219;
    float _225 = fma(_209, -4.0, 1.0);
    float _227 = _211 * _221;
    float _229 = _227 * _225;
    float _231 = 0.0 + _229;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _237 = -_215;
    float _239 = fma(_223, _235, _237);
    float _241 = _239 * _205;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = _233 * _243;
    float _247 = _245 * _207;
    bool _251 = _247 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _253 = isnan(_247);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _259 = _255 || _257;
    float _261 = in.m_41.z;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_41.w;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = _247;
    if (!_259)
    {
        discard_fragment();
    }
    float _275 = _97 * _265;
    float _277 = _97 * _271;
    float2 _797 = float2(_275, _277);
    float3 _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_797, float2(0.0), isnan(_797))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_797, float2(0.0), isnan(_797))).xyz;
    float _283 = _281.x;
    float _285 = _281.y;
    float _287 = _281.z;
    float _289 = in.m_49.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_51.y;
    float _297 = in.m_53.x;
    float _299 = in.m_53.y;
    float _301 = in.m_55.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_47.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_55.y;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_47.y;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_55.z;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_47.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = _97 * _293;
    float _339 = fma(_295, 0.007000000216066837310791015625, _299);
    float _341 = fma(_295, 0.02199999988079071044921875, _337);
    float _343 = _97 * _317;
    float _345 = _339 * 6.283185482025146484375;
    float _347 = _341 + _297;
    float _349 = _97 * _311;
    float _351 = _345 * 0.15915493667125701904296875;
    float _353 = _347 * 6.283185482025146484375;
    float _355 = _97 * _329;
    float _357 = _353 * 0.15915493667125701904296875;
    float _359 = _351 * 6.283185482025146484375;
    float _361 = sin(_359);
    float _363 = _97 * _305;
    float _365 = _97 * _323;
    float _367 = _97 * _335;
    float _369 = -_363;
    float _371 = _369 + _349;
    float _373 = -_343;
    float _375 = _373 + _365;
    float _377 = -_355;
    float _379 = _377 + _367;
    float _381 = _357 * 6.283185482025146484375;
    float _383 = sin(_381);
    float _385 = fma(_383, 0.5, 0.5);
    float _387 = fma(_385, _371, _363);
    float _389 = fma(_385, _375, _343);
    float _391 = fma(_385, _379, _355);
    float _393 = fma(_361, 0.5, -0.10000002384185791015625);
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = -_387;
    float _399 = _397 + _283;
    float _401 = -_389;
    float _403 = _401 + _285;
    float _405 = -_391;
    float _407 = _405 + _287;
    float _409 = fma(_395, _399, _387);
    float _411 = fma(_395, _403, _389);
    float _413 = fma(_395, _407, _391);
    float _415 = fma(_409, 0.800000011920928955078125, 0.199999988079071044921875);
    float _417 = fma(_411, 0.800000011920928955078125, 0.199999988079071044921875);
    float _419 = fma(_413, 0.800000011920928955078125, 0.199999988079071044921875);
    float _421 = _387;
    if (!_259)
    {
        out.m_58.x = _415;
        out.m_58.y = _417;
        out.m_58.z = _419;
        out.m_58.w = _229;
        return out;
    }
    float _423 = _417 * 0.715200006961822509765625;
    float _425 = fma(_415, 0.2125999927520751953125, _423);
    float _427 = fma(_419, 0.072200000286102294921875, _425);
    bool _429 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _431 = 1.0 / _427;
    float _433 = 0.0 + _247;
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = _435;
    if (_429)
    {
        float _439 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _441 = _215 + _439;
        _421 = _441;
    }
    float _443 = _421;
    float _445 = _431 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    if (_429)
    {
        float _449 = _443 * 8.0;
        float _451 = precise::clamp(_449, 0.0, 1.0);
        _273 = _451;
    }
    float _453 = _273;
    float _455 = fma(_447, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_429)
    {
        float _457 = _435 * _453;
        _437 = _457;
    }
    float _459 = _437;
    float _461 = _415 * _455;
    float _463 = _417 * _455;
    float _465 = _419 * _455;
    float _467 = 0.0 + _459;
    float _469 = precise::clamp(_467, 0.0, 1.0);
    out.m_58.x = _461;
    out.m_58.y = _463;
    out.m_58.z = _465;
    out.m_58.w = _469;
    return out;
}

