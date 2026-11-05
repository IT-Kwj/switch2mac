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
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c5 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture3d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _225 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_42.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_42.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _52;
    float _68 = _66 * _58;
    float _70 = _66 * _64;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float2 _420 = float2(_68, _70);
    float4 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_420, float2(0.0), isnan(_420))).xyzw;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = _77.w;
    float2 _439 = float2(_72, _74);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_439, float2(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_439, float2(0.0), isnan(_439))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    bool _99 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _101 = isnan(0.0);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _107 = _103 || _105;
    float _109 = _58;
    float _111 = _66;
    if (_107)
    {
        float _113 = _81 * 0.715200006961822509765625;
        _109 = _113;
    }
    float _115 = _109;
    float _117 = _115;
    if (_107)
    {
        float _119 = fma(_79, 0.2125999927520751953125, _115);
        _117 = _119;
    }
    float _121 = _117;
    float _123 = 0.0;
    float _125 = _121;
    if (_107)
    {
        float _127 = fma(_83, 0.072200000286102294921875, _121);
        _123 = _127;
    }
    float _129 = _123;
    if (!_107)
    {
        _125 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _131 = _125;
    float _133 = _129;
    float _135 = _131;
    if (_107)
    {
        float _137 = 1.0 / _129;
        _133 = _137;
    }
    float _139 = _133;
    if (_107)
    {
        float _141 = _139 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _143 = precise::clamp(_141, 0.0, 1.0);
        _111 = _143;
    }
    float _145 = _111;
    if (_107)
    {
        float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _135 = _147;
    }
    float _149 = _135;
    float _151 = fma(_79, _149, _91);
    float _153 = fma(_81, _149, _93);
    float _155 = fma(_83, _149, _95);
    float _157 = _151 * 4.0;
    float _159 = _153 * 4.0;
    float _161 = _155 * 4.0;
    bool _163 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
    uint _166 = as_type<uint>(half2(float2(_157, _159)));
    uint _168 = as_type<uint>(half2(float2(_161, 0.0)));
    uint _170 = extract_bits(_166, 16u, 16u);
    float _172 = float(_170);
    int _175 = int(_166) & 32767;
    uint _177 = extract_bits(_168, 0u, 8u);
    int _179 = int(_177) & 255;
    uint _181 = extract_bits(_168, 8u, 8u);
    int _183 = int(_181) & 255;
    int _185 = _183 << 8;
    int _187 = _179 | _185;
    float _189 = float(uint(_175));
    float _191 = float(uint(_187));
    float _193 = fma(_189, 6.103515625e-05, -0.3125);
    float _195 = fma(_191, 6.103515625e-05, -0.3125);
    float _197 = fma(_193, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _199 = fma(_172, 6.103515625e-05, -0.3125);
    float _201 = fma(_195, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _203 = fma(_199, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _205 = !_163;
    float _207 = _195;
    float _209 = 6.103515625e-05;
    float _219;
    float _221;
    float _223;
    if (!_205)
    {
        float3 _633 = float3(_197, _203, _201);
        float3 _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_633, float3(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_633, float3(0.0), isnan(_633))).xyz;
        float _213 = _211.x;
        float _215 = _211.y;
        float _217 = _211.z;
        _219 = _215;
        _221 = _213;
        _223 = _217;
        _225 = true;
    }
    else
    {
        bool _227 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
        bool _229 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
        bool _231 = _227 || _229;
        bool _233 = isnan(0.001000000047497451305389404296875);
        bool _235 = _231 || _233;
        float3 _669 = float3(_197, _203, _201);
        float3 _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_669, float3(0.0), isnan(_669))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_669, float3(0.0), isnan(_669))).xyz;
        float _239 = _237.x;
        float _241 = _237.y;
        float _243 = _237.z;
        float _245 = 0.0;
        float _247 = 0.0;
        float _249 = as_type<float>(_166);
        float _251 = _239;
        float _253 = _241;
        _223 = _243;
        if (_235)
        {
            float3 _691 = float3(_197, _203, _201);
            float3 _255 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_691, float3(0.0), isnan(_691))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_691, float3(0.0), isnan(_691))).xyz;
            float _257 = _255.x;
            float _259 = _255.y;
            float _261 = _255.z;
            _245 = _257;
            _247 = _259;
            _249 = _261;
        }
        float _263 = _245;
        float _265 = _247;
        float _267 = _249;
        float _269 = _267;
        if (_235)
        {
            float _271 = -_239;
            float _273 = _271 + _263;
            _207 = _273;
        }
        float _275 = _207;
        if (_235)
        {
            float _277 = -_241;
            float _279 = _277 + _265;
            _209 = _279;
        }
        float _281 = _209;
        if (_235)
        {
            float _283 = -_243;
            float _285 = _283 + _267;
            _269 = _285;
        }
        float _287 = _269;
        if (_235)
        {
            float _289 = fma(_275, (*spvDescriptorSet0.fp_c4)._m0[5].z, _239);
            _251 = _289;
        }
        float _291 = _251;
        _221 = _291;
        if (_235)
        {
            float _293 = fma(_281, (*spvDescriptorSet0.fp_c4)._m0[5].z, _241);
            _253 = _293;
        }
        float _295 = _253;
        _219 = _295;
        if (_235)
        {
            float _297 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[5].z, _243);
            _223 = _297;
        }
    }
    _225 = false;
    float _299 = _219;
    float _301 = _221;
    float _303 = _223;
    bool _305 = _301 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _307 = isnan(_301);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _313 = _309 || _311;
    float _315 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _317 = fma(_303, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _319 = fma(_299, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _321 = _299 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _323 = isnan(_299);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _329 = _325 || _327;
    bool _331 = _303 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _333 = isnan(_303);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _339 = _335 || _337;
    float _341 = exp2(_315);
    float _343 = exp2(_319);
    float _345 = exp2(_317);
    float _347 = _301;
    float _349 = _299;
    float _351 = _303;
    if (_313)
    {
        float _353 = -_341;
        float _355 = _353 + 1.0;
        _347 = _355;
    }
    float _357 = _347;
    float _359 = _357 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_329)
    {
        float _361 = -_343;
        float _363 = _361 + 1.0;
        _349 = _363;
    }
    float _365 = _349;
    float _367 = _365 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_339)
    {
        float _369 = -_345;
        float _371 = _369 + 1.0;
        _351 = _371;
    }
    float _373 = _351;
    float _375 = _373 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_45.x = _359;
    out.m_45.y = _367;
    out.m_45.z = _375;
    out.m_45.w = _85;
    return out;
}

