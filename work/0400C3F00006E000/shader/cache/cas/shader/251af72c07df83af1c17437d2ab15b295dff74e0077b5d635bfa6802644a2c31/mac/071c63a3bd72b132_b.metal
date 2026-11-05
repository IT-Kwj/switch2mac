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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _171 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_40.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_40.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _306 = float2(_66, _68);
    float4 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_306, float2(0.0), isnan(_306))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_306, float2(0.0), isnan(_306))).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    bool _83 = (*spvDescriptorSet0.fp_c3)._m0[5].z > 0.999000012874603271484375;
    float _85 = _75 * 0.715200006961822509765625;
    float _87 = fma(_73, 0.2125999927520751953125, _85);
    float _89 = fma(_77, 0.072200000286102294921875, _87);
    float _91 = 1.0 / _89;
    float _93 = _91 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = fma(_95, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _99 = _73 * _97;
    float _101 = _99 * 4.0;
    float _103 = _75 * _97;
    float _105 = _103 * 4.0;
    float _107 = _77 * _97;
    float _109 = _107 * 4.0;
    uint _112 = as_type<uint>(half2(float2(_101, _105)));
    uint _114 = as_type<uint>(half2(float2(_109, 0.0)));
    uint _116 = extract_bits(_112, 16u, 16u);
    float _118 = float(_116);
    int _121 = int(_112) & 32767;
    uint _123 = extract_bits(_114, 0u, 8u);
    int _125 = int(_123) & 255;
    uint _127 = extract_bits(_114, 8u, 8u);
    int _129 = int(_127) & 255;
    int _131 = _129 << 8;
    int _133 = _125 | _131;
    float _135 = float(uint(_121));
    float _137 = float(uint(_133));
    float _139 = fma(_135, 6.103515625e-05, -0.3125);
    float _141 = fma(_137, 6.103515625e-05, -0.3125);
    float _143 = fma(_118, 6.103515625e-05, -0.3125);
    float _145 = fma(_141, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _147 = fma(_143, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _149 = fma(_139, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _151 = !_83;
    float _153 = 6.103515625e-05;
    float _165;
    float _167;
    float _169;
    if (!_151)
    {
        float3 _447 = float3(_149, _147, _145);
        float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_447, float3(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_447, float3(0.0), isnan(_447))).xyz;
        float _159 = _157.x;
        float _161 = _157.y;
        float _163 = _157.z;
        _165 = _161;
        _167 = _159;
        _169 = _163;
        _171 = true;
    }
    else
    {
        bool _173 = (*spvDescriptorSet0.fp_c3)._m0[5].z >= 0.001000000047497451305389404296875;
        bool _175 = isnan((*spvDescriptorSet0.fp_c3)._m0[5].z);
        bool _177 = _173 || _175;
        bool _179 = isnan(0.001000000047497451305389404296875);
        bool _181 = _177 || _179;
        float3 _483 = float3(_149, _147, _145);
        float3 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_483, float3(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_483, float3(0.0), isnan(_483))).xyz;
        float _185 = _183.x;
        float _187 = _183.y;
        float _189 = _183.z;
        float _191 = (*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _193 = (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _195 = 0.0;
        float _197 = _185;
        float _199 = _187;
        _169 = _189;
        if (_181)
        {
            float3 _507 = float3(_149, _147, _145);
            float3 _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_507, float3(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_507, float3(0.0), isnan(_507))).xyz;
            float _203 = _201.x;
            float _205 = _201.y;
            float _207 = _201.z;
            _191 = _203;
            _193 = _205;
            _195 = _207;
        }
        float _209 = _191;
        float _211 = _193;
        float _213 = _195;
        float _215 = _209;
        float _217 = _211;
        if (_181)
        {
            float _219 = -_185;
            float _221 = _219 + _209;
            _153 = _221;
        }
        float _223 = _153;
        if (_181)
        {
            float _225 = -_187;
            float _227 = _225 + _211;
            _215 = _227;
        }
        float _229 = _215;
        if (_181)
        {
            float _231 = -_189;
            float _233 = _231 + _213;
            _217 = _233;
        }
        float _235 = _217;
        if (_181)
        {
            float _237 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[5].z, _185);
            _197 = _237;
        }
        float _239 = _197;
        _167 = _239;
        if (_181)
        {
            float _241 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[5].z, _187);
            _199 = _241;
        }
        float _243 = _199;
        _165 = _243;
        if (_181)
        {
            float _245 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[5].z, _189);
            _169 = _245;
        }
    }
    _171 = false;
    float _247 = _165;
    float _249 = _167;
    float _251 = _169;
    float _253 = _247 * 0.715200006961822509765625;
    float _255 = fma(_249, 0.2125999927520751953125, _253);
    float _257 = fma(_251, 0.072200000286102294921875, _255);
    float _259 = 1.0 / _257;
    float _261 = _259 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = fma(_263, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _267 = _265 * _249;
    float _269 = _265 * _247;
    float _271 = _265 * _251;
    out.m_43.x = _267;
    out.m_43.y = _269;
    out.m_43.z = _271;
    out.m_43.w = _79;
    return out;
}

