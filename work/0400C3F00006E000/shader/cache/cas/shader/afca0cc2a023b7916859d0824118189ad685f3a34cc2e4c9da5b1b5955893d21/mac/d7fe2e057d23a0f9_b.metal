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
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_50 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _73 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _71);
    float _75 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _73);
    float _77 = sqrt(_75);
    float _79 = 1.0 / _57;
    float _81 = _79 * _63;
    float _83 = _79 * _69;
    float _85 = _81 * _77;
    float2 _420 = float2(_85, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_420, float2(0.0), isnan(_420))).w;
    float _89 = ceil(_85);
    float _91 = in.m_39.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_39.z;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_41.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _89 * 91.22280120849609375;
    float _111 = _109 * 0.15915493667125701904296875;
    float _113 = _111 * 6.283185482025146484375;
    float _115 = sin(_113);
    float _117 = _79 * _95;
    float _119 = 1.0 / _117;
    float _121 = _115 * 43758.546875;
    float _123 = floor(_121);
    float _125 = -_123;
    float _127 = _121 + _125;
    float _129 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _131 = _79 * _101;
    float _133 = _129 + _127;
    float _135 = fma(_127, 2.0, 0.5);
    float _137 = _131 * _119;
    float _139 = in.m_43.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = _133 * 6.283185482025146484375;
    float _147 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _149 = fma(_137, (*spvDescriptorSet0.fp_c8)._m0[30].w, _147);
    float _151 = _145 * _135;
    float _153 = 1.0 / _149;
    float _155 = _151 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _157 = _155 * 0.15915493667125701904296875;
    float _159 = _157 * 6.283185482025146484375;
    float _161 = sin(_159);
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _165 = _153 * _163;
    float _167 = precise::max(_165, 1.0);
    float _169 = precise::min(_167, 5.0);
    float _171 = fma(_161, -0.20000000298023223876953125, 0.699999988079071044921875);
    float _173 = fma(_161, 0.20000000298023223876953125, 0.300000011920928955078125);
    float _175 = 1.0 / _171;
    float _177 = precise::max(_83, _173);
    float _179 = precise::min(_177, 1.0);
    float _181 = -_173;
    float _183 = _181 + _179;
    float _185 = _183 * _175;
    float _187 = _87 * _185;
    float _189 = _79 * _143;
    float _191 = fma(_169, 0.25, -0.25);
    float _193 = _189 * _187;
    float _195 = _79 * _107;
    float _197 = _193 * _191;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = _199 * _195;
    bool _205 = _201 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _207 = isnan(_201);
    bool _209 = _205 || _207;
    bool _211 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _213 = _209 || _211;
    float _215 = in.m_45.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    if (!_213)
    {
        discard_fragment();
    }
    float _221 = _79 * _219;
    float _223 = abs(_221);
    float _225 = fma(_223, 0.0199999995529651641845703125, _129);
    float _227 = in.m_37.y;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = _79 * _231;
    float2 _636 = float2(_233, _225);
    float3 _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_636, float2(0.0), isnan(_636))).xyz;
    float _239 = _237.x;
    float _241 = _237.y;
    float _243 = _237.z;
    float _245 = in.m_43.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_43.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_43.z;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = _79 * _249;
    float _265 = _79 * _255;
    float _267 = _79 * _261;
    float _269 = _239 * _263;
    float _271 = _241 * _265;
    float _273 = _243 * _267;
    if (!_213)
    {
        out.m_48.x = _269;
        out.m_48.y = _271;
        out.m_48.z = _273;
        out.m_48.w = _199;
        return out;
    }
    float _275 = _271 * 0.715200006961822509765625;
    float _277 = in.m_50.w;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_50.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_50.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = fma(_269, 0.2125999927520751953125, _275);
    float _297 = in.m_50.z;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = fma(_273, 0.072200000286102294921875, _295);
    bool _305 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _307 = 1.0 / _303;
    float _309 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_305)
    {
        float _311 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _313 = _165 + _311;
        _309 = _313;
    }
    float _315 = _309;
    float _317 = _307 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = fma(_319, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _323 = _79 * _281;
    float _325 = 0.0 + _201;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _79 * _293;
    float _331 = _321 * _323;
    float _333 = _323;
    float _335 = _327;
    if (_305)
    {
        float _337 = _315 * 8.0;
        float _339 = precise::clamp(_337, 0.0, 1.0);
        _333 = _339;
    }
    float _341 = _333;
    float _343 = _79 * _287;
    float _345 = _79 * _301;
    if (_305)
    {
        float _347 = _327 * _341;
        _335 = _347;
    }
    float _349 = _335;
    float _351 = fma(_269, _331, _343);
    float _353 = fma(_271, _331, _329);
    float _355 = fma(_273, _331, _345);
    float _357 = 0.0 + _349;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    out.m_48.x = _351;
    out.m_48.y = _353;
    out.m_48.z = _355;
    out.m_48.w = _359;
    return out;
}

