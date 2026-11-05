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
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_41 [[user(locn2), flat]];
    float4 m_39 [[user(locn3), flat]];
    float4 m_52 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_37 [[user(locn6), flat]];
    float4 m_47 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _437 = float2(_75, _77);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_437, float2(0.0), isnan(_437))).w;
    float _81 = in.m_37.z;
    float _83 = in.m_37.w;
    float _85 = in.m_39.y;
    float _87 = in.m_39.x;
    float _89 = in.m_41.x;
    float _91 = in.m_39.z;
    float _93 = in.m_43.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_45.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _81 * 6.283185482025146484375;
    float _107 = _83 * 6.283185482025146484375;
    float _109 = -_85;
    float _111 = _109 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _113 = -_87;
    float _115 = _113 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _117 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.0900000035762786865234375, _105);
    float _119 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.070000000298023223876953125, _107);
    float _121 = _111 * _111;
    float _123 = abs(_89);
    float _125 = log2(_123);
    float _127 = _117 * 0.15915493667125701904296875;
    float _129 = _119 * 0.15915493667125701904296875;
    float _131 = fma(_115, _115, _121);
    float _133 = -_91;
    float _135 = _133 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _137 = _127 * 6.283185482025146484375;
    float _139 = sin(_137);
    float _141 = fma(_135, _135, _131);
    float _143 = _129 * 6.283185482025146484375;
    float _145 = sin(_143);
    float _147 = _125 * 8.0;
    float _149 = sqrt(_141);
    float _151 = _139 + _145;
    float _153 = exp2(_147);
    float _155 = fma(_151, 0.25, 0.5);
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = fma(_149, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = fma(_157, -2.0, 3.0);
    float _165 = _157 * _157;
    float _167 = fma(_161, -2.0, 3.0);
    float _169 = _161 * _161;
    float _171 = _163 * _165;
    float _173 = _167 * _169;
    float _175 = fma(_171, -0.800000011920928955078125, 1.0);
    float _177 = -_153;
    float _179 = _177 + 1.0;
    float _181 = -_173;
    float _183 = _181 + 1.0;
    float _185 = -_175;
    float _187 = fma(_185, _179, 1.0);
    float _189 = _187 * _183;
    float _191 = fma(_189, -0.100000001490116119384765625, 0.189999997615814208984375);
    float _193 = fma(_189, 0.7400000095367431640625, 0.25);
    float _195 = abs(_79);
    float _197 = log2(_195);
    float _199 = precise::max(_191, _79);
    float _201 = _73 * _97;
    float _203 = _197 * 0.300000011920928955078125;
    float _205 = -_191;
    float _207 = _205 + _193;
    float _209 = precise::min(_193, _199);
    float _211 = 1.0 / _207;
    float _213 = -_191;
    float _215 = _213 + _209;
    float _217 = exp2(_203);
    float _219 = _215 * _211;
    float _221 = _183 * _217;
    float _223 = fma(_221, -0.60000002384185791015625, 1.0);
    float _225 = -_201;
    float _227 = fma(_201, 4.0, _225);
    float _229 = _219 * _223;
    float _231 = fma(_173, _227, _201);
    float _233 = _229 * _231;
    float _235 = _73 * _103;
    float _237 = 0.0 + _233;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _239 * _235;
    bool _245 = _241 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _247 = isnan(_241);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _253 = _249 || _251;
    float _255 = in.m_47.x;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_43.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    if (!_253)
    {
        discard_fragment();
    }
    float _267 = _73 * _259;
    float _269 = _73 * _265;
    float _271 = in.m_43.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = _267 * _269;
    float _279 = in.m_47.y;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = _73 * _283;
    float _287 = _73 * _275;
    float _289 = in.m_43.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = _285 * _287;
    float _297 = in.m_47.z;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = _295 * 0.699999988079071044921875;
    float _305 = _73 * _301;
    float _307 = _73 * _293;
    float _309 = _295 * 0.100000001490116119384765625;
    float _311 = _173 + 1.0;
    float _313 = _305 * _307;
    float _315 = fma(_277, 0.89999997615814208984375, _309);
    float _317 = fma(_277, 0.100000001490116119384765625, _303);
    float _319 = _315 * _311;
    float _321 = fma(_313, 0.20000000298023223876953125, _317);
    float _323 = _313 * _311;
    float _325 = _321 * _311;
    if (!_253)
    {
        out.m_50.x = _319;
        out.m_50.y = _325;
        out.m_50.z = _323;
        out.m_50.w = _233;
        return out;
    }
    float _327 = _325 * 0.715200006961822509765625;
    float _329 = 0.0 + _241;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = fma(_319, 0.2125999927520751953125, _327);
    bool _335 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _337 = fma(_323, 0.072200000286102294921875, _333);
    float _339 = 1.0 / _337;
    float _341 = _339 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = fma(_343, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _347 = _319 * _345;
    float _349 = _325 * _345;
    float _351 = _323 * _345;
    float _353 = _345;
    if (!_335)
    {
        _353 = _331;
    }
    float _355 = _353;
    bool _357 = !_335;
    float _359 = _355;
    if (!_357)
    {
        float _361 = in.m_52.w;
        float _363 = gl_FragCoord.w;
        float _365 = _361 * _363;
        float _367 = in.m_52.z;
        float _369 = gl_FragCoord.w;
        float _371 = _367 * _369;
        float _373 = _73 * _365;
        float _375 = _73 * _371;
        float _377 = 1.0 / _373;
        float _379 = _375 * _377;
        float _381 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _383 = fma(_379, (*spvDescriptorSet0.fp_c8)._m0[30].w, _381);
        float _385 = 1.0 / _383;
        float _387 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _389 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _391 = fma(_385, _387, _389);
        float _393 = _391 * 8.0;
        float _395 = precise::clamp(_393, 0.0, 1.0);
        float _397 = _331 * _395;
        _359 = _397;
    }
    float _399 = _359;
    float _401 = 0.0 + _399;
    float _403 = precise::clamp(_401, 0.0, 1.0);
    out.m_50.x = _347;
    out.m_50.y = _349;
    out.m_50.z = _351;
    out.m_50.w = _403;
    return out;
}

