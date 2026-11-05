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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _43;
    float _65 = _63 * _49;
    float _67 = _63 * _55;
    float _69 = _63 * _61;
    float _71 = _65 * _65;
    float _73 = fma(_67, _67, _71);
    float _75 = fma(_69, _69, _73);
    float _77 = rsqrt(_75);
    float _79 = (*spvDescriptorSet0.fp_c4)._m0[5].w + (-220.0);
    float _81 = precise::max(0.0, _79);
    float _83 = _67 * _77;
    float _85 = _69 * _77;
    float _87 = _65 * _77;
    float _89 = _83 * (*spvDescriptorSet0.fp_c4)._m0[7].w;
    float _91 = _85 * (*spvDescriptorSet0.fp_c4)._m0[7].w;
    float _93 = -_87;
    float _95 = -_81;
    float _97 = fma(_93, (*spvDescriptorSet0.fp_c4)._m0[7].w, _95);
    float _99 = _89 * _89;
    float _101 = _91 * _91;
    float _103 = _99 + _101;
    float _105 = sqrt(_103);
    bool _109 = _105 > (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _111 = _81;
    float _113 = _77;
    float _115 = _97;
    float _117 = _101;
    float _119 = _89;
    if (!_109)
    {
        _111 = _99;
    }
    float _121 = _111;
    float _123 = _121;
    if (!_109)
    {
        _113 = _91;
    }
    float _125 = _113;
    bool _127 = !_109;
    float _129 = _125;
    if (!_127)
    {
        float _131 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _133 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _135 = _105 + _133;
        float _137 = rsqrt(_103);
        float _139 = _135 * _131;
        float _141 = _97 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _143 = _139 * 0.15915493667125701904296875;
        float _145 = _143 * 6.283185482025146484375;
        float _147 = sin(_145);
        float _149 = _143 * 6.283185482025146484375;
        float _151 = cos(_149);
        float _153 = fma(_147, _141, (*spvDescriptorSet0.fp_c3)._m0[5].x);
        float _155 = _137 * _153;
        float _157 = _151 + (-1.0);
        float _159 = _89 * _155;
        float _161 = _157 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _163 = _91 * _155;
        float _165 = fma(_97, _151, _161);
        float _167 = _159 * _159;
        float _169 = _163 * _163;
        _115 = _165;
        _123 = _167;
        _117 = _169;
        _119 = _159;
        _129 = _163;
    }
    float _171 = _115;
    float _173 = _123;
    float _175 = _117;
    float _177 = _119;
    float _179 = _129;
    float _181 = fma(_171, _171, _173);
    float _183 = _181 + _175;
    float _185 = rsqrt(_183);
    float _187 = _185 * _171;
    float _189 = _185 * _177;
    float _191 = _185 * _179;
    float _193 = _187 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _195 = fma(_187, -0.5, 0.5);
    float _197 = -_193;
    float _199 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[1].x, _197);
    float _201 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[1].z, _199);
    float _203 = fma(_201, -0.5, 0.5);
    float _205 = fma(_201, 0.5, 0.5);
    float _207 = fma(_205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _209 = sqrt(_203);
    float _211 = fma(_205, _207, -0.212114393711090087890625);
    float _213 = fma(_205, _211, 1.570728778839111328125);
    float _215 = _209 * 0.636619746685028076171875;
    float _217 = -_213;
    float _219 = fma(_215, _217, 1.0);
    float2 _616 = float2(_219, _195);
    float4 _222 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_616, float2(0.0), isnan(_616))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_616, float2(0.0), isnan(_616))).xyzw;
    float _224 = _222.x;
    float _226 = _222.y;
    float _228 = _222.z;
    float _230 = _222.w;
    float _232 = _87 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _234 = _87 * (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _236 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[1].x, _232);
    float _238 = (*spvDescriptorSet0.fp_c4)._m0[9].z * 2.0;
    float _240 = abs(_234);
    bool _242 = _240 > 0.00999999977648258209228515625;
    float _244 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[1].z, _236);
    float _246 = fma((*spvDescriptorSet0.fp_c4)._m0[9].z, (*spvDescriptorSet0.fp_c4)._m0[9].z, 1.0);
    float _248 = _242 ? _234 : 0.00999999977648258209228515625;
    float _250 = -_238;
    float _252 = fma(_244, _250, _246);
    float _254 = _248 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _256 = abs(_252);
    float _258 = log2(_256);
    float _260 = (*spvDescriptorSet0.fp_c4)._m0[9].x * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _262 = -_254;
    float _264 = exp2(_262);
    float _266 = -_260;
    float _268 = exp2(_266);
    float _270 = _258 * 1.5;
    float _272 = 1.0 / _254;
    float _274 = -_264;
    float _276 = _274 + 1.0;
    float _278 = exp2(_270);
    float _280 = _268 * _276;
    float _282 = -(*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _284 = fma(_282, (*spvDescriptorSet0.fp_c4)._m0[9].z, 1.0);
    float _286 = _280 * _272;
    float _288 = (*spvDescriptorSet0.fp_c4)._m0[8].w * (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _290 = _286 * _288;
    float _292 = _278 * 12.56637096405029296875;
    float _294 = -_290;
    float _296 = exp2(_294);
    float _298 = 1.0 / _292;
    float _300 = -_296;
    float _302 = _300 + 1.0;
    float _304 = _284 * _298;
    float _306 = precise::min(_302, 1.0);
    float _308 = _304 * _306;
    float _310 = _230 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _316 = _226 + _314;
    float _318 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _320 = _224 + _318;
    float _322 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _324 = _228 + _322;
    float _326 = -_306;
    float _328 = _326 + 1.0;
    float _330 = fma(_312, _316, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _332 = fma(_312, _320, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _334 = fma(_312, _324, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _336 = _308 * (*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _338 = _308 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _340 = _308 * (*spvDescriptorSet0.fp_c4)._m0[7].z;
    float _342 = fma(_332, _328, _336);
    float _344 = fma(_330, _328, _338);
    float _346 = fma(_334, _328, _340);
    out.m_34.x = _342;
    out.m_34.y = _344;
    out.m_34.z = _346;
    out.m_34.w = 1.0;
    out.m_36.x = _342;
    out.m_36.y = _344;
    out.m_36.z = _346;
    out.m_36.w = 1.0;
    return out;
}

