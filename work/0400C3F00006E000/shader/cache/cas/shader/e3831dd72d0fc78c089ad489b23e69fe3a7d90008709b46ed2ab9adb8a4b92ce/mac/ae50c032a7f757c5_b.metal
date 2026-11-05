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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture3d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ESmplr_w [[id(14)]];
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
    bool _187 = false;
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
    float _72 = _68 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _74 = _70 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float2 _330 = float2(_68, _70);
    float4 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_330, float2(0.0), isnan(_330))).xyzw;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = _77.w;
    float2 _349 = float2(_72, _74);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_349, float2(0.0), isnan(_349))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    bool _99 = (*spvDescriptorSet0.fp_c3)._m0[5].z > 0.999000012874603271484375;
    float _101 = _81 * 0.715200006961822509765625;
    float _103 = fma(_79, 0.2125999927520751953125, _101);
    float _105 = fma(_83, 0.072200000286102294921875, _103);
    float _107 = 1.0 / _105;
    float _109 = _107 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = fma(_111, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _115 = fma(_79, _113, _91);
    float _117 = fma(_81, _113, _93);
    float _119 = fma(_83, _113, _95);
    float _121 = _115 * 4.0;
    float _123 = _117 * 4.0;
    float _125 = _119 * 4.0;
    uint _128 = as_type<uint>(half2(float2(_121, _123)));
    uint _130 = as_type<uint>(half2(float2(_125, 0.0)));
    uint _132 = extract_bits(_128, 16u, 16u);
    float _134 = float(_132);
    int _137 = int(_128) & 32767;
    uint _139 = extract_bits(_130, 0u, 8u);
    int _141 = int(_139) & 255;
    uint _143 = extract_bits(_130, 8u, 8u);
    int _145 = int(_143) & 255;
    int _147 = _145 << 8;
    int _149 = _141 | _147;
    float _151 = float(uint(_137));
    float _153 = float(uint(_149));
    float _155 = fma(_151, 6.103515625e-05, -0.3125);
    float _157 = fma(_153, 6.103515625e-05, -0.3125);
    float _159 = fma(_155, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _161 = fma(_134, 6.103515625e-05, -0.3125);
    float _163 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _165 = fma(_161, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _167 = !_99;
    float _169 = (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _171 = (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _181;
    float _183;
    float _185;
    if (!_167)
    {
        float3 _490 = float3(_159, _165, _163);
        float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_490, float3(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_490, float3(0.0), isnan(_490))).xyz;
        float _175 = _173.x;
        float _177 = _173.y;
        float _179 = _173.z;
        _181 = _177;
        _183 = _175;
        _185 = _179;
        _187 = true;
    }
    else
    {
        bool _189 = (*spvDescriptorSet0.fp_c3)._m0[5].z >= 0.001000000047497451305389404296875;
        bool _191 = isnan((*spvDescriptorSet0.fp_c3)._m0[5].z);
        bool _193 = _189 || _191;
        bool _195 = isnan(0.001000000047497451305389404296875);
        bool _197 = _193 || _195;
        float3 _526 = float3(_159, _165, _163);
        float3 _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_526, float3(0.0), isnan(_526))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_526, float3(0.0), isnan(_526))).xyz;
        float _201 = _199.x;
        float _203 = _199.y;
        float _205 = _199.z;
        float _207 = _121;
        float _209 = _93;
        float _211 = 0.0;
        float _213 = _203;
        float _215 = _201;
        _185 = _205;
        if (_197)
        {
            float3 _548 = float3(_159, _165, _163);
            float3 _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_548, float3(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_548, float3(0.0), isnan(_548))).xyz;
            float _219 = _217.x;
            float _221 = _217.y;
            float _223 = _217.z;
            _207 = _219;
            _209 = _221;
            _211 = _223;
        }
        float _225 = _207;
        float _227 = _209;
        float _229 = _211;
        float _231 = _227;
        if (_197)
        {
            float _233 = -_203;
            float _235 = _233 + _227;
            _169 = _235;
        }
        float _237 = _169;
        if (_197)
        {
            float _239 = -_201;
            float _241 = _239 + _225;
            _171 = _241;
        }
        float _243 = _171;
        if (_197)
        {
            float _245 = -_205;
            float _247 = _245 + _229;
            _231 = _247;
        }
        float _249 = _231;
        if (_197)
        {
            float _251 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[5].z, _203);
            _213 = _251;
        }
        float _253 = _213;
        _181 = _253;
        if (_197)
        {
            float _255 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[5].z, _201);
            _215 = _255;
        }
        float _257 = _215;
        _183 = _257;
        if (_197)
        {
            float _259 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[5].z, _205);
            _185 = _259;
        }
    }
    _187 = false;
    float _261 = _181;
    float _263 = _183;
    float _265 = _185;
    float _267 = _261 * 0.715200006961822509765625;
    float _269 = fma(_263, 0.2125999927520751953125, _267);
    float _271 = fma(_265, 0.072200000286102294921875, _269);
    float _273 = 1.0 / _271;
    float _275 = _273 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = fma(_277, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _281 = _279 * _263;
    float _283 = _279 * _261;
    float _285 = _279 * _265;
    out.m_45.x = _281;
    out.m_45.y = _283;
    out.m_45.z = _285;
    out.m_45.w = _85;
    return out;
}

