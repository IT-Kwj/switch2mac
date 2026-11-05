#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c11 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c7 [[id(2)]];
    constant _16* vp_c6 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
};

struct main0_out
{
    float4 m_35 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(0)]];
    float4 m_32 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    bool _117 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _51 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _49;
    float _53 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _55 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _53;
    float _57 = _51 * _51;
    float _59 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _61 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _59;
    float _63 = fma(_55, _55, _57);
    float _65 = fma(_61, _61, _63);
    float _67 = sqrt(_65);
    bool _71 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _73 = isnan(_67);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _79 = _75 || _77;
    float _81 = _61;
    if (!_79)
    {
        _81 = 1.0;
    }
    float _83 = _81;
    bool _85 = !_79;
    float _87 = _83;
    if (!_85)
    {
        bool _89 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _91 = isnan(_67);
        bool _93 = _89 || _91;
        bool _95 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _97 = _93 || _95;
        if (!_97)
        {
            float _99 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _101 = _67 + _99;
            float _103 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _105 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _103;
            float _107 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _109 = _107 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _111 = 1.0 / _105;
            float _113 = _101 * _111;
            float _115 = fma(_113, _109, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _87 = _115;
            _117 = true;
        }
        else
        {
            bool _119 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _121 = isnan(_67);
            bool _123 = _119 || _121;
            bool _125 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _127 = _123 || _125;
            if (!_127)
            {
                float _129 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _131 = _67 + _129;
                float _133 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _135 = _133 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _137 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _139 = _137 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _141 = 1.0 / _135;
                float _143 = _131 * _141;
                float _145 = fma(_143, _139, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _87 = _145;
                _117 = true;
            }
            else
            {
                _87 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _117 = false;
    float _147 = _87;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    float _155 = _147 + (-1.0);
    float _157 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _159 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _161 = fma(_147, _151, _157);
    float _163 = fma(_147, _149, _159);
    float _165 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _167 = _161 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _169 = _161 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _171 = fma(_147, _153, _165);
    float _173 = _161 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _175 = fma(_163, (*spvDescriptorSet0.vp_c7)._m0[2].x, _167);
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c7)._m0[0].x, _169);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c7)._m0[1].x, _173);
    float _181 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[2].z, _175);
    float _183 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[0].z, _177);
    float _185 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[1].z, _179);
    float _187 = _181 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _189 = _183 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _191 = _185 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _195 = _187 + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _199 = _189 + _197;
    float _201 = _195 * _195;
    float _203 = fma(_199, _199, _201);
    float _205 = _191 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _207 = sqrt(_203);
    float _209 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[2].x, _205);
    float _211 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[2].z, _209);
    float _213 = _211 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _215 = _207 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _217 = _185;
    float _219 = _211;
    float _221 = _189;
    float _223 = _213;
    if (!_215)
    {
        _217 = _189;
    }
    float _225 = _217;
    float _227 = _225;
    if (!_215)
    {
        _219 = _187;
    }
    float _229 = _219;
    float _231 = _229;
    if (!_215)
    {
        _221 = _191;
    }
    float _233 = _221;
    bool _235 = !_215;
    float _237 = _233;
    if (!_235)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _243 = _207 + _241;
        float _245 = rsqrt(_203);
        float _247 = _243 * _239;
        float _249 = _191 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _251 = _247 * 0.15915493667125701904296875;
        float _253 = _251 * 6.283185482025146484375;
        float _255 = cos(_253);
        float _257 = _251 * 6.283185482025146484375;
        float _259 = sin(_257);
        float _261 = _255 + (-1.0);
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _265 = fma(_259, _249, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _267 = fma(_191, _255, _263);
        float _269 = _245 * _265;
        float _271 = _267 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _273 = fma(_199, _269, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _275 = fma(_195, _269, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _277 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].x, _271);
        float _279 = fma(_275, (*spvDescriptorSet0.vp_c4)._m0[2].z, _277);
        float _281 = _279 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _237 = _267;
        _227 = _273;
        _231 = _275;
        _223 = _281;
    }
    float _283 = _237;
    float _285 = _227;
    float _287 = _231;
    float _289 = _223;
    float _291 = _283 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _293 = _283 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _295 = in.m_32.x;
    float _297 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[1].x, _291);
    float _299 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[0].x, _293);
    float _301 = in.m_32.y;
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[1].z, _297);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[0].z, _299);
    float _307 = _303 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _309 = _305 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _311 = _307 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _313 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[9].x, _311);
    float _315 = _307 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _317 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[9].z, _313);
    float _319 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[10].x, _315);
    out.m_35.x = _295;
    float _321 = _317 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _323 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[10].z, _319);
    out.m_35.y = _301;
    float _325 = _321 * 10000.0;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _323 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _331 = _327 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _333 = _307 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _335 = _307 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _337 = fma(_331, (*spvDescriptorSet0.vp_c4)._m0[10].z, _329);
    float _339 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[7].x, _333);
    float _341 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[8].x, _335);
    float _343 = fma(_331, (*spvDescriptorSet0.vp_c4)._m0[9].z, _321);
    float _345 = 1.0 / _337;
    float _347 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[7].z, _339);
    float _349 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[8].z, _341);
    float _351 = _347 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _353 = _349 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _355 = _329 * _345;
    float _357 = _343 * _355;
    out.gl_Position.x = _351;
    out.gl_Position.y = _353;
    out.gl_Position.z = _357;
    out.gl_Position.w = _329;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    bool _117 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _51 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _49;
    float _53 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _55 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _53;
    float _57 = _51 * _51;
    float _59 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _61 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _59;
    float _63 = fma(_55, _55, _57);
    float _65 = fma(_61, _61, _63);
    float _67 = sqrt(_65);
    bool _71 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _73 = isnan(_67);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _79 = _75 || _77;
    float _81 = _61;
    if (!_79)
    {
        _81 = 1.0;
    }
    float _83 = _81;
    bool _85 = !_79;
    float _87 = _83;
    if (!_85)
    {
        bool _89 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _91 = isnan(_67);
        bool _93 = _89 || _91;
        bool _95 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _97 = _93 || _95;
        if (!_97)
        {
            float _99 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _101 = _67 + _99;
            float _103 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _105 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _103;
            float _107 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _109 = _107 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _111 = 1.0 / _105;
            float _113 = _101 * _111;
            float _115 = fma(_113, _109, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _87 = _115;
            _117 = true;
        }
        else
        {
            bool _119 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _121 = isnan(_67);
            bool _123 = _119 || _121;
            bool _125 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _127 = _123 || _125;
            if (!_127)
            {
                float _129 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _131 = _67 + _129;
                float _133 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _135 = _133 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _137 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _139 = _137 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _141 = 1.0 / _135;
                float _143 = _131 * _141;
                float _145 = fma(_143, _139, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _87 = _145;
                _117 = true;
            }
            else
            {
                _87 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _117 = false;
    float _147 = _87;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    float _155 = _147 + (-1.0);
    float _157 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _159 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _161 = fma(_147, _151, _157);
    float _163 = fma(_147, _149, _159);
    float _165 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _167 = _161 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _169 = _161 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _171 = fma(_147, _153, _165);
    float _173 = _161 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _175 = fma(_163, (*spvDescriptorSet0.vp_c7)._m0[2].x, _167);
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c7)._m0[0].x, _169);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c7)._m0[1].x, _173);
    float _181 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[2].z, _175);
    float _183 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[0].z, _177);
    float _185 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[1].z, _179);
    float _187 = _181 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _189 = _183 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _191 = _185 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _195 = _187 + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _199 = _189 + _197;
    float _201 = _195 * _195;
    float _203 = fma(_199, _199, _201);
    float _205 = _191 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _207 = sqrt(_203);
    float _209 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[2].x, _205);
    float _211 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[2].z, _209);
    float _213 = _211 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _215 = _207 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _217 = _185;
    float _219 = _211;
    float _221 = _189;
    float _223 = _213;
    if (!_215)
    {
        _217 = _189;
    }
    float _225 = _217;
    float _227 = _225;
    if (!_215)
    {
        _219 = _187;
    }
    float _229 = _219;
    float _231 = _229;
    if (!_215)
    {
        _221 = _191;
    }
    float _233 = _221;
    bool _235 = !_215;
    float _237 = _233;
    if (!_235)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _243 = _207 + _241;
        float _245 = rsqrt(_203);
        float _247 = _243 * _239;
        float _249 = _191 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _251 = _247 * 0.15915493667125701904296875;
        float _253 = _251 * 6.283185482025146484375;
        float _255 = cos(_253);
        float _257 = _251 * 6.283185482025146484375;
        float _259 = sin(_257);
        float _261 = _255 + (-1.0);
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _265 = fma(_259, _249, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _267 = fma(_191, _255, _263);
        float _269 = _245 * _265;
        float _271 = _267 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _273 = fma(_199, _269, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _275 = fma(_195, _269, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _277 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].x, _271);
        float _279 = fma(_275, (*spvDescriptorSet0.vp_c4)._m0[2].z, _277);
        float _281 = _279 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _237 = _267;
        _227 = _273;
        _231 = _275;
        _223 = _281;
    }
    float _283 = _237;
    float _285 = _227;
    float _287 = _231;
    float _289 = _223;
    float _291 = _283 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _293 = _283 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _295 = in.m_32.x;
    float _297 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[1].x, _291);
    float _299 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[0].x, _293);
    float _301 = in.m_32.y;
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[1].z, _297);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[0].z, _299);
    float _307 = _303 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _309 = _305 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _311 = _307 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _313 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[9].x, _311);
    float _315 = _307 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _317 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[9].z, _313);
    float _319 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[10].x, _315);
    out.m_35.x = _295;
    float _321 = _317 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _323 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[10].z, _319);
    out.m_35.y = _301;
    float _325 = _321 * 10000.0;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _323 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _331 = _327 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _333 = _307 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _335 = _307 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _337 = fma(_331, (*spvDescriptorSet0.vp_c4)._m0[10].z, _329);
    float _339 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[7].x, _333);
    float _341 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[8].x, _335);
    float _343 = fma(_331, (*spvDescriptorSet0.vp_c4)._m0[9].z, _321);
    float _345 = 1.0 / _337;
    float _347 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[7].z, _339);
    float _349 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[8].z, _341);
    float _351 = _347 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _353 = _349 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _355 = _329 * _345;
    float _357 = _343 * _355;
    out.gl_Position.x = _351;
    out.gl_Position.y = _353;
    out.gl_Position.z = _357;
    out.gl_Position.w = _329;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    bool _117 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _51 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _49;
    float _53 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _55 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _53;
    float _57 = _51 * _51;
    float _59 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _61 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _59;
    float _63 = fma(_55, _55, _57);
    float _65 = fma(_61, _61, _63);
    float _67 = sqrt(_65);
    bool _71 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _73 = isnan(_67);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _79 = _75 || _77;
    float _81 = _61;
    if (!_79)
    {
        _81 = 1.0;
    }
    float _83 = _81;
    bool _85 = !_79;
    float _87 = _83;
    if (!_85)
    {
        bool _89 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _91 = isnan(_67);
        bool _93 = _89 || _91;
        bool _95 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _97 = _93 || _95;
        if (!_97)
        {
            float _99 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _101 = _67 + _99;
            float _103 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _105 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _103;
            float _107 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _109 = _107 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _111 = 1.0 / _105;
            float _113 = _101 * _111;
            float _115 = fma(_113, _109, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _87 = _115;
            _117 = true;
        }
        else
        {
            bool _119 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _121 = isnan(_67);
            bool _123 = _119 || _121;
            bool _125 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _127 = _123 || _125;
            if (!_127)
            {
                float _129 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _131 = _67 + _129;
                float _133 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _135 = _133 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _137 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _139 = _137 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _141 = 1.0 / _135;
                float _143 = _131 * _141;
                float _145 = fma(_143, _139, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _87 = _145;
                _117 = true;
            }
            else
            {
                _87 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _117 = false;
    float _147 = _87;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    float _155 = _147 + (-1.0);
    float _157 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _159 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _161 = fma(_147, _151, _157);
    float _163 = fma(_147, _149, _159);
    float _165 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _167 = _161 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _169 = _161 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _171 = fma(_147, _153, _165);
    float _173 = _161 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _175 = fma(_163, (*spvDescriptorSet0.vp_c7)._m0[2].x, _167);
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c7)._m0[0].x, _169);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c7)._m0[1].x, _173);
    float _181 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[2].z, _175);
    float _183 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[0].z, _177);
    float _185 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[1].z, _179);
    float _187 = _181 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _189 = _183 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _191 = _185 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _195 = _187 + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _199 = _189 + _197;
    float _201 = _195 * _195;
    float _203 = fma(_199, _199, _201);
    float _205 = _191 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _207 = sqrt(_203);
    float _209 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[2].x, _205);
    float _211 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[2].z, _209);
    float _213 = _211 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _215 = _207 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _217 = _185;
    float _219 = _211;
    float _221 = _189;
    float _223 = _213;
    if (!_215)
    {
        _217 = _189;
    }
    float _225 = _217;
    float _227 = _225;
    if (!_215)
    {
        _219 = _187;
    }
    float _229 = _219;
    float _231 = _229;
    if (!_215)
    {
        _221 = _191;
    }
    float _233 = _221;
    bool _235 = !_215;
    float _237 = _233;
    if (!_235)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _243 = _207 + _241;
        float _245 = rsqrt(_203);
        float _247 = _243 * _239;
        float _249 = _191 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _251 = _247 * 0.15915493667125701904296875;
        float _253 = _251 * 6.283185482025146484375;
        float _255 = cos(_253);
        float _257 = _251 * 6.283185482025146484375;
        float _259 = sin(_257);
        float _261 = _255 + (-1.0);
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _265 = fma(_259, _249, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _267 = fma(_191, _255, _263);
        float _269 = _245 * _265;
        float _271 = _267 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _273 = fma(_199, _269, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _275 = fma(_195, _269, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _277 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].x, _271);
        float _279 = fma(_275, (*spvDescriptorSet0.vp_c4)._m0[2].z, _277);
        float _281 = _279 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _237 = _267;
        _227 = _273;
        _231 = _275;
        _223 = _281;
    }
    float _283 = _237;
    float _285 = _227;
    float _287 = _231;
    float _289 = _223;
    float _291 = _283 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _293 = _283 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _295 = in.m_32.x;
    float _297 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[1].x, _291);
    float _299 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[0].x, _293);
    float _301 = in.m_32.y;
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[1].z, _297);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[0].z, _299);
    float _307 = _303 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _309 = _305 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _311 = _307 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _313 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[9].x, _311);
    float _315 = _307 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _317 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[9].z, _313);
    float _319 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[10].x, _315);
    out.m_35.x = _295;
    float _321 = _317 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _323 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[10].z, _319);
    out.m_35.y = _301;
    float _325 = _321 * 10000.0;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _323 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _331 = _327 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _333 = _307 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _335 = _307 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _337 = fma(_331, (*spvDescriptorSet0.vp_c4)._m0[10].z, _329);
    float _339 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[7].x, _333);
    float _341 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[8].x, _335);
    float _343 = fma(_331, (*spvDescriptorSet0.vp_c4)._m0[9].z, _321);
    float _345 = 1.0 / _337;
    float _347 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[7].z, _339);
    float _349 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[8].z, _341);
    float _351 = _347 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _353 = _349 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _355 = _329 * _345;
    float _357 = _343 * _355;
    out.gl_Position.x = _351;
    out.gl_Position.y = _353;
    out.gl_Position.z = _357;
    out.gl_Position.w = _329;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

