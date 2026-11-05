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
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture3d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
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
    bool _185 = false;
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
    float2 _320 = float2(_68, _70);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_320, float2(0.0), isnan(_320))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_320, float2(0.0), isnan(_320))).x;
    float2 _331 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_331, float2(0.0), isnan(_331))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_331, float2(0.0), isnan(_331))).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    bool _87 = _72 >= 1.0;
    bool _89 = isnan(_72);
    bool _91 = _87 || _89;
    bool _93 = isnan(1.0);
    bool _95 = _91 || _93;
    if (_95)
    {
        out.m_45.x = _77;
        out.m_45.y = _79;
        out.m_45.z = _81;
        out.m_45.w = _83;
        return out;
    }
    float _97 = _79 * 0.715200006961822509765625;
    float _99 = fma(_77, 0.2125999927520751953125, _97);
    bool _101 = (*spvDescriptorSet0.fp_c3)._m0[5].z > 0.999000012874603271484375;
    float _103 = fma(_81, 0.072200000286102294921875, _99);
    float _105 = 1.0 / _103;
    float _107 = _105 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _109 = precise::clamp(_107, 0.0, 1.0);
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _113 = _77 * _111;
    float _115 = _113 * 4.0;
    float _117 = _79 * _111;
    float _119 = _117 * 4.0;
    float _121 = _81 * _111;
    float _123 = _121 * 4.0;
    uint _126 = as_type<uint>(half2(float2(_115, _119)));
    uint _128 = as_type<uint>(half2(float2(_123, 0.0)));
    uint _130 = extract_bits(_126, 16u, 16u);
    float _132 = float(_130);
    int _135 = int(_126) & 32767;
    uint _137 = extract_bits(_128, 0u, 8u);
    int _139 = int(_137) & 255;
    uint _141 = extract_bits(_128, 8u, 8u);
    int _143 = int(_141) & 255;
    int _145 = _143 << 8;
    int _147 = _139 | _145;
    float _149 = float(uint(_135));
    float _151 = float(uint(_147));
    float _153 = fma(_149, 6.103515625e-05, -0.3125);
    float _155 = fma(_151, 6.103515625e-05, -0.3125);
    float _157 = fma(_132, 6.103515625e-05, -0.3125);
    float _159 = fma(_155, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _161 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _163 = fma(_153, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _165 = !_101;
    float _167 = (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _179;
    float _181;
    float _183;
    if (!_165)
    {
        float3 _494 = float3(_163, _161, _159);
        float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_494, float3(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_494, float3(0.0), isnan(_494))).xyz;
        float _173 = _171.x;
        float _175 = _171.y;
        float _177 = _171.z;
        _179 = _175;
        _181 = _173;
        _183 = _177;
        _185 = true;
    }
    else
    {
        bool _187 = (*spvDescriptorSet0.fp_c3)._m0[5].z >= 0.001000000047497451305389404296875;
        bool _189 = isnan((*spvDescriptorSet0.fp_c3)._m0[5].z);
        bool _191 = _187 || _189;
        bool _193 = isnan(0.001000000047497451305389404296875);
        bool _195 = _191 || _193;
        float3 _530 = float3(_163, _161, _159);
        float3 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_530, float3(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_530, float3(0.0), isnan(_530))).xyz;
        float _199 = _197.x;
        float _201 = _197.y;
        float _203 = _197.z;
        float _205 = (*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _207 = 0.0;
        float _209 = 0.0;
        float _211 = _199;
        float _213 = _201;
        _183 = _203;
        if (_195)
        {
            float3 _552 = float3(_163, _161, _159);
            float3 _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_552, float3(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_552, float3(0.0), isnan(_552))).xyz;
            float _217 = _215.x;
            float _219 = _215.y;
            float _221 = _215.z;
            _205 = _217;
            _207 = _219;
            _209 = _221;
        }
        float _223 = _205;
        float _225 = _207;
        float _227 = _209;
        float _229 = _223;
        float _231 = _225;
        if (_195)
        {
            float _233 = -_199;
            float _235 = _233 + _223;
            _167 = _235;
        }
        float _237 = _167;
        if (_195)
        {
            float _239 = -_201;
            float _241 = _239 + _225;
            _229 = _241;
        }
        float _243 = _229;
        if (_195)
        {
            float _245 = -_203;
            float _247 = _245 + _227;
            _231 = _247;
        }
        float _249 = _231;
        if (_195)
        {
            float _251 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[5].z, _199);
            _211 = _251;
        }
        float _253 = _211;
        _181 = _253;
        if (_195)
        {
            float _255 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[5].z, _201);
            _213 = _255;
        }
        float _257 = _213;
        _179 = _257;
        if (_195)
        {
            float _259 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[5].z, _203);
            _183 = _259;
        }
    }
    _185 = false;
    float _261 = _179;
    float _263 = _181;
    float _265 = _183;
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
    out.m_45.w = _83;
    return out;
}

