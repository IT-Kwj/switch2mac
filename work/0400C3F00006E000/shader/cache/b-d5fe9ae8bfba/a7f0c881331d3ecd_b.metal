#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _38(thread const int& _745, thread const int& _746, thread const int& _747, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _750 = 1 + _746;
    float _752 = support_buffer._m5[_750].x;
    bool _756 = _752 == 1.0;
    if (_756)
    {
        return _745;
    }
    bool _758 = _752 < 0.0;
    if (_758)
    {
        float _760 = -_752;
        float _762 = float(_745);
        float _764 = _762 * _760;
        float _766 = gl_FragCoord.x;
        float _768 = gl_FragCoord.y;
        float _770 = (_747 != 0) ? _768 : _766;
        float _772 = mod(_770, _760);
        float _774 = _764 + _772;
        int _776 = int(_774);
        return _776;
    }
    float _778 = float(_745);
    float _780 = _778 * _752;
    int _782 = int(_780);
    return _782;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_29.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_29.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[4].x));
    float _58 = 1.0 / _42;
    float _60 = _58 * _48;
    float _62 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[4].y));
    float _64 = _60 * _56;
    float _66 = _58 * _54;
    float _68 = trunc(_64);
    float _70 = precise::max(_68, 0.0);
    uint _73 = uint(_70);
    float _75 = _66 * _62;
    float _77 = trunc(_75);
    float _79 = precise::max(_77, 0.0);
    uint _81 = uint(_79);
    int _83 = int(_73) + (-1);
    int _85 = int(_73) + 1;
    int _87 = int(_81) + (-1);
    int _89 = _83;
    int _91 = 0;
    int _93 = 0;
    int _95 = _38(_89, _91, _93, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _97 = int(_81);
    int _99 = 0;
    int _101 = 1;
    int _103 = _38(_97, _99, _101, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _107 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_95, _103)), 0).xyz;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    int _115 = _85;
    int _117 = 0;
    int _119 = 0;
    int _121 = _38(_115, _117, _119, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _123 = int(_81);
    int _125 = 0;
    int _127 = 1;
    int _129 = _38(_123, _125, _127, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _131 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_121, _129)), 0).xyz;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = _131.z;
    int _139 = int(_81) + 1;
    int _141 = int(_73);
    int _143 = 0;
    int _145 = 0;
    int _147 = _38(_141, _143, _145, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _149 = _87;
    int _151 = 0;
    int _153 = 1;
    int _155 = _38(_149, _151, _153, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _157 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_147, _155)), 0).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    int _165 = int(_73);
    int _167 = 0;
    int _169 = 0;
    int _171 = _38(_165, _167, _169, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _173 = _139;
    int _175 = 0;
    int _177 = 1;
    int _179 = _38(_173, _175, _177, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _181 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_171, _179)), 0).xyz;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    int _189 = int(_73);
    int _191 = 0;
    int _193 = 0;
    int _195 = _38(_189, _191, _193, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _197 = int(_81);
    int _199 = 0;
    int _201 = 1;
    int _203 = _38(_197, _199, _201, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _205 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_195, _203)), 0).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    float _213 = precise::min(_111, _135);
    float _215 = precise::min(_113, _137);
    float _217 = precise::min(_161, _213);
    float _219 = precise::min(_163, _215);
    float _221 = precise::max(_111, _135);
    float _223 = precise::min(_109, _133);
    float _225 = precise::max(_113, _137);
    float _227 = precise::min(_185, _217);
    float _229 = precise::min(_187, _219);
    float _231 = precise::max(_161, _221);
    float _233 = fma(_227, 4.0, -4.0);
    float _235 = precise::min(_159, _223);
    float _237 = fma(_229, 4.0, -4.0);
    float _239 = precise::max(_163, _225);
    float _241 = _163 + _113;
    float _243 = precise::max(_109, _133);
    float _245 = 1.0 / _233;
    float _247 = precise::max(_185, _231);
    float _249 = precise::min(_183, _235);
    float _251 = precise::max(_187, _239);
    float _253 = _187 + _241;
    float _255 = precise::max(_159, _243);
    float _257 = 1.0 / _247;
    float _259 = fma(_249, 4.0, -4.0);
    float _261 = precise::max(_183, _255);
    float _263 = 1.0 / _251;
    float _265 = -_247;
    float _267 = _265 + 1.0;
    float _269 = _267 * _245;
    float _271 = 1.0 / _237;
    float _273 = -_251;
    float _275 = _273 + 1.0;
    float _277 = _227 * _257;
    float _279 = _277 * 0.25;
    float _281 = -_279;
    float _283 = precise::max(_281, _269);
    float _285 = 1.0 / _261;
    float _287 = _229 * _263;
    float _289 = _287 * 0.25;
    float _291 = 1.0 / _259;
    float _293 = -_261;
    float _295 = _293 + 1.0;
    float _297 = _275 * _271;
    float _299 = -_289;
    float _301 = precise::max(_299, _297);
    float _303 = _249 * _285;
    float _305 = _303 * 0.25;
    float _307 = precise::max(_283, _301);
    float _309 = _295 * _291;
    float _311 = -_305;
    float _313 = precise::max(_311, _309);
    float _315 = precise::max(_313, _307);
    float _317 = _159 + _109;
    float _319 = _161 + _111;
    float _321 = _137 + _253;
    float _323 = precise::min(0.0, _315);
    float _325 = _183 + _317;
    float _327 = _185 + _319;
    float _329 = precise::max(_323, -0.1875);
    float _331 = _133 + _325;
    float _333 = _135 + _327;
    float _335 = _329 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _337 = fma(_335, 4.0, 1.0);
    float _339 = fma(_335, _331, _207);
    float _341 = fma(_335, _333, _209);
    float _343 = fma(_335, _321, _211);
    int _345 = ~as_type<int>(_337);
    int _347 = _345 + 2129764351;
    int _349 = _347 + 1;
    float _351 = -_337;
    float _353 = fma(_351, as_type<float>(_349), 2.0);
    float _355 = as_type<float>(_349) * _353;
    float _357 = _355 * _339;
    float _359 = _355 * _341;
    float _361 = _355 * _343;
    out.m_32.x = _357;
    out.m_32.y = _359;
    out.m_32.z = _361;
    out.m_32.w = 1.0;
    return out;
}

