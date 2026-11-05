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
    bool _211 = false;
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
    float2 _330 = float2(_66, _68);
    float4 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_330, float2(0.0), isnan(_330))).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    bool _83 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _85 = isnan(0.0);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _91 = _87 || _89;
    float _93 = _56;
    float _95 = _64;
    if (_91)
    {
        float _97 = _75 * 0.715200006961822509765625;
        _93 = _97;
    }
    float _99 = _93;
    float _101 = _99;
    if (_91)
    {
        float _103 = fma(_73, 0.2125999927520751953125, _99);
        _101 = _103;
    }
    float _105 = _101;
    float _107 = 0.0;
    float _109 = _105;
    if (_91)
    {
        float _111 = fma(_77, 0.072200000286102294921875, _105);
        _107 = _111;
    }
    float _113 = _107;
    if (!_91)
    {
        _109 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _115 = _109;
    float _117 = _113;
    float _119 = _115;
    if (_91)
    {
        float _121 = 1.0 / _113;
        _117 = _121;
    }
    float _123 = _117;
    if (_91)
    {
        float _125 = _123 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _127 = precise::clamp(_125, 0.0, 1.0);
        _95 = _127;
    }
    float _129 = _95;
    if (_91)
    {
        float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _119 = _131;
    }
    float _133 = _119;
    float _135 = _73 * _133;
    float _137 = _135 * 4.0;
    float _139 = _75 * _133;
    float _141 = _139 * 4.0;
    float _143 = _77 * _133;
    float _145 = _143 * 4.0;
    bool _147 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
    uint _150 = as_type<uint>(half2(float2(_137, _141)));
    uint _152 = as_type<uint>(half2(float2(_145, 0.0)));
    uint _154 = extract_bits(_150, 16u, 16u);
    float _156 = float(_154);
    int _159 = int(_150) & 32767;
    uint _161 = extract_bits(_152, 0u, 8u);
    int _163 = int(_161) & 255;
    uint _165 = extract_bits(_152, 8u, 8u);
    int _167 = int(_165) & 255;
    int _169 = _167 << 8;
    int _171 = _163 | _169;
    float _173 = float(uint(_159));
    float _175 = float(uint(_171));
    float _177 = fma(_173, 6.103515625e-05, -0.3125);
    float _179 = fma(_175, 6.103515625e-05, -0.3125);
    float _181 = fma(_177, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _183 = fma(_156, 6.103515625e-05, -0.3125);
    float _185 = fma(_179, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _187 = fma(_183, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _189 = !_147;
    float _191 = as_type<float>(_150);
    float _193 = _183;
    float _205;
    float _207;
    float _209;
    if (!_189)
    {
        float3 _530 = float3(_181, _187, _185);
        float3 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_530, float3(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_530, float3(0.0), isnan(_530))).xyz;
        float _199 = _197.x;
        float _201 = _197.y;
        float _203 = _197.z;
        _205 = _199;
        _207 = _201;
        _209 = _203;
        _211 = true;
    }
    else
    {
        bool _213 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
        bool _215 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
        bool _217 = _213 || _215;
        bool _219 = isnan(0.001000000047497451305389404296875);
        bool _221 = _217 || _219;
        float3 _566 = float3(_181, _187, _185);
        float3 _223 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_566, float3(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_566, float3(0.0), isnan(_566))).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        float _231 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _233 = (*spvDescriptorSet0.fp_c4)._m0[5].z;
        float _235 = 0.0;
        float _237 = _227;
        float _239 = _225;
        _209 = _229;
        if (_221)
        {
            float3 _590 = float3(_181, _187, _185);
            float3 _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_590, float3(0.0), isnan(_590))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_590, float3(0.0), isnan(_590))).xyz;
            float _243 = _241.x;
            float _245 = _241.y;
            float _247 = _241.z;
            _231 = _243;
            _233 = _245;
            _235 = _247;
        }
        float _249 = _231;
        float _251 = _233;
        float _253 = _235;
        float _255 = _251;
        if (_221)
        {
            float _257 = -_227;
            float _259 = _257 + _251;
            _191 = _259;
        }
        float _261 = _191;
        if (_221)
        {
            float _263 = -_225;
            float _265 = _263 + _249;
            _193 = _265;
        }
        float _267 = _193;
        if (_221)
        {
            float _269 = -_229;
            float _271 = _269 + _253;
            _255 = _271;
        }
        float _273 = _255;
        if (_221)
        {
            float _275 = fma(_261, (*spvDescriptorSet0.fp_c4)._m0[5].z, _227);
            _237 = _275;
        }
        float _277 = _237;
        _207 = _277;
        if (_221)
        {
            float _279 = fma(_267, (*spvDescriptorSet0.fp_c4)._m0[5].z, _225);
            _239 = _279;
        }
        float _281 = _239;
        _205 = _281;
        if (_221)
        {
            float _283 = fma(_273, (*spvDescriptorSet0.fp_c4)._m0[5].z, _229);
            _209 = _283;
        }
    }
    _211 = false;
    float _285 = _205;
    float _287 = _207;
    float _289 = _209;
    float _291 = _285 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _293 = _287 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _295 = _289 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_43.x = _291;
    out.m_43.y = _293;
    out.m_43.z = _295;
    out.m_43.w = _79;
    return out;
}

