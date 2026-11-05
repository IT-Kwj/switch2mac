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
    bool _275 = false;
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
    float2 _388 = float2(_70, _72);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_388, float2(0.0), isnan(_388))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_388, float2(0.0), isnan(_388))).x;
    float2 _399 = float2(_70, _72);
    float4 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_399, float2(0.0), isnan(_399))).xyzw;
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
    float _99 = _70 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _101 = _72 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float2 _448 = float2(_99, _101);
    float3 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_448, float2(0.0), isnan(_448))).xyz;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = _72 + (-0.5);
    float _115 = _70 + (-0.5);
    float _117 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[7].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _119 = _115 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _121 = precise::max(0.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _123 = _117 * _117;
    bool _125 = (*spvDescriptorSet0.fp_c3)._m0[6].w > (-1.0999999631167156621813774108887e-06);
    float _127 = abs((*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _129 = -_127;
    float _131 = fma(_129, 2.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    bool _133 = (*spvDescriptorSet0.fp_c3)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
    bool _135 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].w);
    bool _137 = _133 || _135;
    bool _139 = isnan(-1.0999999631167156621813774108887e-06);
    bool _141 = _137 || _139;
    float _143 = fma(_119, _119, _123);
    float _145 = _81 * 0.715200006961822509765625;
    float _147 = precise::max(0.0, _131);
    float _149 = fma(_79, 0.2125999927520751953125, _145);
    float _151 = sqrt(_143);
    float _153 = fma(_83, 0.072200000286102294921875, _149);
    float _155 = -_147;
    float _157 = _121 + _155;
    float _159 = 1.0 / _153;
    float _161 = -_147;
    float _163 = _151 + _161;
    float _165 = 1.0 / _157;
    float _167 = _159 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = fma(_169, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _173 = _163 * _165;
    float _175 = precise::clamp(_173, 0.0, 1.0);
    int _178 = _141 ? 0 : 1;
    float _180 = fma(_175, -2.0, 3.0);
    int _182 = ~_178;
    int _184 = _182 + 1;
    int _186 = _184 + 1;
    float _188 = _175 * _175;
    int _190 = _186;
    if (!_125)
    {
        int _192 = ~_178;
        int _194 = _192 + 1;
        _190 = _194;
    }
    int _196 = _190;
    float _198 = fma(_188, _180, -0.5);
    float _200 = float(_196);
    float _202 = fma(_198, _200, 0.5);
    float _204 = precise::max(_202, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    bool _206 = _204 > 0.999000012874603271484375;
    float _208 = fma(_79, _171, _107);
    float _210 = fma(_81, _171, _109);
    float _212 = fma(_83, _171, _111);
    float _214 = _208 * 4.0;
    float _216 = _210 * 4.0;
    float _218 = _212 * 4.0;
    uint _221 = as_type<uint>(half2(float2(_214, _216)));
    uint _223 = as_type<uint>(half2(float2(_218, 0.0)));
    uint _225 = extract_bits(_221, 16u, 16u);
    float _227 = float(_225);
    int _229 = int(_221) & 32767;
    uint _231 = extract_bits(_223, 0u, 8u);
    int _233 = int(_231) & 255;
    uint _235 = extract_bits(_223, 8u, 8u);
    int _237 = int(_235) & 255;
    int _239 = _237 << 8;
    int _241 = _233 | _239;
    float _243 = float(uint(_229));
    float _245 = float(uint(_241));
    float _247 = fma(_243, 6.103515625e-05, -0.3125);
    float _249 = fma(_245, 6.103515625e-05, -0.3125);
    float _251 = fma(_247, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _253 = fma(_227, 6.103515625e-05, -0.3125);
    float _255 = fma(_249, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _257 = fma(_253, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _259 = !_206;
    float _269;
    float _271;
    float _273;
    if (!_259)
    {
        float3 _698 = float3(_251, _257, _255);
        float3 _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_698, float3(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_698, float3(0.0), isnan(_698))).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        _269 = _265;
        _271 = _263;
        _273 = _267;
        _275 = true;
    }
    else
    {
        bool _277 = _204 >= 0.001000000047497451305389404296875;
        bool _279 = isnan(_204);
        bool _281 = _277 || _279;
        bool _283 = isnan(0.001000000047497451305389404296875);
        bool _285 = _281 || _283;
        if (!_285)
        {
            float3 _735 = float3(_251, _257, _255);
            float3 _287 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_735, float3(0.0), isnan(_735))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_735, float3(0.0), isnan(_735))).xyz;
            float _289 = _287.x;
            float _291 = _287.y;
            float _293 = _287.z;
            _269 = _291;
            _271 = _289;
            _273 = _293;
            _275 = true;
        }
        else
        {
            float3 _754 = float3(_251, _257, _255);
            float3 _295 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_754, float3(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_754, float3(0.0), isnan(_754))).xyz;
            float _297 = _295.x;
            float _299 = _295.y;
            float _301 = _295.z;
            float3 _769 = float3(_251, _257, _255);
            float3 _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_769, float3(0.0), isnan(_769))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_769, float3(0.0), isnan(_769))).xyz;
            float _305 = _303.x;
            float _307 = _303.y;
            float _309 = _303.z;
            float _311 = -_297;
            float _313 = _305 + _311;
            float _315 = -_299;
            float _317 = _307 + _315;
            float _319 = -_301;
            float _321 = _309 + _319;
            float _323 = fma(_204, _313, _297);
            float _325 = fma(_204, _317, _299);
            float _327 = fma(_204, _321, _301);
            _269 = _325;
            _271 = _323;
            _273 = _327;
        }
    }
    _275 = false;
    float _329 = _269;
    float _331 = _271;
    float _333 = _273;
    float _335 = _329 * 0.715200006961822509765625;
    float _337 = fma(_331, 0.2125999927520751953125, _335);
    float _339 = fma(_333, 0.072200000286102294921875, _337);
    float _341 = 1.0 / _339;
    float _343 = _341 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = fma(_345, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _349 = _347 * _331;
    float _351 = _347 * _329;
    float _353 = _347 * _333;
    out.m_47.x = _349;
    out.m_47.y = _351;
    out.m_47.z = _353;
    out.m_47.w = _85;
    return out;
}

