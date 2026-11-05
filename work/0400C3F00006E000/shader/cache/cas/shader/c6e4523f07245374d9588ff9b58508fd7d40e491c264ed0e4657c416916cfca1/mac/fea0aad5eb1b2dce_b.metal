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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture3d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture3d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _201 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_44.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_44.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _54;
    float _70 = _68 * _60;
    float _72 = _68 * _66;
    float2 _334 = float2(_70, _72);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_334, float2(0.0), isnan(_334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_334, float2(0.0), isnan(_334))).x;
    float2 _345 = float2(_70, _72);
    float4 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_345, float2(0.0), isnan(_345))).xyzw;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = _77.w;
    bool _89 = _74 >= 1.0;
    bool _91 = isnan(_74);
    bool _93 = _89 || _91;
    bool _95 = isnan(1.0);
    bool _97 = _93 || _95;
    if (_97)
    {
        out.m_47.x = _79;
        out.m_47.y = _81;
        out.m_47.z = _83;
        out.m_47.w = _85;
        return out;
    }
    float _99 = _72 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _101 = _70 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float2 _394 = float2(_101, _99);
    float3 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_394, float2(0.0), isnan(_394))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_394, float2(0.0), isnan(_394))).xyz;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = _81 * 0.715200006961822509765625;
    float _115 = fma(_79, 0.2125999927520751953125, _113);
    float _117 = fma(_83, 0.072200000286102294921875, _115);
    float _119 = 1.0 / _117;
    bool _121 = (*spvDescriptorSet0.fp_c3)._m0[5].z > 0.999000012874603271484375;
    float _123 = _119 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _129 = fma(_79, _127, _107);
    float _131 = fma(_81, _127, _109);
    float _133 = fma(_83, _127, _111);
    float _135 = _129 * 4.0;
    float _137 = _131 * 4.0;
    float _139 = _133 * 4.0;
    uint _142 = as_type<uint>(half2(float2(_135, _137)));
    uint _144 = as_type<uint>(half2(float2(_139, 0.0)));
    uint _146 = extract_bits(_142, 16u, 16u);
    float _148 = float(_146);
    int _151 = int(_142) & 32767;
    uint _153 = extract_bits(_144, 0u, 8u);
    int _155 = int(_153) & 255;
    uint _157 = extract_bits(_144, 8u, 8u);
    int _159 = int(_157) & 255;
    int _161 = _159 << 8;
    int _163 = _155 | _161;
    float _165 = float(uint(_151));
    float _167 = float(uint(_163));
    float _169 = fma(_165, 6.103515625e-05, -0.3125);
    float _171 = fma(_167, 6.103515625e-05, -0.3125);
    float _173 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _175 = fma(_148, 6.103515625e-05, -0.3125);
    float _177 = fma(_171, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _179 = fma(_175, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _181 = !_121;
    float _183 = (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _185 = (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _195;
    float _197;
    float _199;
    if (!_181)
    {
        float3 _535 = float3(_173, _179, _177);
        float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_535, float3(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_535, float3(0.0), isnan(_535))).xyz;
        float _189 = _187.x;
        float _191 = _187.y;
        float _193 = _187.z;
        _195 = _191;
        _197 = _189;
        _199 = _193;
        _201 = true;
    }
    else
    {
        bool _203 = (*spvDescriptorSet0.fp_c3)._m0[5].z >= 0.001000000047497451305389404296875;
        bool _205 = isnan((*spvDescriptorSet0.fp_c3)._m0[5].z);
        bool _207 = _203 || _205;
        bool _209 = isnan(0.001000000047497451305389404296875);
        bool _211 = _207 || _209;
        float3 _571 = float3(_173, _179, _177);
        float3 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_571, float3(0.0), isnan(_571))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_571, float3(0.0), isnan(_571))).xyz;
        float _215 = _213.x;
        float _217 = _213.y;
        float _219 = _213.z;
        float _221 = _135;
        float _223 = _109;
        float _225 = 0.0;
        float _227 = _217;
        float _229 = _215;
        _199 = _219;
        if (_211)
        {
            float3 _593 = float3(_173, _179, _177);
            float3 _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_593, float3(0.0), isnan(_593))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_593, float3(0.0), isnan(_593))).xyz;
            float _233 = _231.x;
            float _235 = _231.y;
            float _237 = _231.z;
            _221 = _233;
            _223 = _235;
            _225 = _237;
        }
        float _239 = _221;
        float _241 = _223;
        float _243 = _225;
        float _245 = _241;
        if (_211)
        {
            float _247 = -_217;
            float _249 = _247 + _241;
            _183 = _249;
        }
        float _251 = _183;
        if (_211)
        {
            float _253 = -_215;
            float _255 = _253 + _239;
            _185 = _255;
        }
        float _257 = _185;
        if (_211)
        {
            float _259 = -_219;
            float _261 = _259 + _243;
            _245 = _261;
        }
        float _263 = _245;
        if (_211)
        {
            float _265 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[5].z, _217);
            _227 = _265;
        }
        float _267 = _227;
        _195 = _267;
        if (_211)
        {
            float _269 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[5].z, _215);
            _229 = _269;
        }
        float _271 = _229;
        _197 = _271;
        if (_211)
        {
            float _273 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[5].z, _219);
            _199 = _273;
        }
    }
    _201 = false;
    float _275 = _195;
    float _277 = _197;
    float _279 = _199;
    float _281 = _275 * 0.715200006961822509765625;
    float _283 = fma(_277, 0.2125999927520751953125, _281);
    float _285 = fma(_279, 0.072200000286102294921875, _283);
    float _287 = 1.0 / _285;
    float _289 = _287 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = fma(_291, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _295 = _293 * _277;
    float _297 = _293 * _275;
    float _299 = _293 * _279;
    out.m_47.x = _295;
    out.m_47.y = _297;
    out.m_47.z = _299;
    out.m_47.w = _85;
    return out;
}

