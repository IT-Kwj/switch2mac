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
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = -_57;
    float _63 = _61 + 1.0;
    float2 _289 = float2(_57, _59);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_289, float2(0.0), isnan(_289))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_289, float2(0.0), isnan(_289))).x;
    float2 _300 = float2(_57, _59);
    float2 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_300, float2(0.0), isnan(_300))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_300, float2(0.0), isnan(_300))).xy;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = -_59;
    float _77 = _75 + 1.0;
    float _79 = _63 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _81 = _77 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float2 _326 = float2(_79, _81);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_326, float2(0.0), isnan(_326))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_326, float2(0.0), isnan(_326))).xy;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = gl_FragCoord.y;
    float _91 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _93 = _89 / _91;
    float _95 = gl_FragCoord.x;
    float _97 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _99 = _95 / _97;
    float _101 = (*spvDescriptorSet0.fp_c3)._m0[0].y * 0.5;
    float _103 = _93 + (-0.5);
    float _105 = _99 + (-0.5);
    bool _109 = _103 >= _101;
    bool _111 = isnan(_103);
    bool _113 = _109 || _111;
    bool _115 = isnan(_101);
    bool _117 = _113 || _115;
    bool _119 = _105 >= _101;
    bool _121 = isnan(_105);
    bool _123 = _119 || _121;
    bool _125 = isnan(_101);
    bool _127 = _123 || _125;
    float _129 = (*spvDescriptorSet0.fp_c3)._m0[0].x * 6.283185482025146484375;
    float _131 = _103;
    float _133 = _105;
    if (_117)
    {
        float _135 = -(*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _137 = _103 + _135;
        _131 = _137;
    }
    float _139 = _131;
    if (_127)
    {
        float _141 = -(*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _143 = _105 + _141;
        _133 = _143;
    }
    float _145 = _133;
    float _147 = _139 * _129;
    float _149 = _145 * _129;
    float _151 = _147 * _147;
    bool _153 = _149 != 0.0;
    bool _155 = isnan(_149);
    bool _157 = _153 || _155;
    bool _159 = isnan(0.0);
    bool _161 = _157 || _159;
    float _163 = fma(_149, _149, _151);
    bool _165 = _147 == 0.0;
    bool _167 = !_161;
    bool _169 = _165 && _167;
    float _171 = sqrt(_163);
    float _173 = precise::max(_171, 9.9999999392252902907785028219223e-09);
    float _175 = 1.0 / _173;
    float _177 = _149 * _175;
    float _179 = _177 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _181 = _65 * 0.15915493667125701904296875;
    float _183 = _181 * 6.283185482025146484375;
    float _185 = sin(_183);
    float _187 = _181 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = _185 * _73;
    float _193 = _185 * _71;
    float _195 = _185 * _85;
    float _197 = _185 * _87;
    float _199 = -_191;
    float _201 = fma(_189, _71, _199);
    float _203 = fma(_189, _73, _193);
    float _205 = -_87;
    float _207 = -_195;
    float _209 = fma(_189, _205, _207);
    float _211 = _147 * _175;
    float _213 = -_197;
    float _215 = fma(_189, _85, _213);
    float _217 = _203 + _209;
    float _219 = _211 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _221 = _201 + _215;
    float _223 = -_217;
    float _225 = fma(_217, _179, _223);
    float _227 = _217 * _219;
    float _229 = _221 * _219;
    float _231 = -_179;
    float _233 = fma(_221, _231, _221);
    bool _235 = !_169;
    int _238 = _235 ? as_type<int>(_225) : 0;
    bool _240 = !_169;
    int _242 = _240 ? as_type<int>(_227) : 0;
    bool _244 = !_169;
    float _246 = -_229;
    int _248 = _244 ? as_type<int>(_246) : 0;
    bool _250 = !_169;
    int _252 = _250 ? as_type<int>(_233) : 0;
    out.m_34.x = as_type<float>(_238);
    out.m_34.y = as_type<float>(_252);
    out.m_34.z = as_type<float>(_242);
    out.m_34.w = as_type<float>(_248);
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = -_57;
    float _63 = _61 + 1.0;
    float2 _289 = float2(_57, _59);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_289, float2(0.0), isnan(_289))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_289, float2(0.0), isnan(_289))).x;
    float2 _300 = float2(_57, _59);
    float2 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_300, float2(0.0), isnan(_300))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_300, float2(0.0), isnan(_300))).xy;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = -_59;
    float _77 = _75 + 1.0;
    float _79 = _63 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _81 = _77 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float2 _326 = float2(_79, _81);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_326, float2(0.0), isnan(_326))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_326, float2(0.0), isnan(_326))).xy;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = gl_FragCoord.y;
    float _91 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _93 = _89 / _91;
    float _95 = gl_FragCoord.x;
    float _97 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _99 = _95 / _97;
    float _101 = (*spvDescriptorSet0.fp_c3)._m0[0].y * 0.5;
    float _103 = _93 + (-0.5);
    float _105 = _99 + (-0.5);
    bool _109 = _103 >= _101;
    bool _111 = isnan(_103);
    bool _113 = _109 || _111;
    bool _115 = isnan(_101);
    bool _117 = _113 || _115;
    bool _119 = _105 >= _101;
    bool _121 = isnan(_105);
    bool _123 = _119 || _121;
    bool _125 = isnan(_101);
    bool _127 = _123 || _125;
    float _129 = (*spvDescriptorSet0.fp_c3)._m0[0].x * 6.283185482025146484375;
    float _131 = _103;
    float _133 = _105;
    if (_117)
    {
        float _135 = -(*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _137 = _103 + _135;
        _131 = _137;
    }
    float _139 = _131;
    if (_127)
    {
        float _141 = -(*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _143 = _105 + _141;
        _133 = _143;
    }
    float _145 = _133;
    float _147 = _139 * _129;
    float _149 = _145 * _129;
    float _151 = _147 * _147;
    bool _153 = _149 != 0.0;
    bool _155 = isnan(_149);
    bool _157 = _153 || _155;
    bool _159 = isnan(0.0);
    bool _161 = _157 || _159;
    float _163 = fma(_149, _149, _151);
    bool _165 = _147 == 0.0;
    bool _167 = !_161;
    bool _169 = _165 && _167;
    float _171 = sqrt(_163);
    float _173 = precise::max(_171, 9.9999999392252902907785028219223e-09);
    float _175 = 1.0 / _173;
    float _177 = _149 * _175;
    float _179 = _177 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _181 = _65 * 0.15915493667125701904296875;
    float _183 = _181 * 6.283185482025146484375;
    float _185 = sin(_183);
    float _187 = _181 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = _185 * _73;
    float _193 = _185 * _71;
    float _195 = _185 * _85;
    float _197 = _185 * _87;
    float _199 = -_191;
    float _201 = fma(_189, _71, _199);
    float _203 = fma(_189, _73, _193);
    float _205 = -_87;
    float _207 = -_195;
    float _209 = fma(_189, _205, _207);
    float _211 = _147 * _175;
    float _213 = -_197;
    float _215 = fma(_189, _85, _213);
    float _217 = _203 + _209;
    float _219 = _211 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _221 = _201 + _215;
    float _223 = -_217;
    float _225 = fma(_217, _179, _223);
    float _227 = _217 * _219;
    float _229 = _221 * _219;
    float _231 = -_179;
    float _233 = fma(_221, _231, _221);
    bool _235 = !_169;
    int _238 = _235 ? as_type<int>(_225) : 0;
    bool _240 = !_169;
    int _242 = _240 ? as_type<int>(_227) : 0;
    bool _244 = !_169;
    float _246 = -_229;
    int _248 = _244 ? as_type<int>(_246) : 0;
    bool _250 = !_169;
    int _252 = _250 ? as_type<int>(_233) : 0;
    out.m_34.x = as_type<float>(_238);
    out.m_34.y = as_type<float>(_252);
    out.m_34.z = as_type<float>(_242);
    out.m_34.w = as_type<float>(_248);
    return main0_out_u{as_type<uint4>(out.m_34)};
}

